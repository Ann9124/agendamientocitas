package servlets;

import dao.datos.UsuarioDAO;
import dao.dominio.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UsuarioControl extends HttpServlet {

    private static final UsuarioDAO udao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("txtCorreo");
        String password = request.getParameter("txtPass");

        Usuario usuarios = udao.validar(correo, password);

        if (usuarios != null) {
            // CREAR LA SESIÓN (Muy importante para los permisos)
            HttpSession sesion = request.getSession();
            sesion.setAttribute("Usuarioactivo", usuarios);

        }
        response.sendRedirect("index.jsp");

    }
}
