package dao.datos;

import dao.dominio.Paciente;
import java.sql.*;

import java.util.*;

public class PacienteDAO {

    public static String SQL_SELECT = "SELECT * FROM Paciente";
    public static String SQL_INSERT = "INSERT INTO paciente(nombre,apellido,fechaNaci,telefono) VALUES (?,?,now(),?)";
    public static String SQL_UPDATE = "UPDATE paciente SET nombre=?,apellido=?,telefono=? WHERE id=?";
    public static String SQL_DELETE = "DELETE FROM paciente WHERE id=?";

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
        Paciente paciente = null;

        List<Paciente> pacientes = new ArrayList<>();

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_SELECT);
            ResultSet res = sentencia.executeQuery();

            while (res.next()) {
                paciente = new Paciente();
                paciente.setId(res.getInt("id"));
                paciente.setNombre(res.getString("nombre"));
                paciente.setApellido(res.getString("apellido"));
                paciente.setFechaNaci(res.getDate("fechaNaci"));
                paciente.setTelefono(res.getString("telefono"));

                pacientes.add(paciente);

            }
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
            PreparedStatement sentencia = conex.prepareStatement(SQL_UPDATE);

            sentencia.setString(1, p.getNombre());
            sentencia.setString(2, p.getApellido());
            sentencia.setString(3, p.getTelefono());
            sentencia.setInt(4,p.getId());

            sentencia.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
    }
    //*ELIMINAR PACIENTE*//

    public void eliminar (int id) {

        try {
            Connection conex = ConexionBD.getconex();
            PreparedStatement sentencia = conex.prepareStatement(SQL_DELETE);

            sentencia.setInt(1,id);

            sentencia.executeUpdate();
            sentencia.close();
            conex.close();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
            
        }
        

    }
}
