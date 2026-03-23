package servlets;

import dao.datos.MedicoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

public class MedicoControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final String ListM = "Vista/Consultar.jsp";
    private final MedicoDAO mdao = new MedicoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/htpl;charset=UTF-8");

        String opcion = request.getParameter("opcion");

        switch (opcion) {
            case "consultar":
                consultar(request, response);
                break;
            case "insertar":
                break;
            default:
                throw new AssertionError();
            case "actualizar":
                actualizar(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
        }
    }

    protected void consultar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("medicos", mdao.mostrar());
        request.getRequestDispatcher(ListM).forward(request, response);
    }

    protected void insertar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("medicos", mdao.mostrar());
        request.getRequestDispatcher(ListM).forward(request, response);
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("medicos", mdao.mostrar());
        request.getRequestDispatcher(ListM).forward(request, response);
    }

    protected void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("medicos", mdao.mostrar());
        request.getRequestDispatcher(ListM).forward(request, response);
    }

}
