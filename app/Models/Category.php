<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Traits\EloquentGetTableNameTrait;

class Category extends Model
{
    use EloquentGetTableNameTrait;

    protected $table = 'categories';

    protected $guarded = [];
}
