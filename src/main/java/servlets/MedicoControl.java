package servlets;

import dao.datos.MedicoDAO;
import dao.dominio.Medico;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletRequest;

public class MedicoControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final String ListM = "Vista/Consultar.jsp";
    private static final MedicoDAO mdao = new MedicoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/htpl;charset=UTF-8");

        String opcion = request.getParameter("opcion");

        switch (opcion) {
            case "agregar":
                insertar(request, response);
                break;

            case "actualizar":
                actualizar(request, response);
                break;

            case "eliminar":
                eliminar(request, response);
                break;

            default:
                throw new AssertionError();
        }

        response.sendRedirect("medicos.jsp");
    }

    protected void insertar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Medico m = new Medico();
        m.setNombre(request.getParameter("nombre"));
        m.setApellido(request.getParameter("apellido"));
        m.setFechaNaci(new Date());
        m.setTelefono(request.getParameter("telefono"));
        mdao.insertar(m);
    }

    protected void actualizar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Medico m = mdao.getItem((Integer)(request.getSession().getAttribute("IDMEDICOMODIFICAR")));
        m.setNombre(request.getParameter("nombre"));
        m.setApellido(request.getParameter("apellido"));
        m.setFechaNaci(new Date());
        m.setTelefono(request.getParameter("telefono"));
        mdao.actualizar(m);
        

    }

    protected void eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Integer idMedicoABorrar = Integer.valueOf(request.getParameter("idMedicoABorrar"));
        mdao.eliminar(idMedicoABorrar);
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
