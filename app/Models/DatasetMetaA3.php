<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Traits\EloquentGetTableNameTrait;

class DatasetMetaA3 extends Model
{
    use EloquentGetTableNameTrait;

    protected $table = 'dataset_meta_a3';

    protected $guarded = [];
}
