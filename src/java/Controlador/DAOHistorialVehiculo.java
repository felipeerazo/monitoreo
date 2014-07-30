/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.HistorialVehiculo;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 *
 * @author Felipe
 */
public class DAOHistorialVehiculo extends HistorialVehiculo {
    
    public LinkedList<HistorialVehiculo> vehiculosPanico()throws SQLException {
        String sql = "{call vehiculosenpanico()}";
        return getConn().vehiculosEnPanico(sql);
    }

//    public LinkedList<HistorialVehiculo> listarTodo() throws SQLException {
//        String sql = "{call listartodohistorialvehiculo()}";
//        return getConn().listarTodoHistorialVehiculo(sql);
//    }
//    
    public LinkedList<HistorialVehiculo> listar() throws SQLException {
        String sql = "{call listar_ultimos_registros()}";
        return getConn().listarHistorialVehiculo(sql);
    }

    public LinkedList<HistorialVehiculo> listar(String placa) throws SQLException {
        String sql = "{call listarHistorialVehiculo('" + placa + "')}";
        return getConn().listarHistorialVehiculo(sql);
    }

    public LinkedList<HistorialVehiculo> listarVecinos(String placa, String posicion) throws SQLException {
       
        String sql = "{call obtenerdistancias(" + posicion + ", '" + placa + "')}";
        LinkedList<HistorialVehiculo> listaHistorialVehiculosVecinos = getConn().listarVecinos(sql);
        return listaHistorialVehiculosVecinos;
    }
}
