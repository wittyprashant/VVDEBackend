<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Traits\EloquentGetTableNameTrait;

class DatasetMetaA2 extends Model
{
    use EloquentGetTableNameTrait;

    protected $table = 'dataset_meta_a2';

    protected $guarded = [];
}
