package dao.dominio;

import java.util.Date;

public class CitaMedica {

    private int id;
    private int idPaciente;
    private int idMedico;

    public CitaMedica() {
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
}
