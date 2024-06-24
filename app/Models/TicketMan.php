<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketMan extends Model
{
    use HasFactory;

    protected $table = 'ticket_mantenimiento';
    protected $primaryKey = 'id_ticket';
    public $timestamps = false;

    protected $fillable = [
        'descripcion',
        'fecha_creacion',
        'estado',
    ];
}
