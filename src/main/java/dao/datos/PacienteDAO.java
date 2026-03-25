package dao.datos;

import dao.dominio.Paciente;
import java.sql.*;
import java.util.*;

/*Aquí se crea la clase Paciente*/
public class PacienteDAO {

    private static final String SQL_SELECT = "select * from Paciente";
    private static final String SQL_INSERT = "insert into Paciente(nombre,apellido,fechaNaci,telefono) values (?,?,now(),?)";
    private static final String SQL_UPDATE = "update Paciente set nombre=?,apellido=?,telefono=? where id=?";
    private static final String SQL_DELETE = "delete from Paciente where id=?";
    public Object mostrar;

    public PacienteDAO() {
    }

    public void imprimir() {
        try {
            List<Paciente> pacientes = seleccionarPacientes();
            for (Paciente paciente : pacientes) {
                System.out.println(paciente);
            }
        } catch (SQLException e) {
        }
    }

    //*MOSTRAR PACIENTE*//
    public List<Paciente> seleccionarPacientes() throws SQLException {
        List<Paciente> pacientes = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_SELECT); ResultSet res = sentencia.executeQuery()) {
                while (res.next()) {
                    pacientes.add(new Paciente(res));
                }
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return pacientes;
    }

    //*INSERTAR PACIENTE*//
    public void insertar(Paciente p) {

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_INSERT);

            sentencia.setString(1, p.getNombre());
            sentencia.setString(2, p.getApellido());
            sentencia.setString(3, p.getTelefono());
            sentencia.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }

    //*ACTUALIZAR PACIENTE*//       
    public void actualizar(Paciente p) {

        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_UPDATE)) {
                sentencia.setString(1, p.getNombre());
                sentencia.setString(2, p.getApellido());
                sentencia.setString(3, p.getTelefono());
                sentencia.setInt(4, p.getId());
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
