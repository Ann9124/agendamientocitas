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
    private static final String SQL_ITEM = "select * from Paciente where id=?";

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
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_INSERT)) {
                sentencia.setString(1, p.getNombre());
                sentencia.setString(2, p.getApellido());
                sentencia.setString(3, p.getTelefono());

                sentencia.executeUpdate();
            }
            ConexionBD.cerrar(conex);
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

    public Paciente getItem(Integer id) {
        List<Paciente> pacientes = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(SQL_ITEM);) {
                sentencia.setInt(1, id);
                try (ResultSet res = sentencia.executeQuery()) {
                    while (res.next()) {
                        pacientes.add(new Paciente(res));
                    }
                }
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        if (!pacientes.isEmpty()) {
            return pacientes.get(0);
        } else {
            return null; // Si no hay nada, devolvemos null en lugar de romper el programa
        }
    }
}
