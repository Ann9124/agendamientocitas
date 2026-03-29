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
<p><h4>Bienvenido:<%%></h4></p>
<%@ include file="menu.jsp" %>
<% 
    MedicoDAO medicoDao = new MedicoDAO();
    List<Medico> medicos = medicoDao.seleccionarMedicos();
%>

<!-- The Modal -->
<div class="modal fade" id="myModal">
    <form method="POST"
          action="MedicoControl">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Agregar doctor</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        
            <div class="mb-3 mt-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="nombre" class="form-control" id="nombre" placeholder="Nombre" name="nombre">
            </div>
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido:</label>
                <input type="apellido" class="form-control" id="apellido" placeholder="Apellido:" name="apellido">
            </div>
           
            <div class="mb-3">
                <label for="telefono:" class="form-label">Telefono:</label>
                <input type="telefono:" class="form-control" id="telefono" placeholder="Telefono:" name="telefono">
            </div>                    
      </div>
     <input type="hidden" name ="opcion" value ="agregar" />
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-outline-success" data-bs-dismiss="modal">Confirmar</button>
      </div>
     
    </div>
  </div>
        </form>
</div>

   
        
<table class="table table-hover table-striped">

    <thead class="table-dark">
        <tr>
            <td>ID</td>
            <td>NOMBRE</td>
            <td>APELLIDO</td>          
            <td>TELEFONO</td>
            <td>ELIMINAR</td>
            <td>EDITAR</td>
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
        <td><%=medico.getTelefono()%> </td>
        <td><form action="MedicoControl" method="POST">
    <button type="submit" class="btn-icon">
        <i class="fa-solid fa-trash"></i>
    </button>
    <input type="hidden" name="opcion" value="eliminar">
    <input type="hidden" name="idMedicoABorrar" value="<%=medico.getId()%>">
</form></td>
  <td><form action="medico.jsp" method="POST">
    <button type="submit" class="btn-icon">
        <i class="fa-solid fa-pen"></i>
    </button>
    <input type="hidden" name="opcion" value="consultar">
    <input type="hidden" name="idMedicoaConsultar" value="<%=medico.getId()%>">
</form></td>

            </tr>
<% } %>
    </tbody>
    
</table>       
     <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
    Agregar
  </button>

<%
    } 
%>
    </body>
</html>
