package servlets;

import dao.datos.CitaMedicaDAO;
import java.io.IOException;
import dao.datos.MedicoDAO;
import dao.dominio.CitaMedica;
import dao.dominio.Usuarios;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class CitaMedicaControl extends HttpServlet {

        private static final long serialVersionUID = 1L;

    private CitaMedicaDAO cmdao= new CitaMedicaDAO();
    private MedicoDAO mdao = new MedicoDAO();

        public CitaMedicaControl() {
            this.cmdao = new CitaMedicaDAO();
        }

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("opcion");

        if (accion.equals("verFormulario")) {
            // Enviamos la lista de médicos para que el paciente elija uno
            request.setAttribute("listaMedicos", mdao.mostrar());
            request.getRequestDispatcher("paciente.jsp").forward(request, response);
        }
    }

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("opcion");

        if (accion.equals("agendar")) {
            // Capturamos datos del formulario
            int idPaciente = Integer.parseInt(request.getParameter("txtIdPaciente"));
            int idMedico = Integer.parseInt(request.getParameter("txtIdMedico"));
            String fecha = request.getParameter("txtFecha");
            String hora = request.getParameter("txtHora");

            CitaMedica nuevaCita = new CitaMedica();
            nuevaCita.setIdpaciente(idPaciente);
            nuevaCita.setIdmedico(idMedico);
            // Asegúrate que tu dominio y DAO soporten fecha/hora
            
            cmdao.insertar(nuevaCita); 
            response.sendRedirect("paciente.jsp?msg=exito");
        }
    }
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

