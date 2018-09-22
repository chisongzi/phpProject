<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

//admin 模块公共函数
/**
 * 管理员密码加密方式
 * @param $password 密码
 * @param $password_code 密码额外加密字符
 */
function password($password, $password_code = "mine")
{
    return md5(md5($password) . md5($password_code));
}
