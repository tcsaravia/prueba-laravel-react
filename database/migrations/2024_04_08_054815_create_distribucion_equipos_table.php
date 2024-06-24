<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('distribucion_equipos', function (Blueprint $table) {
            $table->integer('id_registro')->primary();
            $table->integer('id_equipo')->index('distribucion_equipos_ibfk_1');
            $table->integer('id_tienda')->index('distribucion_equipos_ibfk_2');
            $table->dateTime('fecha_distribucion')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('distribucion_equipos');
    }
};
