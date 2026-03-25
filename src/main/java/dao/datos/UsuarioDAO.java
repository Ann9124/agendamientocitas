package dao.datos;

import dao.dominio.Usuario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public Usuario validar(String correo, String password) {

        List<Usuario> usuario = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement("select * from Usuario where correo=? and password=?");) {
                sentencia.setString(1, correo);
                sentencia.setString(2, password);
                try (ResultSet res = sentencia.executeQuery()) {
                    while (res.next()) {
                        usuario.add(new Usuario(res));
                    }
                }
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return usuario.get(0);
    }
}
