import { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axiosClient from "../axios-client.js";
import { useStateContext } from "../context/ContextProvider.jsx";

export default function TicketManForm() {
  const navigate = useNavigate();
  const { id_ticket } = useParams();
  const [ticket, setTicket] = useState({
    id_ticket: null,
    descripcion: "",
    estado: "",
  });
  const [errors, setErrors] = useState(null);
  const [loading, setLoading] = useState(false);
  const { setNotification } = useStateContext();

  useEffect(() => {
    if (id_ticket) {
      setLoading(true);
      axiosClient
        .get(`/tickets/${id_ticket}`)
        .then(({ data }) => {
          setLoading(false);
          setTicket(data.data);
        })
        .catch(() => {
          setLoading(false);
        });
    }
  }, [id_ticket]);

  const onSubmit = (ev) => {
    ev.preventDefault();
    if (id_ticket) {
      axiosClient
        .put(`/tickets/${id_ticket}`, ticket)
        .then(() => {
          setNotification("Ticket actualizado correctamente");
          navigate("/tickets");
        })
        .catch((err) => {
          const response = err.response;
          if (response && response.status === 422) {
            setErrors(response.data.errors);
          }
        });
    } else {
      axiosClient
        .post("/tickets", ticket)
        .then(() => {
          setNotification("Ticket creado correctamente");
          navigate("/tickets");
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
    setTicket((prevTicket) => ({
      ...prevTicket,
      [name]: value,
    }));
  };

  return (
    <>
      <h1>{id_ticket ? `Editar Ticket: ${ticket.id_ticket}` : "Nuevo Ticket"}</h1>
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
              name="descripcion"
              value={ticket.descripcion}
              onChange={handleChange}
              placeholder="Descripción"
            />
            <input
              name="estado"
              value={ticket.estado}
              onChange={handleChange}
              placeholder="Estado"
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
