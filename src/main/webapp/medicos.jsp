
<%@page import="dao.dominio.Medico"%>
<%@page import="dao.datos.MedicoDAO" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema IPS</title>
    </head>
    <body>

        <h1>Sistema IPS: Gestion de Personal Medico</h1>
        <hr />
            <a href="pacientes.jsp">Doctores</a>
            <a href="medicos.jsp">Medicos</a>
            <a href="citas.jsp">Agenda</a>
        <hr />

        <% MedicoDAO medicoDao = new MedicoDAO();
            List<Medico> medicos = medicoDao.seleccionarMedicos();

            for (Medico medico : medicos) {%>
        <h2><%=medico.getNombre()%> <form action="EliminarMedico">
                <input type="submit" value="eliminar" />
                <input type="hidden" name="idMedicoABorrar" value="<%=medico.getId()%>">
            </form></h2>    
            <% } %>

        <% // response.sendRedirect("MedicoControl?opcion=consultar");%>
    </body>
</html>
