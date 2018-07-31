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

    public function addLevel()
    {
        if (request()->isPost()) {
            $param = input('post.');
            $this->model = model('index/levelModel');
            $result =  $this->model->addLevel($param);
            echo $result;
        }
    }
    public function deleteLevel()
    {
        if (request()->isPost()) {
            $param = input("post.");
            // file_put_contents('log.txt', json_encode($param));
            $this->model = model("index/levelModel");
            $result = $this->model->deleteLevel($param['id']);
            return $result;
        }
    }

    public function addService()
    {
        if (request()->isPost()) {
            $param = input('post.');
            $this->model = model("index/ServiceModel");
            $result = $this->model->addService($param);
            return $result;
        }
    }

    public function deleteService()
    {
        if (request()->isPost()) {
            $param = input('post.');
            $this->model = model("index/ServiceModel");
            $result = $this->model->deleteService($param['id']);
            return $result;
        }
    }
}
