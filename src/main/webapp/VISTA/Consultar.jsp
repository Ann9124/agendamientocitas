
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        
            <head>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>fechaNaci</th>
                <th>Telefono</th>
            </tr>
            </head>
            <body> 
            <c:forEach item="$Pacientes") var="item">
                <tr>
                    <td>$(item.id)</td>
                    <td>$(item.nombre)</td>
                    <td>$(item.apellido)</td>
                    <td>$(item.apellido)</td>
                    <td>$(item.fechaNaci)</td>
                    <td>$(item.telefono)</td>
                </tr>
            </c:forEach>
                <form>
                    <input type="submit" name="accion" value="Insertar">
                    <input type="submit" name="accion" value="Consultar">
                    <input type="submit" name="accion" value="Actualizar">
                    <input type="submit" name="accion" value="Eliminar">
                </form>
         </body>
        
       
    

