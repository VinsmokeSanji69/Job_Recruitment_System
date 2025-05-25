<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Contract extends Model
{
    public $timestamps = false;
    protected $table = 'contracts';

    protected $fillable = [
        'job_id',
        'user_id',
        'pay_amount',
        'is_completed',
        'talent_rating',
        'talent_feedback',
        'client_rating',
        'client_feedback',

    ];

    protected $casts = [
        'created_at' => 'datetime',
        'is_completed' => 'boolean',
    ];

    public function job(): BelongsTo
    {
        return $this->belongsTo(Job::class);
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
    public static function countClientReviews($client_id)
    {
        return self::whereHas('job', function($query) use ($client_id) {
            $query->where('user_id', $client_id);
        })
            ->whereNotNull('talent_feedback')
            ->count();
    }


    public static function countClientHires($client_id)
    {
        return self::whereHas('job', function($query) use ($client_id) {
            $query->where('user_id', $client_id);
        })->count();
    }

    public static function getTatlentAverageRating($talent_id)
    {
        $avg = self::whereHas('job', function($query) use ($talent_id) {
            $query->where('user_id', $talent_id);
        })
            ->whereNotNull('talent_rating')
            ->avg('talent_rating');

        return $avg ? round($avg, 1) : 0;
    }

}
