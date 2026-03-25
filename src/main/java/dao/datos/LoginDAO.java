package dao.datos;

import dao.dominio.Login;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LoginDAO {

    public Login validar(String correo, String password) {

        List<Login> login = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement("select * from Login where correo=? and contraseña=?");) {
                sentencia.setString(1, correo);
                sentencia.setString(2, password);
                try (ResultSet res = sentencia.executeQuery()) {
                    while (res.next()) {
                        login.add(new Login(res));
                    }
                }
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return login.get(0);
    }
}
