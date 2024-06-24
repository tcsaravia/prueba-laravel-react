<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Tienda;
use Illuminate\Http\Request;

class TiendaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Obtener todas las tiendas
        $tiendas = Tienda::all();
        return response()->json(['data' => $tiendas]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validar los datos de entrada
        $request->validate([
            'nombre' => 'required|string|max:100',
            'direccion' => 'required|string|max:255',
            'telefono' => 'required|string|max:15',
        ]);

        // Crear una nueva tienda
        $tienda = Tienda::create($request->all());

        return response()->json(['message' => 'Tienda creada correctamente', 'data' => $tienda], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Buscar la tienda por su ID
        $tienda = Tienda::findOrFail($id);
        return response()->json(['data' => $tienda]);
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
        // Validar los datos de entrada
        $request->validate([
            'nombre' => 'string|max:100',
            'direccion' => 'string|max:255',
            'telefono' => 'string|max:15',
        ]);

        // Buscar la tienda por su ID
        $tienda = Tienda::findOrFail($id);

        // Actualizar la tienda con los datos proporcionados
        $tienda->update($request->all());

        return response()->json(['message' => 'Tienda actualizada correctamente', 'data' => $tienda]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Buscar la tienda por su ID y eliminarla
        $tienda = Tienda::findOrFail($id);
        $tienda->delete();

        return response()->json(['message' => 'Tienda eliminada correctamente']);
    }
}
