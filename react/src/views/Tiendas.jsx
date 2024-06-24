import React, { useEffect, useState } from "react";
import axiosClient from "../axios-client.js";
import {Link} from "react-router-dom";
import {useStateContext} from "../context/ContextProvider.jsx";

export default function Tiendas() {
    const [tiendas, setTiendas] = useState([]);
    const [loading, setLoading] = useState(false);
    const { setNotification } = useStateContext();
  
    useEffect(() => {
      getTiendas();
    }, []);
  
    const onDeleteClick = (tienda) => {
      if (!window.confirm("¿Estás seguro de que deseas eliminar esta tienda?")) {
        return;
      }
      axiosClient
        .delete(`/tiendas/${tienda.id_tienda}`)
        .then(() => {
          setNotification("La tienda se eliminó correctamente");
          getTiendas();
        })
        .catch((error) => {
          console.error("Error al eliminar la tienda:", error);
        });
    };
  
    const getTiendas = () => {
      setLoading(true);
      axiosClient
        .get("/tiendas")
        .then(({ data }) => {
          setLoading(false);
          setTiendas(data.data);
        })
        .catch(() => {
          setLoading(false);
        });
    };
  
    return (
      <div>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
          <h1>Tiendas</h1>
          <Link className="btn-add" to="/tiendas/new">
            Agregar nueva
          </Link>
        </div>
        <div className="card animated fadeInDown">
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan="5" className="text-center">
                    Cargando...
                  </td>
                </tr>
              ) : (
                tiendas.map((tienda) => (
                  <tr key={tienda.id_tienda}>
                    <td>{tienda.id_tienda}</td>
                    <td>{tienda.nombre}</td>
                    <td>{tienda.direccion}</td>
                    <td>{tienda.telefono}</td>
                    <td>
                      <Link className="btn-edit" to={`/tiendas/${tienda.id_tienda}`}>
                        Editar
                      </Link>
                      &nbsp;
                      <button className="btn-delete" onClick={(ev) => onDeleteClick(tienda)}>
                        Eliminar
                      </button>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
