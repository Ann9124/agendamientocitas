package servlets;

import dao.datos.PacienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PacienteControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final String ListP = "Vista/Consultar.jsp";
    private final PacienteDAO pdao = new PacienteDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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

        request.setAttribute("pacientes", pdao.mostrar());
        request.getRequestDispatcher(ListP).forward(request, response);
    }

    protected void insertar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("pacientes", pdao.mostrar());
        request.getRequestDispatcher(ListP).forward(request, response);
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("pacientes", pdao.mostrar());
        request.getRequestDispatcher(ListP).forward(request, response);
    }

    protected void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("pacientes", pdao.mostrar());
        request.getRequestDispatcher(ListP).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
