package dao.dominio;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {

    public Login(ResultSet res) {
          try {
            this.id = res.getInt("id");
            this.correo = res.getString("correo");
            this.password = res.getString("contraseña");
            this.rol = res.getString("rol");
        } catch (SQLException ex) {
            System.getLogger(Medico.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
    }
    
    private int id;
    private String correo;
    private String password;
    private String rol;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
