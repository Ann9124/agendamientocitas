package dao.datos;

import dao.dominio.Usuario;
import dao.datos.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    public Usuario validar(String correo, String password) {

        List<Usuario> usuarios = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement("select * from Usuario where correo=? and password=?");) {
                sentencia.setString(1, correo);
                sentencia.setString(2, password);
                try (ResultSet res = sentencia.executeQuery()) {
                    while (res.next()) {
                        usuarios.add(new Usuario(res));
                    }
                }
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        if (!usuarios.isEmpty()) {
            // Si la lista NO está vacía, devuelve el primero
            return usuarios.get(0);
        } else {
            // Si está vacía, devuelve null
            return null;
        }
    }
}
