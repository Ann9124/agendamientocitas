<%@page import="dao.dominio.DetalleCitaMedica"%>
<%@page import="dao.datos.DetalleCitaMedicaDAO"%>
<%@page import="dao.dominio.Paciente"%>
<%@page import="dao.datos.PacienteDAO"%>
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
        <title>Hospital Pedro León Alvarez Diaz</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        </style>
    </head>
    <body> 
        <h1>Hospital Pedro León Alvarez Diaz</h1>
        <hr />
       
<%
    Usuario usuario = (Usuario) session.getAttribute("Usuarioactivo");

    
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    } else {
%>
<p>Bienvenido al sistema: <%=usuario.getCorreo()%></p>
<%@ include file="menu.jsp" %>

<% 
DetalleCitaMedicaDAO citasDao = new DetalleCitaMedicaDAO();
List<DetalleCitaMedica> citas = citasDao.listarCitasPorDia("2026-03-28");
%>             
                        
                <div class="card shadow h-100">
                    <div class="card-header bg-dark text-white">
                        <h4 class="mb-0">Citas Recientes</h4>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <div class="table-responsive">
                            <table class="table table-hover table-sm">
                                <thead>
                                    <tr>
                                        <th>Fecha-Hora</th>
                                        <th>Médico</th>
                                        <th>Paciente</th>
                                        <th>Estado</th>
                                        <th>Cancelar</th>
                                    </tr>
                                </thead>
                                <tbody>
<% for (DetalleCitaMedica cita : citas) {%>
                                    <tr>
                                        <td><%=cita.getFechaHora()%></td>
                                        <td><%=cita.getNombreMedico()%></td>
                                        <td><%=cita.getNombrePaciente()%></td>
                                        <td><%=cita.getEstado()%></td>
                                        
                                        <td><form action="CitaMedicaControl" method="POST">
    <button type="submit" class="btn-icon">
            <i class="fa-solid fa-cancel"></i>
    </button>
    <input type="hidden" name="opcion" value="cancelar">
    <input type="hidden" name="idCitaACancelar" value="<%=cita.getId()%>">
</form></td>
                                    </tr>
<% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                    
<%       }
%>
    </body>
</html>
