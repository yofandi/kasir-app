<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Transaction extends Model
{
    use HasUuids;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'transactions';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = ['cashier_id', 'customer_id', 'invoice', 'cash', 'change', 'discount', 'grand_total'];

    /**
     * Relasi Many to One (Belongs To) ke Customer
     * @return [type]
     */
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    /**
     * Relasi Many to One (Belongs To) ke User (kasir)
     * @return [type]
     */
    public function cashier()
    {
        return $this->belongsTo(User::class, 'cashier_id');
    }

    /**
     * Relasi One to Many (Inverse) ke TransactionDetail
     * @return [type]
     */
    public function details()
    {
        return $this->hasMany(TransactionDetail::class);
    }

    /**
     * Relasi One to Many (Inverse) ke Profit
     * @return [type]
     */
    public function profits()
    {
        return $this->hasMany(Profit::class);
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
