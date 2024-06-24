import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axiosClient from "../axios-client.js";
import { useStateContext } from "../context/ContextProvider.jsx";

export default function TiendaForm() {
  const navigate = useNavigate();
  const { id_tienda } = useParams();
  const [tienda, setTienda] = useState({
    nombre: "",
    direccion: "",
    telefono: "",
  });
  const [errors, setErrors] = useState(null);
  const [loading, setLoading] = useState(false);
  const { setNotification } = useStateContext();

  useEffect(() => {
    if (id_tienda) {
      setLoading(true);
      axiosClient
        .get(`/tiendas/${id_tienda}`)
        .then(({ data }) => {
          setLoading(false);
          setTienda(data.data);
        })
        .catch(() => {
          setLoading(false);
        });
    }
  }, [id_tienda]);

  const onSubmit = (ev) => {
    ev.preventDefault();
    if (id_tienda) {
      axiosClient
        .put(`/tiendas/${id_tienda}`, tienda)
        .then(() => {
          setNotification("Tienda actualizada correctamente");
          navigate("/tiendas");
        })
        .catch((err) => {
          const response = err.response;
          if (response && response.status === 422) {
            setErrors(response.data.errors);
          }
        });
    } else {
      axiosClient
        .post("/tiendas", tienda)
        .then(() => {
          setNotification("Tienda creada correctamente");
          navigate("/tiendas");
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
    setTienda((prevTienda) => ({
      ...prevTienda,
      [name]: value,
    }));
  };

  return (
    <>
      <h1>{id_tienda ? `Editar Tienda: ${tienda.id_tienda}` : "Nueva Tienda"}</h1>
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
              value={tienda.nombre}
              onChange={handleChange}
              placeholder="Nombre"
            />
            <input
              name="direccion"
              value={tienda.direccion}
              onChange={handleChange}
              placeholder="Dirección"
            />
            <input
              name="telefono"
              value={tienda.telefono}
              onChange={handleChange}
              placeholder="Teléfono"
            />
            <button className="btn" type="submit">
              Guardar
            </button>
          </form>
        )}
      </div>
    </>
  );
}
