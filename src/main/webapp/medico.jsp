<%@page import="dao.dominio.ItemSencillo"%>
<%@page import="dao.datos.ItemSencilloDAO"%>
<%@page import="dao.dominio.DetalleCitaMedica"%>
<%@page import="dao.datos.DetalleCitaMedicaDAO"%>
<%@page import="dao.dominio.Paciente"%>
<%@page import="dao.datos.PacienteDAO"%>
<%@page import="dao.dominio.Usuario"%>
<%@page import="dao.dominio.Medico"%>
<%@page import="dao.datos.MedicoDAO" %>
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
        
        <%@ include file="menu.jsp" %>
        
        <% 
            Integer idMedico = Integer.valueOf(request.getParameter("idMedicoaConsultar"));
            session.setAttribute("IDMEDICOMODIFICAR", idMedico);
            MedicoDAO medicoDao = new MedicoDAO();
            Medico medico = medicoDao.getItem(idMedico);
            
            ItemSencilloDAO isDao = new ItemSencilloDAO();
            List<ItemSencillo> pacientes = isDao.getPacientes();
        %>

        <div class="container mt-5 mb-5">
            <div class="row">
                <div class="col">
                    <form method="POST" action="PacienteControl">
                        <input type="hidden" name="opcion" value="actualizar" />
                        <div class="card shadow h-100">
                            <div class="card-header bg-primary text-white">
                                <h4 class="mb-0">Información del Médico</h4>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre:</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%=medico.getNombre()%>">
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="form-label">Apellido:</label>
                                    <input type="text" class="form-control" id="apellido" name="apellido" value="<%=medico.getApellido()%>">
                                </div>
                                <div class="mb-3">
                                    <label for="telefono" class="form-label">Teléfono:</label>
                                    <input type="text" class="form-control" id="telefono" name="telefono" value="<%=medico.getTelefono()%>">
                                </div>
                                
                                <div class="card-foot" style="float: right;">                            
                                    <a href="pacientes.jsp" class="btn btn-outline-secondary btn-sm">Volver</a>
                                    <button type="submit" class="btn btn-success btn-sm">Guardar Cambios</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <% 
                    DetalleCitaMedicaDAO citasDao = new DetalleCitaMedicaDAO();
                    List<DetalleCitaMedica> citas = citasDao.listarCitasPorDoctor(idMedico);
                %>             
                                        
                <div class="col">
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
                                            <th>Paciente</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (DetalleCitaMedica cita : citas) { %>
                                            <tr>
                                                <td><%=cita.getFechaHora()%></td>
                                                <td><%=cita.getNombrePaciente()%></td>
                                                <td><%=cita.getEstado()%></td>
                                                
                                                <td class="text-center">
                                                    <form action="CitaMedicaControl" method="POST" style="display:inline;">
                                                        <input type="hidden" name="opcion" value="cancelarmedico">
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

                            <div class="card-foot" style="float: right;">  
            <button type="button" class="btn btn-primary shadow" data-bs-toggle="modal" data-bs-target="#myModal">
                <i class="fa-solid fa-plus me-2"></i>Nueva Cita
            </button>                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                    
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
                                
                                <input type="hidden" name="idMedico" value="<%=medico.getId()%>" />
                                <input type="hidden" name="opcion" value="crearDesdeMedico" />
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-success">Confirmar Cita</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
              
        <% 
            } // Cierre del else
        %>
    </body>
</html>