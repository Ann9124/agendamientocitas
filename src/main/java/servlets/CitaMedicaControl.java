package servlets;

import dao.datos.CitaMedicaDAO;
import dao.dominio.CitaMedica;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CitaMedicaControl extends HttpServlet {

    private static final CitaMedicaDAO cmdao = new CitaMedicaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String opcion = request.getParameter("opcion");

        switch (opcion) {
            case "Crear":
                insertar(request, response);
                break;

            case "cancelar":
                cancelar(request, response);
                break;

            default:
                break;
        }

        response.sendRedirect("citas.jsp");
    }

    protected void insertar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CitaMedica cm = new CitaMedica();
        cm.setIdPaciente(request.getParameter("idPaciente"));
        cm.setIdMedico(request.getParameter("idMedico"));
        cm.setFechaHora(request.getParameter("fechaHora"));
        cm.setIdEstadoCita(request.getParameter("idEstadoCita"));
        cmdao.insertar(cm);
    }

    private void cancelar(HttpServletRequest request, HttpServletResponse response) {
         cmdao.cancelar(Integer.parseInt(request.getParameter("idCitaACancelar")));
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
