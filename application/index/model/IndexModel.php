<?php
namespace app\index\model;

use think\Model;
use think\DB;

class IndexModel extends Model
{
    public function test()
    {
        // echo "测试";
        $var =  DB::table('user_info')->where('id', 1)->find();
        echo $var['user_name'];
    }
}
