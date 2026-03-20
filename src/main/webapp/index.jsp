<%-- 
    Document   : index
    Created on : 18/03/2026, 4:35:14 p. m.
    Author     : sarri
--%>

<%@page import="dao.dominio.Paciente"%>
<%@page import="dao.datos.PacienteDAO" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paciente</title>
    </head>
    <body>
        
        <h1>XXXXXXX</h1>
        <% PacienteDAO pacienteDao = new PacienteDAO();
            List<Paciente> pacientes = pacienteDao.seleccionarPacientes();
            
            for (Paciente paciente : pacientes) { %>
            <h2><%=paciente.getNombre()%></h2>    
        <% } %>
        
        <% // response.sendRedirect("PacienteControl?opcion=consultar");%>
    </body>
</html>
