<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\TicketMan;
use App\Http\Controllers\Controller;

class TicketManController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tickets = TicketMan::all();
        return response()->json(['data' => $tickets]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'descripcion' => 'required|string|max:255',
            'estado' => 'required|string|max:20',
        ]);

        $ticket = TicketMan::create([
            'descripcion' => $request->descripcion,
            'estado' => $request->estado,
        ]);

        return response()->json(['message' => 'Ticket creado correctamente', 'data' => $ticket], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $ticket = TicketMan::findOrFail($id);
        return response()->json(['data' => $ticket]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'descripcion' => 'required|string|max:255',
            'estado' => 'required|string|max:20',
        ]);

        $ticket = TicketMan::findOrFail($id);
        $ticket->descripcion = $request->descripcion;
        $ticket->estado = $request->estado;
        $ticket->save();

        return response()->json(['message' => 'Ticket actualizado correctamente', 'data' => $ticket]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $ticket = TicketMan::findOrFail($id);
        $ticket->delete();

        return response()->json(['message' => 'Ticket eliminado correctamente']);
    }
}
