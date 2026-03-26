<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'customers';

    protected $fillable = ['name', 'no_telp', 'address'];


    public $incrementing = false; // penting!
    protected $keyType = 'string'; // karena pakai uuid

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = (string) Str::uuid();
            }
        });
    }
    /**
     * @return Relasi One to Many (Belongs To) ke Transaction (satu arah dari transaksi ke customer)
     */
    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }
}
