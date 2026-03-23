package servlets;
import dao.datos.UsuariosDAO;
import dao.dominio.Usuarios;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class UsuariosControl extends HttpServlet {
    UsuariosDAO udao = new UsuariosDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correo = request.getParameter("txtCorreo");
        String contraseña = request.getParameter("txtContraseña");
        
        Usuarios usuarios = udao.validar(correo, contraseña);

        if (usuarios!= null) {
            // CREAR LA SESIÓN (Muy importante para los permisos)
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuarios", usuarios);
            sesion.setAttribute("rol", usuarios.getRol());

            // Redirección según el rol
            if (usuarios.getRol().equals("admin")) {
                response.sendRedirect("admin.jsp");
            } else if (usuarios.getRol().equals("medicos")) {
                response.sendRedirect("medicos.jsp");
            } else {
                response.sendRedirect("pacientes.jsp");
            }
        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }
}