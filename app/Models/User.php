<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable; // Trait for auth methods
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract; // Interface
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;


class User extends Model implements AuthenticatableContract
{
    use Authenticatable;

    public $timestamps = false;
    protected $table = 'users';

    protected $fillable = [
        'first_name',
        'middle_name',
        'last_name',
        'email',
        'contact_number',
        'password',
        'desc_title',
        'desc_text',
        'experience_level_id',
        'english_level_id',
        'hourly_rate',
    ];

    protected $hidden = [
        'password',
    ];

    protected function casts(): array
    {
        return [
            'password' => 'hashed',
        ];
    }

    protected $appends = [
        'name',
    ];

    public function jobs()
    {
        return $this->hasMany(Job::class, 'user_id');
    }




    public function skills(): BelongsToMany
    {
        return $this->belongsToMany(
            Skill::class,
            'user_skills',
            'user_id',
            'skill_id'
        );
    }
}
