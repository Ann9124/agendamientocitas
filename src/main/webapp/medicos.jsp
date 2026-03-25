<%@page import="dao.dominio.Medico"%>
<%@page import="dao.datos.MedicoDAO"%>
<%@page import="dao.dominio.Usuario"%>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
    Usuario usuario = (Usuario) session.getAttribute("Usuarioactivo");

    
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    } else {
%>
        <p>Bienvenido: <%= usuario.getCorreo()%>
<%@ include file="menu.jsp" %>
<% 
    MedicoDAO medicoDao = new MedicoDAO();
    List<Medico> medicos = medicoDao.seleccionarMedicos();
%>

<table>

    <thead>
        <tr>
            <td>ID</td>
            <td>NOMBRE</td>
            <td>APELLIDO</td>
            <td>FECHA NACIMIENTO</td>
            <td>TELEFONO</td>
        </tr>
    </thead>
    <tbody>
<% 
    for (Medico medico : medicos) {%>
    <tr>
        <td><%=medico.getId()%> </td>
        <td><%=medico.getNombre()%> </td>
        <td><%=medico.getApellido()%> </td>
        <td><%=medico.getFechaNaci()%> </td>
        <td><%=medico.getTelefono()%> </td>
        <td><form action="EliminarMedico" method="POST">
    <button type="submit" class="btn-icon">
        <i class="fa-solid fa-trash"></i>
    </button>
    <input type="hidden" name="idMedicoABorrar" value="<%=medico.getId()%>">
</form></td>    
            </tr>
<% } %>
    </tbody>
    
</table>        

<%
    } 
%>
    </body>
</html>
