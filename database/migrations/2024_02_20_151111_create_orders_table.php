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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('post_id')->nullable();;
            $table->foreignId('user_id')->nullable();
            $table->string('name')->nullable();
            $table->string('alamat')->nullable();
            $table->string('email')->nullable();
            $table->string('telepon')->nullable();
            $table->string('rekening')->nullable();
            $table->integer('no_rekening')->nullable();
            $table->decimal('price', 10, 2)->nullable();
            $table->integer('id_keranjang')->unique()->nullable();
            $table->decimal('price_keranjang', 10, 2)->nullable();;
            $table->integer('status_payment')->nullable();
            $table->datetime('batas_waktu_order')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
