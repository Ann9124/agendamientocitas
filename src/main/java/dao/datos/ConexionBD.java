
package dao.datos;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexionBD {
    private static final String url ="jdbc:mysql://localhost:3306/ips";
    private static final String user ="root";
    private static final String pass = "12345";
    
    public static Connection getconex() throws SQLException{
        return DriverManager.getConnection(url,user,pass);
    }
    
    public static void cerrar(Connection conex)throws SQLException{
        conex.close();
    }
    public static void cerrar (Statement sentencia) throws SQLException{
        sentencia.close();
    }
    public static void cerrar (PreparedStatement sentencia)throws SQLException {
        sentencia.close();
    }
    
    public static void cerrar (ResultSet resultado) throws SQLException{
        resultado.close();
    }
}
