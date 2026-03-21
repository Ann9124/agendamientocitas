
<%@page import="dao.dominio.CitaMedica"%>
<%@page import="dao.datos.CitaMedicaDAO" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema IPS</title>
    </head>
    <body>

        <h1>Sistema IPS: Agendamiento de Citas</h1>
        <hr />
            <a href="doctores.jsp">Doctores</a>
            <a href="citamedicas.jsp">CitaMedicas</a>
            <a href="citas.jsp">Agenda</a>
        <hr />

        <% CitaMedicaDAO citamedicaDao = new CitaMedicaDAO();
            List<CitaMedica> citamedicas = citamedicaDao.seleccionarCitaMedicas();

            for (CitaMedica citamedica : citamedicas) {%>
        <h2><%=citamedica.getId()%> <form action="EliminarCitaMedica">
                <input type="submit" value="eliminar" />
                <input type="hidden" name="idCitaMedicaABorrar" value="<%=citamedica.getId()%>">
            </form></h2>    
            <% } %>

        <% // response.sendRedirect("CitaMedicaControl?opcion=consultar");%>
        
        
    </body>
</html>
