<?php
namespace app\index\model;

use think\Model;
use think\DB;
use app\index\model\BaseModel;

class LevelModel extends BaseModel
// class LevelModel extends Model
{
    public function level()
    {
        $result = DB::table('user_info')->where('user_id', 1)->find();
        $data=[
            'user_id'=>'2'
            ,'user_name'=>'测试1'
            ,'card_number'=>'123456'
        ];
        // DB::table('user_info')->insert($data);
    }

    public function levelList()
    {
        $data = DB::table('user_level')
                    ->field('level_id,level_name,sale_card_amount,validity,function,cards_num')
                    ->select();

        $return = ['code'=> 0,
                    'msg'=>"222",
                    'count'=>4,
                'data'=>(object)[]
            ];

        $return['data'] = $data;
        return json_encode($return);
    }
    public function addLevel($param)
    {
        $data=[
            "level_id"=>$param['levelId'],
            "level_name"=>$param['levelName'],
            "sale_card_amount"=>$param['saleAmount']
        ];
        $result = DB::name('user_level')->insert($data);
        file_put_contents('log.txt', json_encode($result));
        return $result;

    }
}
