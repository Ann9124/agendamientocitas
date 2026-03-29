package dao.dominio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DetalleCitaMedica {

    private String id;
    private String idPaciente = "";
    private String idMedico = "";
    private String fechaHora = "";
    private String idEstadoCita = "";
    private String nombrePaciente = "";
    private String nombreMedico = "";
    private String estado = "";

    public DetalleCitaMedica() {

    }

    public DetalleCitaMedica(ResultSet res) {
        try {
            this.id = res.getString("id");
            this.idPaciente = res.getString("idPaciente");
            this.idMedico = res.getString("idMedico");
            this.fechaHora = res.getString("fechaHora");
            this.idEstadoCita = res.getString("idEstadoCita");
            this.nombrePaciente = res.getString("nombrePaciente");
            this.nombreMedico = res.getString("nombreMedico");
            this.estado = res.getString("estado");
        } catch (SQLException ex) {
            Logger.getLogger(DetalleCitaMedica.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getId() {
        return id;
    }

    public String getIdPaciente() {
        return idPaciente;
    }

    public String getIdMedico() {
        return idMedico;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public String getEstadoCita() {
        return idEstadoCita;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public String getNombreMedico() {
        return nombreMedico;
    }

    public String getEstado() {
        return estado;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setIdPaciente(String idPaciente) {
        this.idPaciente = idPaciente;
    }

    public void setIdMedico(String idMedico) {
        this.idMedico = idMedico;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public void setEstadoCita(String idEstadoCita) {
        this.idEstadoCita = idEstadoCita;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public void setNombreMedico(String nombreMedico) {
        this.nombreMedico = nombreMedico;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
