<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Panel Administrativo</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <h1>Bienvenido, Administrador</h1>
        <hr>
        <ul>
            <li><a href="MedicoControl?opcion=consultar">Gestionar Médicos</a></li>
            <li><a href="PacienteControl?opcion=consultar">Gestionar Pacientes</a></li>
            <li><a href="CitaMedicaControl?opcion=consultar">Ver todas las Citas</a></li>
            <li><a href="LogoutControl">Cerrar Sesión</a></li>
        </ul>
    </body>
</html>
