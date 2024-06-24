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
        Schema::create('equipos', function (Blueprint $table) {
            $table->integer('id_equipo')->primary();
            $table->string('nombre', 50);
            $table->string('tipo', 50);
            $table->string('numero_serie', 50);
            $table->string('estado', 20);
            $table->enum('ubicacion', ['almacen_softteam', 'tienda'])->default('almacen_softteam');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('equipos');
    }
};
