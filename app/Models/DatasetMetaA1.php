<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Traits\EloquentGetTableNameTrait;

class DatasetMetaA1 extends Model
{
    use EloquentGetTableNameTrait;

    protected $table = 'dataset_meta_a1';

    protected $guarded = [];
}
