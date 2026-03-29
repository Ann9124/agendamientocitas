package dao.datos;

import dao.dominio.CitaMedica;
import java.sql.*;

/*Se crea la clase CitaMedica*/
public class CitaMedicaDAO {

    private static final String SQL_INSERT = "insert into CitaMedica(idPaciente,idMedico) values (?,?)";
    private static final String SQL_CANCELAR = "update CitaMedica set idEstadoCita=2 where id=?";

    public CitaMedicaDAO() {
    }

    public void insertar(CitaMedica cm) {

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_INSERT);

            sentencia.setInt(1, cm.getId());
            sentencia.setString(2, cm.getIdPaciente());
            sentencia.setString(3, cm.getIdMedico());
            sentencia.setString(4, cm.getFechaHora());
            sentencia.setString(5, cm.getIdEstadoCita());
            sentencia.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }
    
    public void cancelar(int id) {
        try {
            try (Connection conex = ConexionBD.getconex(); PreparedStatement sentencia = conex.prepareStatement(SQL_CANCELAR)) {
                sentencia.setInt(1, id);
                sentencia.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

    }
}
