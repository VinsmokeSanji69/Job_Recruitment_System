<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RoleCategory extends Model
{
    protected $table = 'role_categories';

    protected $fillable = [
        'name',
    ];
}
