<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('customer_id');
            $table->string('invoice')->unique();
            $table->decimal('cash', 15, 2);
            $table->decimal('change', 15, 2);
            $table->decimal('discount', 15, 2)->default(0);
            $table->decimal('grand_total', 15, 2);
            $table->timestamps();

            $table->foreignId('cashier_id')->constrained('users')->cascadeOnDelete();
            $table->foreign('customer_id')->references('id')->on('customers')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');
    }
};
