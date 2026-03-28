package dao.dominio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/*Se crea la clase Medico*/
public class Medico {

    private int id;
    private String nombre;
    private String apellido;

    private String telefono;

    public Medico() {
    }

    /*Se defienen los atributos*/
    public Medico(int id, String nombre, String apellido, Date fechaNaci, String telefono) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;

        this.telefono = telefono;
    }

    public Medico(ResultSet res) {
        try {
            this.id = res.getInt("id");
            this.nombre = res.getString("nombre");
            this.apellido = res.getString("apellido");

            this.telefono = res.getString("telefono");
        } catch (SQLException ex) {
            System.getLogger(Medico.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
    }

    /*Métodos get y set de los atributos*/
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return id + ":" + nombre;
    }
}
