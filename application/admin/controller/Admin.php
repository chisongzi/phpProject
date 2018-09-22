<?php
namespace app\admin\controller;
use think\DB;
use \think\facade\Cookie;
use \think\facade\Session;
use app\admin\controller\Permissions;
class Admin extends Permissions{
   public function index(){
        return $this->fetch();
    }
}
