<?php
namespace app\index\model;

use think\Model;
use think\DB;

class Level extends Model
{
    public function level()
    {
        echo("<script>console.log('model--index--test');</script>");
    }
}
