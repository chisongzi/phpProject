<?php
namespace app\index\model;

use think\Model;
use think\DB;

class BaseModel extends Model
{
    public function logPrint($param)
    {
        file_put_contents('log.txt', $param);
    }
}
