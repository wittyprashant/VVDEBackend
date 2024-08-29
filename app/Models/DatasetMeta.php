<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Traits\EloquentGetTableNameTrait;

class DatasetMeta extends Model
{
    use EloquentGetTableNameTrait;

    protected $table = 'dataset_meta';

    protected $guarded = [];
}
