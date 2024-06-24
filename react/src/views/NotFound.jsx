import React from "react";
import {Link} from "react-router-dom";
import "../index.css"; // Archivo de estilos

export default function NotFound() {
    return (
        <div>
            <h1>404 Page Not Found</h1>
            <Link to="/" className="boton-inicio">Ir al inicio</Link>
        </div>
    )
}
