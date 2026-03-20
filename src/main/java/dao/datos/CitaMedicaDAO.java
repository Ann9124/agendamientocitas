package dao.dominio.CitaMedica;

import java.sql.ResultSet;
import java.util.Date;

public class CitaMedicaDAO {

    private int id;
    private int idPaciente;
    private int idMedico;

    public CitaMedicaDAO ResultSet res) {
    }

    public CitaMedicaDAO(int id, int idPaciente, int idMedico) {
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
}
