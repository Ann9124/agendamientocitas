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
<meta charset="utf-8">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema IPS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
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
<p>Bienvenido al sistema</p>
<%@ include file="menu.jsp" %>
<% 
    MedicoDAO medicoDao = new MedicoDAO();
    List<Medico> medicos = medicoDao.seleccionarMedicos();
%>

<form>
<table style="float:right;">
    <tr>
        <td>NOMBRE</td><td><input type="text" /></td>
        <td>APELLIDO</td><td><input type="text" /></td>
        <td>FECHA NACIMIENTO</td><td><input type="text" /></td>
        <td>TELEFONO</td><td><input type="text" /></td>
    </tr>
</table>
</form>
        
<table class="table table-hover table-striped">

    <thead class="table-dark">
        <tr>
            <td>ID</td>
            <td>NOMBRE</td>
            <td>APELLIDO</td>
            <td>FECHA NACIMIENTO</td>
            <td>TELEFONO</td>
        </tr>
    </thead>
    <br>
    <br
        <br>
    <br>
    <tbody>
<% 
    for (Medico medico : medicos) {%>
    <tr>
        <td><%=medico.getId()%> </td>
        <td><%=medico.getNombre()%> </td>
        <td><%=medico.getApellido()%> </td>
        <td><%=medico.getFechaNaci()%> </td>
        <td><%=medico.getTelefono()%> </td>
        <td><form action="MedicoControl" method="POST">
    <button type="submit" class="btn-icon">
        <i class="fa-solid fa-trash"></i>
    </button>
    <input type="hidden" name="opcion" value="eliminar">
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
