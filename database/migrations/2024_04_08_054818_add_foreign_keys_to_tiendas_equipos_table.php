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
        Schema::table('tiendas_equipos', function (Blueprint $table) {
            $table->foreign(['id_tienda'], 'tiendas_equipos_ibfk_1')->references(['id_tienda'])->on('tiendas')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['id_equipo'], 'tiendas_equipos_ibfk_2')->references(['id_equipo'])->on('equipos')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tiendas_equipos', function (Blueprint $table) {
            $table->dropForeign('tiendas_equipos_ibfk_1');
            $table->dropForeign('tiendas_equipos_ibfk_2');
        });
    }
};
