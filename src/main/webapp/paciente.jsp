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
<p>Bienvenido al sistema</p>
<%@ include file="menu.jsp" %>
<% 
    Integer idPaciente = Integer.valueOf(request.getParameter("idPacienteaConsultar"));
    session.setAttribute("IDPACIENTEMODIFICAR", idPaciente);
    PacienteDAO pacienteDao = new PacienteDAO();
    Paciente paciente = pacienteDao.getItem(idPaciente);
%>
<div class="container mt-5 mb-5">
    <form method="POST" action="PacienteControl">
        
        <div class="row">
            <div class="col-lg-7 mb-4">
                <div class="card shadow h-100">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">Información del Paciente</h4>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" value="<%=paciente.getNombre()%>">
                        </div>
                        <div class="mb-3">
                            <label for="apellido" class="form-label">Apellido:</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" value="<%=paciente.getApellido()%>">
                        </div>
                        <div class="mb-3">
                            <label for="fechaNaci" class="form-label">Fecha Nacimiento:</label>
                            <input type="date" class="form-control" id="fechaNaci" name="fechaNaci" value="<%=paciente.getFechaNaci()%>">
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono:</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" value="<%=paciente.getTelefono()%>">
                        </div>
                        
                        <div class="d-flex gap-2 justify-content-end mt-4">
                            <a href="pacientes.jsp" class="btn btn-outline-secondary btn-sm">Volver</a>
                            <button type="submit" class="btn btn-success btn-sm">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>

           <% 
    DetalleCitaMedicaDAO citasDao = new DetalleCitaMedicaDAO();
    List<DetalleCitaMedica> citas = citasDao.listarCitasPorPaciente(idPaciente);
%>             
                        
            <div class="col-lg-5 mb-4">
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
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (DetalleCitaMedica cita : citas) {%>
                                    <tr>
                                        <td><%=cita.getFechaHora()%></td>
                                        <td><%=cita.getNombreMedico()%></td>
                                        <td><%=cita.getEstado()%></td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>

                        <div class="mt-auto pt-3 border-top">
                            <div class="d-grid gap-2">
                                <button type="button" class="btn btn-primary">
                                    <i class="bi bi-calendar-plus"></i> Agregar Cita
                                </button>
                                <button type="button" class="btn btn-outline-danger">
                                    <i class="bi bi-calendar-x"></i> Eliminar Cita
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" name="opcion" value="actualizar" />
    </form>
</div>
                    
<%       }
%>
    </body>
</html>
