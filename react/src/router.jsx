import {createBrowserRouter, Navigate} from "react-router-dom";
import Dashboard from "./Dashboard.jsx";
import DefaultLayout from "./components/DefaultLayout";
import GuestLayout from "./components/GuestLayout";
import Login from "./views/Login";
import NotFound from "./views/NotFound";
import Signup from "./views/Signup";
import Users from "./views/Users";
import UserForm from "./views/UserForm";
// Importar el componente Equipos
import Equipos from "./views/Equipos"; 
import EquipoForm from "./views/EquipoForm";
// Importar el componente Equipos
import Tiendas from "./views/Tiendas"; 
import TiendaForm from "./views/TiendaForm";
// Importar el componente Equipos
import TicketMan from "./views/TicketMan"; 
import TicketManForm from "./views/TicketManForm";


const router = createBrowserRouter([
  {
    path: '/',
    element: <DefaultLayout/>,
    children: [
      {
        path: '/',
        element: <Navigate to="/dashboard"/>
      },
      {
        path: '/dashboard',
        element: <Dashboard/>
      },
      {
        path: '/users',
        element: <Users/>
      },
      {
        path: '/users/new',
        element: <UserForm key="userCreate" />
      },
      {
        path: '/users/:id',
        element: <UserForm key="userUpdate" />
      },
      // Añadir las rutas para Equipos
      {
        path: '/equipos',
        element: <Equipos/>
      },
      {
        path: '/equipos/new',
        element: <EquipoForm key="EquipoCreate" />
      },
      {
        path: '/equipos/:id_equipo',
        element: <EquipoForm key="EquipoUpdate" />
      },
      // Añadir las rutas para Tiendas
      {
        path: '/tiendas',
        element: <Tiendas/>
      },
      {
        path: '/tiendas/new',
        element: <TiendaForm key="TiendaCreate" />
      },
      {
        path: '/tiendas/:id_tienda',
        element: <TiendaForm key="TiendaUpdate" />
      },
      // Añadir las rutas para Tiendas
      {
        path: '/ticket_mantenimiento',
        element: <TicketMan/>
      },
      {
        path: '/ticket_mantenimiento/new',
        element: <TicketManForm key="TicketManCreate" />
      },
      {
        path: '/ticket_mantenimiento/:id_tienda',
        element: <TicketManForm key="TicketManUpdate" />
      },
    ]
  },
  {
    path: '/',
    element: <GuestLayout/>,
    children: [
      {
        path: '/login',
        element: <Login/>
      },
      {
        path: '/signup',
        element: <Signup/>
      }
    ]
  },
  {
    path: "*",
    element: <NotFound/>
  }
])

export default router;
