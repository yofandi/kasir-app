<?php

namespace App\Models;

use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class Category  extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'categories';

    protected $fillable = ['name', 'image', 'description'];

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
     * @return Relasi One to Many (Inverse) ke Product
     */
    public function products()
    {
        return $this->hasMany(Product::class);
    }

    /**
     * category image will get full-path result
     * @return Attribute
     */
    protected function image(): Attribute
    {
        return Attribute::make(
            get: fn($value) => asset('/storage/categories/' . $value),
        );
    }
}
