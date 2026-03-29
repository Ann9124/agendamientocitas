package dao.dominio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*Se crea la clase CitaMedica*/
public class CitaMedica {

    private int id;
    private String idPaciente;
    private String idMedico;
    private String fechaHora;
    private String idEstadoCita = "1";

    public CitaMedica(ResultSet res) {
        try {
            this.id = res.getInt("id");
            this.idPaciente = res.getString("idPaciente");
            this.idMedico = res.getString("idMedico");
            this.fechaHora = res.getString("fechaHora");
            this.idEstadoCita = res.getString("idEstadoCita");
        } catch (SQLException ex) {
            Logger.getLogger(DetalleCitaMedica.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public CitaMedica(int id, String idPaciente, String idMedico) {
        this.id = id;
        this.idPaciente = idPaciente;
        this.idMedico = idMedico;
    }

    public CitaMedica() {
    }

    /*Se crean métodos get y set*/
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(String idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getIdMedico() {
        return idMedico;
    }

    public void setIdMedico(String idMedico) {
        this.idMedico = idMedico;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getIdEstadoCita() {
        return idEstadoCita;
    }

    public void setIdEstadoCita(String idEstadoCita) {
        this.idEstadoCita = idEstadoCita;
    }
}
