<?php


namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Equipo;
use Illuminate\Http\Request;

class EquipoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Obtener todos los equipos
        $equipos = Equipo::all();
        return response()->json(['data' => $equipos]);
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
            'nombre' => 'required|string|max:50',
            'tipo' => 'required|string|max:50',
            'numero_serie' => 'required|string|max:50',
            'estado' => 'required|string|max:20',
            'ubicacion' => 'required|in:almacen_softteam,tienda',
        ]);

        // Crear un nuevo equipo
        $equipo = Equipo::create($request->all());

        return response()->json(['message' => 'Equipo creado correctamente', 'data' => $equipo], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // Buscar el equipo por su ID
        $equipo = Equipo::findOrFail($id);
        return response()->json(['data' => $equipo]);
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
            'nombre' => 'string|max:50',
            'tipo' => 'string|max:50',
            'numero_serie' => 'string|max:50',
            'estado' => 'string|max:20',
            'ubicacion' => 'in:almacen_softteam,tienda',
        ]);

        // Buscar el equipo por su ID
        $equipo = Equipo::findOrFail($id);

        // Actualizar el equipo con los datos proporcionados
        $equipo->update($request->all());

        return response()->json(['message' => 'Equipo actualizado correctamente', 'data' => $equipo]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Buscar el equipo por su ID y eliminarlo
        $equipo = Equipo::findOrFail($id);
        $equipo->delete();

        return response()->json(['message' => 'Equipo eliminado correctamente']);
    }
}
