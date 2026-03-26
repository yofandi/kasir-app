<?php

namespace App\Exceptions;

use Exception;

class CartEmptyException extends Exception
{
    /**
     * Kode error khusus untuk exception ini
     */
    protected $code = 1001;

    /**
     * Konstruktor dengan pesan default
     */
    public function __construct(string $message = "Keranjang belanja kosong, tidak dapat memproses transaksi.", int $code = 0, \Throwable $previous = null)
    {
        parent::__construct($message, $code ?: $this->code, $previous);
    }
}
