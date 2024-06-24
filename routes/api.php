<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\EquipoController;
use App\Http\Controllers\Api\TiendaController;                                 
use App\Http\Controllers\Api\TicketManController;                                 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::apiResource('/ticket_mantenimiento', TicketManController::class);

Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', function (Request $request) {
        
        return $request->user(); 
    });
    //Route::apiResource('/equipos', EquipoController::class);
    Route::apiResource('/equipos', EquipoController::class);
    Route::apiResource('/tiendas', TiendaController::class);

    Route::apiResource('/users', UserController::class);
});

Route::post('/signup', [AuthController::class, 'signup']);
Route::post('/login', [AuthController::class, 'login']);
