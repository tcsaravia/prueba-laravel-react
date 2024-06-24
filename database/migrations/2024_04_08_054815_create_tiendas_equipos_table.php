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
        Schema::create('tiendas_equipos', function (Blueprint $table) {
            $table->integer('id_tienda');
            $table->integer('id_equipo')->index('tiendas_equipos_ibfk_2');
            $table->integer('cantidad');

            $table->primary(['id_tienda', 'id_equipo']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tiendas_equipos');
    }
};
