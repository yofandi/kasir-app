<?php

namespace App\Models;

use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Product extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'products';

    protected $fillable = ['category_id', 'title', 'image', 'barcode', 'description', 'buy_price', 'sell_price', 'stock'];

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
     * @return Relasi Many to One (Inverse) ke Category
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    /**
     * @return Relasi One to Many (Belongs To) ke Cart
     */
    public function carts()
    {
        return $this->hasMany(Cart::class);
    }

    /**
     * @return Relasi One to Many (Belongs To) ke TransactionDetails
     */
    public function transactionDetails()
    {
        return $this->hasMany(TransactionDetail::class);
    }

    /**
     * product image will get full-path result
     * @return Attribute
     */
    protected function image(): Attribute
    {
        return Attribute::make(
            get: fn($value) => asset('/storage/products/' . $value),
        );
    }
}
