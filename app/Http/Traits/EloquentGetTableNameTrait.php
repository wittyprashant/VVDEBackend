<?php

namespace App\Http\Traits;

trait EloquentGetTableNameTrait {
    public static function getTableName()
    {
        return ((new self)->getTable());
    }
}

?>