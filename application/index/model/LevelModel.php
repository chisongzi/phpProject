<?php
namespace app\index\model;

use think\Model;
use think\DB;
use app\index\model\BaseModel;

class LevelModel extends BaseModel
// class LevelModel extends Model
{

    public function levelList()
    {
        $data = DB::table('user_level')
                    ->field('id,level_id,level_name,sale_card_amount,validity,function,cards_num')
                    ->where('is_del', 0)
                    ->select();

        $return = ['code'=> 0,
                    'msg'=>"222",
                    'count'=>count($data),
                'data'=>(object)[]
            ];

        $return['data'] = $data;
        return json_encode($return);
    }
    public function addLevel($param)
    {
        if ($param['function'] == "开启") {
            $status = 1;
        } else {
            $status =0;
        }

        $data=[
            "level_id"=>$param['levelId'],
            "level_name"=>$param['levelName'],
            "sale_card_amount"=>$param['saleAmount']
        ];
        $result = DB::name('user_level')->insert($data);
        file_put_contents('log.txt', json_encode($result));
        return $result;
    }

    public function deleteLevel($id)
    {
        $result =  DB::name('user_level')
        ->where('id', $id)
        ->data(['is_del'=>1])
        ->update();
        return $result;
    }
}
