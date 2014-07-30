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
public class DAOLogin {
    
    private Conexion conn;
    
    public DAOLogin(){
        conn=new Conexion();
    }

    public String comprobarUsuario(String usuario, String clave) throws SQLException{
            String sql = "{call login('"+usuario+"', '"+clave+"')}";
            return getConn().comprobarUsuario(sql);
     }

    /**
     * @return the conn
     */
    public Controlador.Conexion getConn() {
        return conn;
    }

    /**
     * @param conn the conn to set
     */
    public void setConn(Controlador.Conexion conn) {
        this.conn = conn;
    }
    
}
