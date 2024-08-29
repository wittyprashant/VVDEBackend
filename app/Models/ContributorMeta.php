<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Traits\EloquentGetTableNameTrait;

class ContributorMeta extends Model
{
    use EloquentGetTableNameTrait;

    protected $table = 'contributor_meta';

    protected $guarded = [];
}
