<?php
namespace app\index\model;

use think\Model;
use think\DB;
use app\index\model\BaseModel;

class ServiceModel extends BaseModel
{
    public function serviceList()
    {
        $data = DB::table("user_services)")
                ->field('id,level_name,level_id,services_id,services_name,service_times)')
                ->where('is_del', 0)
                ->select();
        $return=['code'=>0,
                        'msg'=>"222",
                        'count'=>count($data),
                        'data'=>(object)[]
                    ];
        $return['data'] = $data;
        return json_encode($return);
    }

    public function addService($param)
    {
        
    }
    public function deleteService($id)
    {
        $result = DB::name('user_services')
                    ->where('id', $id)
                    ->data(['is_del'=>1])
                    ->update();
        return $result;
    }
}
