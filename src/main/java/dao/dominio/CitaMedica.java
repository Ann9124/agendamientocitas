package dao.dominio;

import java.sql.ResultSet;
import java.util.Date;

/*Se crea la clase CitaMedica*/
public class CitaMedica {

    private int id;
    private int idPaciente;
    private int idMedico;

    public CitaMedica(ResultSet res) {
    }
/*Se definen atributos*/
    public CitaMedica(int id, int idPaciente, int idMedico) {
        this.id = id;
        this.idPaciente = idPaciente;
        this.idMedico = idMedico;
    }

    public CitaMedica() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
/*Se crean métodos get y set*/
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public int getIdMedico() {
        return idMedico;
    }

    public void setIdMedico(int idMedico) {
        this.idMedico = idMedico;
    }

    public int getIdpaciente() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getIdmedico() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setIdpaciente(int idPaciente) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setIdmedico(int idMedico) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
