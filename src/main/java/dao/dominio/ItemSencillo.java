package dao.dominio;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemSencillo {

    private Integer id;
    private String nombre;

    public ItemSencillo(Integer id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    public ItemSencillo(ResultSet res) {
        try {
            this.id = res.getInt("id");
            this.nombre = res.getString("nombre");
        } catch (SQLException ex) {
            System.getLogger(ItemSencillo.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
