<%@page import="dao.dominio.Login"%>
<%@page import="dao.dominio.Paciente"%>
<%@page import="dao.datos.PacienteDAO" %>
<%@page import="dao.dominio.CitaMedica" %>
<%@page import="dao.datos.CitaMedicaDAO" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema IPS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
        <link rel="stylesheet" type="text/css" href="agendamientocitas.css">
        <style type="text/css">

            .boton{
                background-color: #ffcccc;
                color: black;
                border: none;
                padding: 10px;
                cursor: pointer;
            }
            .links{
                background-color: #f9f9f9;
                width: 148px;
                display:none;
                position: absolute;
                z-index: 1;
            }
            .links a{
                text-decoration: none;
                color: black;
                display: block;
                padding: 13px;
            }
            .links a:hover{
                background-color: #f1f1f1;
            }
            .dropdown:hover .links{
                display:block;
            }
            .dropdown{
                position: relative;
                display: inline-block;
            }
            table, th, td{
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            }
            h1 {
                font-family: "Serif";
            }
            h1 {
                background: #f7f5f5;
                font-weight: bold;
                padding: 15px;
                border-top:2px solid #ff0080;
                border-bottom:2px solid #ff0080;
                ;
            }
            body {
                background-color: lightblue;
            }
            body {
                text-align: center;
            }


        </style>
    </head>
    <body> 
        <h1>Sistema IPS</h1>
        <hr />

        <%
            // 1. Intentamos obtener el usuario de la sesión
            Login login = (Login) session.getAttribute("Usuarioactivo");

            // 2. Si NO hay usuario, mostramos el formulario de Login
            if (login == null) {
        %>
        <form action="LoginControl" method="POST">
            <h3>Iniciar Sesión</h3>
            <label>Correo:</label>
            <input type="text" name="txtCorreo" required>

            <label>Password:</label>
            <input type="password" name="txtPass" required>

            <button type="submit">Ingresar</button>
        </form>
        <%
        } // 3. Si SI hay usuario (else), mostramos el menú y operaciones
        else {
        %>
        <p>Bienvenido: <%= login.getCorreo()%>
        <%@ include file="menu.jsp" %>
        <%
            } // Fin del bloque else
        %>

    </body>
</html>