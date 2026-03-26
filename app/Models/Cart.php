<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{

    public $incrementing = false;
    protected $keyType = 'string';
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'carts';

    protected $fillable = [
        'id',
        'cashier_id',
        'product_id',
        'qty',
        'price',
    ];

    // Relasi Many to One (Belongs To) ke Product
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    // Relasi Many to One (Belongs To) ke User (kasir)
    public function cashier()
    {
        return $this->belongsTo(User::class, 'cashier_id');
    }
}
