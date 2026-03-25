<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>        
        <div class="dropdown">        
        <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
            Opciones
         </button>
         <ul class="dropdown-menu">             
             <li><a class="dropdown-item" href="medicos.jsp">Doctor</a></li>
             <li><a class="dropdown-item" href="#">Paciente</a></li>
             <li><a class="dropdown-item" href="#">Salir</a></li>
         </ul>

        </div>             <br>
            <br>     
    </body>
</html>
