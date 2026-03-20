package dao.datos;

import dao.dominio.CitaMedica;
import java.sql.*;
import java.util.*;

public class CitaMedicaDAO {

    public static String SQL_SELECT = "SELECT * FROM CitaMedica";
    public static String SQL_INSERT = "INSERT INTO CitaMedica(idcitamedica,idMedico) VALUES (?,?)";
    public static String SQL_UPDATE = "UPDATE CitaMedica SET idCitaMedica=?,idMedico=? WHERE id=?";
    public static String SQL_DELETE = "DELETE FROM Citamedica WHERE id=?";

    public CitaMedicaDAO() {
    }

    public void imprimir() {
        try {
            List<CitaMedica> citamedicas = seleccionarCitaMedicas();
            for (CitaMedica citamedica : citamedicas) {
                System.out.println(citamedica);

            }
        } catch (SQLException e) {
        }
    }
    //*MOSTRAR CitaMedicaDAO*//

    public List<CitaMedica> seleccionarCitaMedicas() throws SQLException {
        Connection conex = null;
        PreparedStatement sentencia = null;
        ResultSet res = null;
        CitaMedicaDAO citamedica = null;

        List<CitaMedica> citamedicas = new ArrayList<>();

        try {
            conex = ConexionBD.getconex();
            sentencia = conex.prepareStatement(SQL_SELECT);
            res = sentencia.executeQuery();

            while (res.next()) {
//                citamedica = new CitaMedicaDAO();
//                citamedica.setId(res.getInt("id"));
//                citamedica.setNombre(res.getString("nombre"));
//                citamedica.setApellido(res.getString("apellido"));
//                citamedica.setFechaNaci(res.getDate("fechaNaci"));
//                citamedica.setTelefono(res.getString("telefono"));
//
//                citamedicas.add(citamedica);

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return citamedicas;
    }

    //*INSERTAR CitaMedicaDAO*//
    public void insertar(CitaMedicaDAO p) {

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_INSERT);

//            sentencia.setString(1, p.getNombre());
//            sentencia.setString(2, p.getApellido());
//            sentencia.setString(3, p.getTelefono());
            sentencia.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

    }

    //*ACTUALIZAR CitaMedicaDAO*//       
    public void actualizar(CitaMedicaDAO p) {

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_UPDATE);

//            sentencia.setString(1, p.getNombre());
//            sentencia.setString(2, p.getApellido());
//            sentencia.setString(3, p.getTelefono());
//            sentencia.setInt(4,p.getId());
            sentencia.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }
    //*ELIMINAR CitaMedicaDAO*//

    public void eliminar(int id) {

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_DELETE);

            sentencia.setInt(1, id);

            sentencia.executeUpdate();
            sentencia.close();
            conex.close();

        } catch (SQLException e) {
            e.printStackTrace(System.out);

        }

    }
}
