<?php
namespace app\index\controller;

use think\Controller;

class Index extends Controller
{
    public function index()
    {
        return $this ->fetch();
    }
    public function level()
    {
        echo("<script>console.log('controller--index--level');</script>");
        $this->model = model('index/level');
        $this->model->level();
        return json(array('code'=>200,'msg'=>'修改成功'));
    }
}
