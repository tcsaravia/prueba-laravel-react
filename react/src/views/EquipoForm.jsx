import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axiosClient from "../axios-client.js";
import { useStateContext } from "../context/ContextProvider.jsx";

export default function EquipoForm() {
    const navigate = useNavigate();
    const { id_equipo } = useParams();
    const [equipo, setEquipo] = useState({
      id_equipo: null,
      nombre: "",
      tipo: "",
      numero_serie: "",
      estado: "",
      ubicacion: "almacen_softteam", // Valor por defecto
    });
    const [errors, setErrors] = useState(null);
    const [loading, setLoading] = useState(false);
    const { setNotification } = useStateContext();
  
    useEffect(() => {
      if (id_equipo) {
        setLoading(true);
        axiosClient
          .get(`/equipos/${id_equipo}`)
          .then(({ data }) => {
            setLoading(false);
            setEquipo(data.data);
          })
          .catch(() => {
            setLoading(false);
          });
      }
    }, [id_equipo]);
  
   const onSubmit = (ev) => {
  ev.preventDefault();
  if (id_equipo) {
    axiosClient
      .put(`/equipos/${id_equipo}`, equipo)
      .then(() => {
        setNotification("Equipo actualizado correctamente");
        navigate("/equipos");
      })
      .catch((err) => {
        const response = err.response;
        if (response && response.status === 422) {
          setErrors(response.data.errors);
        }
      });
  } else {
    axiosClient.post('/equipos', equipo)
      .then(() => {
        setNotification("Equipo creado correctamente");
        navigate("/equipos");
      })
      .catch((err) => {
        const response = err.response;
        if (response && response.status === 422) {
          setErrors(response.data.errors);
        }
      });
  }
};

    const handleChange = (ev) => {
      const { name, value } = ev.target;
      setEquipo((prevEquipo) => ({
        ...prevEquipo,
        [name]: value,
      }));
    };
  
    return (
      <>
        <h1>{id_equipo ? `Editar Equipo: ${equipo.id_equipo}` : "Nuevo Equipo"}</h1>
        <div className="card animated fadeInDown">
          {loading && <div className="text-center">Cargando...</div>}
          {errors && (
            <div className="alert">
              {Object.keys(errors).map((key) => (
                <p key={key}>{errors[key][0]}</p>
              ))}
            </div>
          )}
          {!loading && (
            <form onSubmit={onSubmit}>
              <input
                name="nombre"
                value={equipo.nombre}
                onChange={handleChange}
                placeholder="Nombre"
              />
              <input
                name="tipo"
                value={equipo.tipo}
                onChange={handleChange}
                placeholder="Tipo"
              />
              <input
                name="numero_serie"
                value={equipo.numero_serie}
                onChange={handleChange}
                placeholder="Número de Serie"
              />
              <input
                name="estado"
                value={equipo.estado}
                onChange={handleChange}
                placeholder="Estado"
              />
              <select
                name="ubicacion"
                value={equipo.ubicacion}
                onChange={handleChange}
              >
                <option value="almacen_softteam">Almacén SoftTeam</option>
                <option value="tienda">Tienda</option>
              </select>
              <button className="btn" type="submit">
                Guardar
              </button>
            </form>
          )}
        </div>
      </>
    );
  }
  