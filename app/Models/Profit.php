<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Profit extends Model
{
    use HasUuids;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'profits';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = ['transaction_id', 'total'];

    // Relasi Many to One (Belongs To) ke Transaction
    public function transaction()
    {
        return $this->belongsTo(Transaction::class);
    }

    /**
     * change the date format in the created_at attribute.
     * @return Attribute
     */
    protected function createdAt(): Attribute
    {
        return Attribute::make(
            get: fn($value) => Carbon::parse($value)->format('d-M-Y H:i:s'),
        );
    }
}
