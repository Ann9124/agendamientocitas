package servlets;

import dao.datos.UsuarioDAO;
import dao.dominio.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LoginControl extends HttpServlet {

    private static final UsuarioDAO udao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("txtCorreo");
        String password = request.getParameter("txtPass");

        Usuario usuario = udao.validar(correo, password);

        if (usuario != null) {
            request.getSession().setAttribute("Usuarioactivo", usuario);
        }
        response.sendRedirect("index.jsp");

    }
}
