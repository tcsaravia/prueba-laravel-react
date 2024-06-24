<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Equipo extends Model
{
    use HasFactory;

    protected $table = 'equipos'; // Nombre de la tabla

    protected $primaryKey = 'id_equipo'; // Nombre de la columna del identificador
    public $timestamps = false;


    // Otros campos que podrías querer incluir...
    protected $fillable = [
        'nombre',
        'tipo',
        'numero_serie',
        'estado',
        'ubicacion',
    ];
}
