<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital Pedro León Alvarez Diaz</title>        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
        <style>
                    h1 {
                font-family: "Serif";
            }
            h1 {
                background: #f7f5f5;
                font-weight: bold;
                padding: 15px;
                border-top:2px solid #ff0080;
                border-bottom:2px solid #ff0080;
                ;
            }
            </style>
    </head>
    <body>  
        <br>
        <h1>Hospital Pedro León Alvarez Diaz</h1>
        <hr />
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="navbar-brand" href="#">
                        <img src="img/logo.png" alt="Avatar Logo" style="width:40px;" class="rounded-pill"> 
                    </a>                  
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="medicos.jsp">Medico</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="pacientes.jsp">Paciente</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="citas.jsp">Citas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Salir</a>
                </li>
            </ul>
        </nav>       
    </body>
</html>
