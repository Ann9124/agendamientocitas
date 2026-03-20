package dao.datos;

import dao.dominio.Medico;
import java.sql.*;
import java.util.*;

public class MedicoDAO {

    private static final String SQL_SELECT = "select * from Medico";
    private static final String SQL_INSERT = "insert into Medico(nombre,apellido,fechaNaci,telefono) values (?,?,now(),?)";
    private static final String SQL_UPDATE = "update Medico set nombre=?, apellido=?, fechaNaci=?, telefono=? where id=?";
    private static final String SQL_DELETE = "delete from Medico where id=?";

    public MedicoDAO() {
    }

    public void imprimir() {
        try {
            List<Medico> medicos = seleccionarMedicos();
            for (Medico medico : medicos) {
                System.out.println(medico);
            }
        } catch (SQLException e) {

        }
    }

    /*Mostrar Medico***************/
    public List<Medico> seleccionarMedicos() throws SQLException {
        List<Medico> medicos = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_SELECT); ResultSet res = sentencia.executeQuery()) {
                while (res.next()) {
                    medicos.add(new Medico(res));
                }

            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return medicos;

    }

    /*Insertar Medico***********/
    public void insertar(Medico m) {
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_INSERT)) {
                sentencia.setString(1, m.getNombre());
                sentencia.setString(2, m.getApellido());
                sentencia.setString(3, m.getTelefono());

                sentencia.executeUpdate();
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    /*Actualizar Medico********************/
    public void actualizar(Medico m) {
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_UPDATE)) {
                sentencia.setString(1, m.getNombre());
                sentencia.setString(2, m.getApellido());
                sentencia.setString(3, m.getTelefono());
                sentencia.setInt(4, m.getId());
                sentencia.executeUpdate();
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    /*ELIMINAR Medico***********************/
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
}
