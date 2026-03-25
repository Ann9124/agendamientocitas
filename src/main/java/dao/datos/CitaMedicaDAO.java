package dao.datos;

import dao.dominio.CitaMedica;
import java.sql.*;
import java.util.*;

/*Se crea la clase CitaMedica*/
public class CitaMedicaDAO {

    private static final String SQL_SELECT = "select * from CitaMedica";
    private static final String SQL_INSERT = "insert into CitaMedica(idPaciente,idMedico) values (?,?)";
    private static final String SQL_UPDATE = "update CitaMedica set idPaciente=?,idMedico=? where id=?";
    private static final String SQL_DELETE = "delete from CitaMedica where id=?";

    /**
     * ************************
     */

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

    //*MOSTRAR CITAMEDICA*//
    public List<CitaMedica> seleccionarCitaMedicas() throws SQLException {
        List<CitaMedica> citamedicas = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_SELECT); ResultSet res = sentencia.executeQuery()) {
                while (res.next()) {
                    citamedicas.add(new CitaMedica(res));
                }
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return citamedicas;
    }

    //*INSERTAR CITAMEDICA*//
    public void insertar(CitaMedica cm) {

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_INSERT);

            sentencia.setInt(1, cm.getId());
            sentencia.setInt(2, cm.getIdPaciente());
            sentencia.setInt(3, cm.getIdMedico());
            sentencia.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    //*ACTUALIZAR PACIENTE*//       
    public void actualizar(CitaMedica cm) {

        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_UPDATE)) {
                sentencia.setInt(1, cm.getId());
                sentencia.setInt(2, cm.getIdPaciente());
                sentencia.setInt(3, cm.getIdMedico());
                sentencia.executeUpdate();

                ConexionBD.cerrar(conex);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    //*ELIMINAR PACIENTE*//
    public void eliminar(int id) {
        try {
            try (Connection conex = ConexionBD.getconex(); PreparedStatement sentencia = conex.prepareStatement(SQL_DELETE)) {
                sentencia.setInt(1, id);
                sentencia.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

    }

    public Object mostrar() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
