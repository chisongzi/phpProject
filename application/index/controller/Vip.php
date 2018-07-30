<?php
namespace app\index\controller;

use think\Controller;

class Vip extends Controller
{
    public function rights()
    {
        return  $this->fetch();
    }
    public function info()
    {
        return $this->fetch();
    }
    public function loyal()
    {
        return $this->fetch();
    }

    public function index()
    {
        $this->model = model('index/levelModel');
        $data = $this->model->levelList();
        echo $data;
    }
}
