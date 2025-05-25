<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FixedPriceJob extends Model
{
    protected $table = 'fixed_price_jobs';

    protected $fillable = [
        'id',
        'price'
    ];

    public $timestamps = false;

    public function job(): BelongsTo
    {
        return $this->belongsTo(Job::class);
    }

    public function duration(): BelongsTo
    {
        return $this->belongsTo(Duration::class, 'id');
    }
}
