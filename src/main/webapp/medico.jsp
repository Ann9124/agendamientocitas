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
<p>Bienvenido al sistema</p>
<%@ include file="menu.jsp" %>
<% 
    Integer idMedico = Integer.valueOf(request.getParameter("idMedicoaConsultar"));
    session.setAttribute("IDMEDICOMODIFICAR", idMedico);
    MedicoDAO medicoDao = new MedicoDAO();
    Medico medico = medicoDao.getItem(idMedico);
%>

    <form method="POST" action="MedicoControl">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h4 class="modal-title">Editar doctor</h4>
      </div>

      <div class="modal-body">
            <div class="mb-3 mt-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="nombre" class="form-control" id="nombre" placeholder="Nombre" name="nombre" value="<%=medico.getNombre()%>">
            </div>
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido:</label>
                <input type="apellido" class="form-control" id="apellido" placeholder="Apellido:" name="apellido" value="<%=medico.getApellido()%>">
            </div>          
            <div class="mb-3">
                <label for="telefono:" class="form-label">Telefono:</label>
                <input type="telefono:" class="form-control" id="telefono" placeholder="Telefono:" name="telefono" value="<%=medico.getTelefono()%>">
            </div>                    
      </div>
     <input type="hidden" name ="opcion" value ="actualizar" />
      <!-- Modal footer -->
      <div class="modal-footer d-flex gap-3">
         <a href="medicos.jsp" class="btn btn-outline-danger">Cancelar</a>
        <button type="submit" class="btn btn-outline-success">Confirmar</button>
      
     </div>
    </div>
  </div></form>
  <%       }
%>
    </body>
</html>
