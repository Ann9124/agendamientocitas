package servlets;

import dao.datos.LoginDAO;
import dao.dominio.Login;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LoginControl extends HttpServlet {

    private static final LoginDAO ldao = new LoginDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("txtCorreo");
        String password = request.getParameter("txtPass");

        Login login = ldao.validar(correo, password);

        if (login == null) {
            // CREAR LA SESIÓN (Muy importante para los permisos)
            HttpSession sesion = request.getSession();
            sesion.setAttribute("Usuarioactivo", login);

        }
        response.sendRedirect("index.jsp");

    }
}
