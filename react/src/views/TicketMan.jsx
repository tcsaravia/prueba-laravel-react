import { useEffect, useState } from "react";
import axiosClient from "../axios-client.js";
import { Link } from "react-router-dom";
import { useStateContext } from "../context/ContextProvider.jsx";

export default function TicketMan() {
  const [tickets, setTickets] = useState([]);
  const [loading, setLoading] = useState(false);
  const { setNotification } = useStateContext();

  useEffect(() => {
    getTickets();
  }, []);

  const onDeleteClick = (ticket) => {
    if (!window.confirm("¿Estás seguro de que deseas eliminar este ticket?")) {
      return;
    }
    axiosClient
      .delete(`/ticket_mantenimiento/${ticket.id_ticket}`) // Ajustar la ruta según la API
      .then(() => {
        setNotification("El ticket se eliminó correctamente");
        getTickets();
      })
      .catch((error) => {
        console.error("Error al eliminar el ticket:", error);
      });
  };

  const getTickets = () => {
    setLoading(true);
    axiosClient
      .get("/ticket_mantenimiento")
      .then(({ data }) => {
        setLoading(false);
        setTickets(data.data);
      })
      .catch(() => {
        setLoading(false);
      });
  };

  return (
    <div>
      <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center" }}>
        <h1>Tickets de Mantenimiento</h1>
        <Link className="btn-add" to="/ticket_mantenimiento/new">
          Agregar nuevo
        </Link>
      </div>
      <div className="card animated fadeInDown">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>Descripción</th>
              <th>Estado</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {loading ? (
              <tr>
                <td colSpan="4" className="text-center">
                  Cargando...
                </td>
              </tr>
            ) : (
              tickets.map((ticket) => (
                <tr key={ticket.id_ticket}>
                  <td>{ticket.id_ticket}</td>
                  <td>{ticket.descripcion}</td>
                  <td>{ticket.estado}</td>
                  <td>
                    <Link className="btn-edit" to={`/ticket_mantenimiento/${ticket.id_ticket}`}>
                      Editar
                    </Link>
                    &nbsp;
                    <button className="btn-delete" onClick={(ev) => onDeleteClick(ticket)}>
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
