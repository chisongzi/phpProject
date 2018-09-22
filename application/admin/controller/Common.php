<?php
namespace app\admin\controller;

use think\Controller;
use think\DB;
use \think\facade\Cache;
use \think\facade\Cookie;
use \think\facade\Session;

class Common extends Controller
{

    /**
     * 登录
     */
    public function login()
    {
        if (Session::has('admin') == false) {
            if ($this->request->isPost()) {
                //是登录操作
                $post = $this->request->post();
               
                //验证 唯一规则：表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['name','require|alphaDash','用户名不能为空|用户名格式只能是字母、数字、——或_'],
                    ['password','require','密码不能为空'],
                    ['captcha','require|captcha','验证码不能为空|验证码不正确']
                ]);

                // //验证部分数据合法性
                // if (!$validate->check($post)) {
                //     $this->error('提交失败：' . $validate->getError());
                // }
                $name = Db::name('admin')->where('name', $post['name'])->find();
                if (empty($name)) {
                    //不存在该用户名
                    return $this->error('用户名不存在');
                } else {
                    //验证密码
                    $post['password'] = password($post['password']);
                    file_put_contents('log.txt',json_encode( $post['password']));
                    if ($name['password'] != $post['password']) {
                        return $this->error('密码错误');
                    } else {
                        //是否记住账号
                        if (!empty($post['remember']) and $post['remember'] == 1) {
                            //检查当前有没有记住的账号
                            if (Cookie::has('usermember')) {
                                Cookie::delete('usermember');
                            }
                            //保存新的
                            Cookie::forever('usermember', $post['name']);
                        } else {
                            //未选择记住账号，或属于取消操作
                            if (Cookie::has('usermember')) {
                                Cookie::delete('usermember');
                            }
                        }
                        Session::set("admin", $name['id']); //保存新的
                        Session::set("admin_cate_id", $name['admin_cate_id']); //保存新的
                        //记录登录时间和ip
                        Db::name('admin')->where('id', $name['id'])->update(['login_ip' => $this->request->ip(), 'login_time' => time()]);
                        //记录操作日志
                        // addlog();
                        return $this->success('登录成功,正在跳转...', 'admin/index/index');
                    }
                }
            } else {
                if (Cookie::has('usermember')) {
                    $this->assign('usermember', Cookie::get('usermember'));
                }
                return $this->fetch();
            }

        } else {
            $this->redirect('admin/index/index');
        }
    }

     /**
     * 管理员退出，清除名字为admin的session
     * @return [type] [description]
     */
    public function logout()
    {
        Session::delete('admin');
        Session::delete('admin_cate_id');
        if (Session::has('admin') or Session::has('admin_cate_id')) {
            return $this->error('退出失败');
        } else {
            return $this->success('正在退出...', 'admin/common/login');
        }
    }
}
