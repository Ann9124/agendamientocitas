package dao.datos;
import dao.dominio.Usuarios;
import java.sql.*;

public class UsuariosDAO {
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private String contraseña;

    public Usuarios validar(String correo, String contraseña) {
        Usuarios u = null;
        String sql = "select * from Usuarios where correo=? and contraseña=?";
        try {
            con = new conexionBD().getConnection(); // Ajusta según el nombre de tu método de conexión
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, contraseña);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuarios();
                u.setId(rs.getInt("id"));
                u.setCorreo(rs.getString("correo"));
                u.setRol(rs.getString("rol"));
            }
        } catch (Exception e) { System.out.println("Error: " + e.getMessage()); }
        return u;
    }

    private static class conexionBD {

        public conexionBD() {
        }

        private Connection getConnection() {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
    }
}
