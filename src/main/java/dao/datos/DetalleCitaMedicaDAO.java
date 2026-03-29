package dao.datos;

import dao.dominio.DetalleCitaMedica;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DetalleCitaMedicaDAO {

    private static final String SQL_SELECCIONAR = "select cm.id,  "
            + "	cm.idPaciente,  "
            + "	cm.idMedico,  "
            + "	cm.fechaHora,  "
            + "	cm.idEstadoCita,  "
            + "	concat(p.nombre, ' ', p.apellido) as nombrePaciente,   "
            + "	concat(m.nombre, ' ', m.apellido) as nombreMedico, "
            + "	ec.nombre as estado "
            + "from CitaMedica cm "
            + "inner join Paciente p on cm.idPaciente=p.id "
            + "inner join Medico m on cm.idMedico=m.id "
            + "inner join EstadoCita ec on cm.idEstadoCita=ec.id ";

    public DetalleCitaMedicaDAO() {

    }

    public List<DetalleCitaMedica> listarCitasPorPaciente(Integer idPaciente) {
        return seleccionarDetalleCitaMedicas(SQL_SELECCIONAR + " where idPaciente=?", idPaciente.toString());
    }

    public List<DetalleCitaMedica> listarCitasPorDoctor(Integer idMedico) {
        return seleccionarDetalleCitaMedicas(SQL_SELECCIONAR + " where idMedico=?", idMedico.toString());
    }

    public List<DetalleCitaMedica> listarCitasPorDia(String fecha) {
        return seleccionarDetalleCitaMedicas(SQL_SELECCIONAR + " where DATE(cm.fechaHora)=?", fecha);
    }

    private List<DetalleCitaMedica> seleccionarDetalleCitaMedicas(String sql, String parametro) {
        List<DetalleCitaMedica> medicos = new ArrayList<>();
        try {
            Connection conex = ConexionBD.getconex();
            try (PreparedStatement sentencia = conex.prepareStatement(sql)) {
                sentencia.setString(1, parametro);

                try (ResultSet res = sentencia.executeQuery()) {
                    while (res.next()) {
                        medicos.add(new DetalleCitaMedica(res));
                    }
                }
            }
            ConexionBD.cerrar(conex);
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return medicos;
    }
}
