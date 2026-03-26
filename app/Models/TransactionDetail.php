<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class TransactionDetail extends Model
{
    use HasUuids;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'Transaction_details';

    public $incrementing = false;

    protected $keyType = 'string';

    protected $fillable = ['transaction_id', 'product_id', 'qty', 'price'];

    // Relasi Many to One (Belongs To) ke Transaction
    public function transaction()
    {
        return $this->belongsTo(Transaction::class);
    }

    // Relasi Many to One (Belongs To) ke Product
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
