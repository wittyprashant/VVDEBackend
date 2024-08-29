<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Traits\EloquentGetTableNameTrait;

class Material extends Model
{
    use EloquentGetTableNameTrait;

    protected $table = 'materials';

    protected $guarded = [];
}
