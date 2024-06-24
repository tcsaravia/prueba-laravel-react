import { useEffect, useState } from "react";
import axiosClient from "../axios-client.js";
import {Link} from "react-router-dom";
import { useStateContext } from "../context/ContextProvider.jsx";

export default function Equipos() {
    const [equipos, setEquipos] = useState([]);
    const [loading, setLoading] = useState(false);
    const { setNotification } = useStateContext();
  
    useEffect(() => {
      getEquipos();
    }, []);
  
    const onDeleteClick = (equipo) => {
      if (!window.confirm("¿Estás seguro de que deseas eliminar este equipo?")) {
        return;
      }
      axiosClient
        .delete(`/equipos/${equipo.id_equipo}`)
        .then(() => {
          setNotification("El equipo se eliminó correctamente");
          getEquipos();
        })
        .catch((error) => {
          console.error("Error al eliminar el equipo:", error);
        });
    };
  
    const getEquipos = () => {
      setLoading(true);
      axiosClient
        .get("/equipos")
        .then(({ data }) => {
          setLoading(false);
          setEquipos(data.data);
        })
        .catch(() => {
          setLoading(false);
        });
    };
  
    return (
      <div>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
          <h1>Equipos</h1>
          <Link className="btn-add" to="/equipos/new">
            Agregar nuevo
          </Link>
        </div>
        <div className="card animated fadeInDown">
          <table>
            <thead>
              <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Número de serie</th>
                <th>Estado</th>
                <th>Ubicación</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {loading ? (
                <tr>
                  <td colSpan="7" className="text-center">
                    Cargando...
                  </td>
                </tr>
              ) : (
                equipos.map((equipo) => (
                  <tr key={equipo.id_equipo}>
                    <td>{equipo.id_equipo}</td>
                    <td>{equipo.nombre}</td>
                    <td>{equipo.tipo}</td>
                    <td>{equipo.numero_serie}</td>
                    <td>{equipo.estado}</td>
                    <td>{equipo.ubicacion}</td>
                    <td>
                      <Link className="btn-edit" to={`/equipos/${equipo.id_equipo}`}>
                        Editar
                      </Link>
                      &nbsp;
                      <button className="btn-delete" onClick={(ev) => onDeleteClick(equipo)}>
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
  