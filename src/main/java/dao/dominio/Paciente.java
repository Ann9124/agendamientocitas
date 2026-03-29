package dao.dominio;

import java.sql.ResultSet;
import java.sql.SQLException;

/*Se crea la clase Paciente*/
public class Paciente {

    private int id;
    private String nombre;
    private String apellido;
    private String fechaNaci;
    private String telefono;

    public Paciente(ResultSet res) {
        try {
            this.id = res.getInt("id");
            this.nombre = res.getString("nombre");
            this.apellido = res.getString("apellido");
            this.fechaNaci = res.getString("fechaNaci");
            this.telefono = res.getString("telefono");
        } catch (SQLException ex) {
            System.getLogger(Paciente.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
    }

    /*Se definen los atributos de la clase*/
    public Paciente(int id, String nombre, String apellido, String fechaNaci, String telefono) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNaci = fechaNaci;
        this.telefono = telefono;
    }

    public Paciente() {
    }

    /*Los métodos get y set de cada atributo*/
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

    public String getFechaNaci() {
        return fechaNaci;
    }

    public void setFechaNaci(String fechaNaci) {
        this.fechaNaci = fechaNaci;
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
