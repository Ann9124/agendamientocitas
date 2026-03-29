<%@page import="dao.dominio.ItemSencillo"%>
<%@page import="dao.datos.ItemSencilloDAO"%>
<%@page import="dao.dominio.Medico"%>
<%@page import="dao.datos.MedicoDAO"%>
<%@page import="dao.dominio.DetalleCitaMedica"%>
<%@page import="dao.datos.DetalleCitaMedicaDAO"%>
<%@page import="dao.dominio.Paciente"%>
<%@page import="dao.datos.PacienteDAO"%>
<%@page import="dao.dominio.Usuario"%>
<%@page import="dao.dominio.CitaMedica" %>
<%@page import="dao.datos.CitaMedicaDAO" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Pedro León Alvarez Diaz</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div class="container mt-4">
            <h1>Hospital Pedro León Alvarez Diaz</h1>
            <hr />

<%
    Usuario usuario = (Usuario) session.getAttribute("Usuarioactivo");

    if (usuario == null) {
        response.sendRedirect("index.jsp");
    } else {
%>
            
            <p>Bienvenido al sistema: <strong><%=usuario.getCorreo()%></strong></p>
<%@ include file="menu.jsp" %>

<% 
    String fechaSeleccionada = request.getParameter("fechaBuscar");
    
    if (fechaSeleccionada==null || fechaSeleccionada.isEmpty()) {
        fechaSeleccionada= "2026-03-01";
    }
    
    // Inicialización de DAOs y Listas
    DetalleCitaMedicaDAO citasDao = new DetalleCitaMedicaDAO();
    List<DetalleCitaMedica> citas = citasDao.listarCitasPorDia(fechaSeleccionada);

    ItemSencilloDAO isDao = new ItemSencilloDAO();
    List<ItemSencillo> medicos = isDao.getMedicos();
    List<ItemSencillo> pacientes = isDao.getPacientes();
%>        
            <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form method="POST" action="CitaMedicaControl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Agregar nueva cita</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="idMedico" class="form-label">Médico</label>
                                    <select id="idMedico" name="idMedico" class="form-select" required>
                                        <option value="" disabled selected>Seleccione un médico</option>
<% for(ItemSencillo item: medicos) { %>
                                            <option value="<%=item.getId()%>"><%=item.getNombre()%></option>
<% } %>
                                    </select>
                                </div>          

                                <div class="mb-3">
                                    <label for="idPaciente" class="form-label">Paciente</label>
                                    <select id="idPaciente" name="idPaciente" class="form-select" required>
                                        <option value="" disabled selected>Seleccione un paciente</option>
<% for(ItemSencillo item: pacientes) { %>
                                            <option value="<%=item.getId()%>"><%=item.getNombre()%></option>
<% } %>
                                    </select>
                                </div> 

                                <div class="mb-3">
                                    <label for="fechaHora" class="form-label">Fecha y Hora</label>
                                    <input type="datetime-local" class="form-control" id="fechaHora" name="fechaHora" required>
                                </div>
                                
                                <input type="hidden" name="opcion" value="crear" />
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-success">Confirmar Cita</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

    <div class="row">
        <div class="col">
        <form method="POST" action="citas.jsp">
                        <input type="hidden" name="opcion" value="actualizar" />
                        <div class="card shadow h-100">
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="fechaBuscar" class="form-label">Fecha:</label>
                                    <input type="date" class="form-control" id="fechaBuscar" name="fechaBuscar" value="<%=fechaSeleccionada%>">
                                    
                                    <input type="submit" class="btn btn-primary shadow" value="Seleccionar">
                                    
                                </div>
                            </div>
                        </div>
        </form>
        </div>
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-header bg-dark text-white">
                    <h4 class="mb-0">Citas Recientes</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-sm">
                            <thead class="table-light">
                                <tr>
                                    <th>Fecha-Hora</th>
                                    <th>Médico</th>
                                    <th>Paciente</th>
                                    <th>Estado</th>
                                    <th class="text-center">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
<% for (DetalleCitaMedica cita : citas) { %>
                                    <tr>
                                        <td><%=cita.getFechaHora()%></td>
                                        <td><%=cita.getNombreMedico()%></td>
                                        <td><%=cita.getNombrePaciente()%></td>
                                        <td>
                                            <span class="badge bg-info text-dark"><%=cita.getEstado()%></span>
                                        </td>
                                        <td class="text-center">
                                            <form action="CitaMedicaControl" method="POST" style="display:inline;">
                                                <input type="hidden" name="opcion" value="cancelar">
                                                <input type="hidden" name="idCitaACancelar" value="<%=cita.getId()%>"> 
                                                <button type="submit" class="btn btn-link text-danger p-0" title="Cancelar Cita">
                                                    <i class="fa-solid fa-calendar-xmark"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
<% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-primary shadow" data-bs-toggle="modal" data-bs-target="#myModal">
                <i class="fa-solid fa-plus me-2"></i>Nueva Cita
            </button>
        </div> 
    </div> 

<% } // Cierre del else %>
        </div>

        </body>
</html>