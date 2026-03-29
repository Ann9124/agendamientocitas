package dao.datos;

import dao.dominio.ItemSencillo;
import dao.dominio.Medico;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*Se crea la clase CitaMedica*/
public class ItemSencilloDAO {    

    public ItemSencilloDAO() {
        
    }
    
    public List<ItemSencillo> getPacientes(){
        return seleccionarItems("select id, concat(nombre, ' ', apellido) as nombre  from Paciente");
    }
    
    public List<ItemSencillo> getMedicos(){
        return seleccionarItems("select id, concat(nombre, ' ', apellido) as nombre  from Medico");
    }
    
    private List<ItemSencillo> seleccionarItems(String sql) {
        List<ItemSencillo> items = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(sql); ResultSet res = sentencia.executeQuery()) {
                while (res.next()) {
                    items.add(new ItemSencillo(res));
                }

            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return items;

    }
}
