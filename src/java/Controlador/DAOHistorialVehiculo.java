/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.HistorialVehiculo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author Felipe
 */
public class DAOHistorialVehiculo extends HistorialVehiculo {

    public LinkedList<HistorialVehiculo> vehiculosPanico() throws SQLException {
        String sql = "{call vehiculosenpanico()}";
        LinkedList<HistorialVehiculo> l = getConn().vehiculosEnPanico(sql);
        getConn().cerrar();
        return l;
    }

    public LinkedList<HistorialVehiculo> listar() throws SQLException {
        String sql = "{call listar_ultimos_registros()}";
        LinkedList<HistorialVehiculo> l = getConn().listarHistorialVehiculo(sql);
        getConn().cerrar();
        return l;
    }

    public LinkedList<HistorialVehiculo> listar(String placa) throws SQLException {
        String sql = "{call listarHistorialVehiculo('" + placa + "')}";
        LinkedList<HistorialVehiculo> l = getConn().listarHistorialVehiculo(sql);
        getConn().cerrar();
        return l;
    }

    public LinkedList<HistorialVehiculo> listarVecinos(String placa, String posicion) throws SQLException {
        String sql = "{call obtenerdistancias(" + posicion + ", '" + placa + "')}";
        LinkedList<HistorialVehiculo> l = getConn().listarVecinos(sql);
        getConn().cerrar();
        return l;
    }

    public int insertarConCondicion(HistorialVehiculo hv) throws SQLException {
        String sql = "{call insertar_historial_vehiculo_condicionado('" + hv.getPlaca() + "'," + hv.getLongitud() + ", " + hv.getLatitud() + ", '" + hv.getFecha() + "', " + hv.getRecorrido() + ", " + hv.getEstadoGps() + ", " + hv.getDatoEvento() + ", " + hv.getEvento() + ")}";
        int i = getConn().insertar(sql);
        getConn().cerrar();
        return i;
    }

    public int insertar(HistorialVehiculo hv) {
        String sql = "INSERT INTO sae_historialvehiculo (his_int_id, his_str_placa, his_dou_longitud, his_dou_latitud, his_str_fecha, his_int_recorrido, his_int_estadogps, his_int_datoevento, his_int_evento) VALUES ((select nextval('secencia_pk_sae_historialvehiculo')),'" + hv.getPlaca() + "'," + hv.getLongitud() + ", " + hv.getLatitud() + ", " + hv.getFecha() + ", " + hv.getRecorrido() + ", " + hv.getEstadoGps() + ", " + hv.getDatoEvento() + ", " + hv.getEvento() + ")";
        //System.out.println("sql = " + sql);
        int i = getConn().consultar2(sql);
        getConn().cerrar();
        return i;
    }
}
