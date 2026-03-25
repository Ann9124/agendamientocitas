<%@page import="dao.dominio.Login"%>
<%@page import="dao.dominio.Paciente"%>
<%@page import="dao.datos.PacienteDAO" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema IPS</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <h1>Sistema IPS</h1>
        <hr />

        <%
            Login login = (Login) session.getAttribute("Loginactivo");
            if (login == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        
        <h1>Sistema IPS: Directorio de Pacientes</h1>
        <hr />
        <a href="doctores.jsp">Doctores</a>
        <a href="pacientes.jsp">Pacientes</a>
        <a href="citas.jsp">Agenda</a>
        <hr />

        <table>
            <% PacienteDAO pacienteDao = new PacienteDAO();
                List<Paciente> pacientes = pacienteDao.seleccionarPacientes();

                for (Paciente paciente : pacientes) {%>
            <tr>
                <td><%=paciente.getNombre()%></td><td> <form action="EliminarPaciente">
                        <input type="submit" value="eliminar" />
                        <input type="hidden" name="idPacienteABorrar" value="<%=paciente.getId()%>">
                    </form></td>    
            </tr>
            <% } %>
        </table>
        <% // response.sendRedirect("PacienteControl?opcion=consultar");%>
    </body>
</html>