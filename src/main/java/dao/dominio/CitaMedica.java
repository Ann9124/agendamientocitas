package dao.dominio;

import java.sql.ResultSet;
import java.util.Date;

public class CitaMedica {

    private int id;
    private int idPaciente;
    private int idMedico;

    public CitaMedica(ResultSet res) {
    }

    public CitaMedica(int id, int idPaciente, int idMedico) {
        this.id = id;
        this.idPaciente = idPaciente;
        this.idMedico = idMedico;
    }

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
}
