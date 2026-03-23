
<%@page import="dao.dominio.Paciente"%>
<%@page import="dao.datos.PacienteDAO" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema IPS</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/5/w3.css">
        <link rel="stylesheet" type="text/css" href="agendamientocitas.css">
        <style type="text/css">
            .boton{
                background-color: #ffcccc;
                color: black;
                border: none;
                padding: 10px;
                font-size: 14px;
                cursor: pointer;
            }
            .links a{
                text-decoration: none;
                color: black;
                display: block;
                padding: 13px;
            }
            .links{
                background-color: #f9f9f9;
                width: 148px;
                display:none;
            }
            .links a:hover{
                background-color: #f1f1f1;
            }
            .dropdown:hover .links{
                display:block;
            }
            .dropdown{
                position: absolute;
            }
            table,th,td{
                border: 1px solid black;
                border-collapse: collapse;
            }
            th,td{
                padding: 10px;
            }
        </style>
    </head>
    <body>    
        <h1>Sistema IPS</h1>
        <hr />
        <a href="doctores.jsp">Doctores</a>
        <a href="pacientes.jsp">Pacientes</a>
        <a href="citas.jsp">Citas Medicas</a>
        <br>
        <br>

        <div class="dropdown">
            <button class="boton">Menú Desplegable</button>
            <div class="links">
                <a href="#">Consultar</a>
                <a href="#">Insertar</a>
                <a href="#">Actualizar</a>
                <a href="#">Eliminar</a>
                <br>
                <br>
            </div>
    </body>
    <head>
    <br>
    <br>
        <form action="LoginControl" method="POST">
    <label>Correo:</label>
    <input type="text" name="txtCorreo" required>
    
    <label>Contraseña:</label>
    <input type="password" name="txtPass" required>
    
    <button type="submit">Ingresar</button>
    <br>
    <br>
</form>
    </head>
    <head>
    <table>
        <tr>
        <br>
        <br>
        <th>Id</th>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>fechaNaci</th>
        <th>Telefono</th>
    </tr>
</head>
<body>    
<tbody>
    <tr>
        <td>1</td>
        <td>Carmen</td>
        <td>Perez</td>
        <td>1999-10-20</td>
        <td>311425687</td>
    </tr>
</table>
</tbody>              
</div>
</body>

<body>




</body>
</html>
