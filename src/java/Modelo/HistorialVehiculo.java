/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Felipe
 */
public class HistorialVehiculo {

    private Controlador.Conexion conn = new Controlador.Conexion();
    private String placa;
    private String fecha;
    private String hora;
    private String estadogps;
    private String posicion;
    private String recorrido;
    private int datoEvento;
    private int evento;
    private String latitud;
    private String longitud;
   
    public HistorialVehiculo() {
    }

    public HistorialVehiculo(String placa, String fecha, String hora, String estado, String posicion, String recorrido) {
        if (placa == null) {
            this.placa = "";
        } else {
            this.placa = placa;
        }
        if (fecha == null) {
            this.fecha = "";
        } else {
            this.fecha = fecha;
        }
        if (hora == null) {
            this.hora = "";
        } else {
            this.hora = hora;
        }
        if (estado == null) {
            this.estadogps = "";
        } else {
            this.estadogps = estado;
        }
        if (posicion == null) {
            this.posicion = "";
        } else {
            this.posicion = posicion;
        }
        if (recorrido == null) {
            this.recorrido = "";
        } else {
            this.recorrido = recorrido;
        }
        

    }


    public HistorialVehiculo(String placa, String posicion) {
        if (placa == null) {
            this.placa = "";
        } else {
            this.placa = placa;
        }
        if (posicion == null) {
            this.posicion = "";
        } else {
            this.posicion = posicion;
        }
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

    /**
     * @return the placa
     */
    public String getPlaca() {
        return placa;
    }

    /**
     * @param placa the placa to set
     */
    public void setPlaca(String placa) {
        this.placa = placa;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the hora
     */
    public String getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    public void setHora(String hora) {
        this.hora = hora;
    }

    /**
     * @return the estado
     */
    public String getEstadoGps() {
        return estadogps;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstadoGps(String estado) {
        this.estadogps = estado;
    }

    /**
     * @return the posicion
     */
    public String getPosicion() {
        return posicion;
    }

    /**
     * @param posicion the posicion to set
     */
    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    /**
     * @return the recorrido
     */
    public String getRecorrido() {
        return recorrido;
    }

    /**
     * @param recorrido the recorrido to set
     */
    public void setRecorrido(String recorrido) {
        this.recorrido = recorrido;
    }

    /**
     * @return the datoEvento
     */
    public int getDatoEvento() {
        return datoEvento;
    }

    /**
     * @param datoEvento the datoEvento to set
     */
    public void setDatoEvento(int datoEvento) {
        this.datoEvento = datoEvento;
    }

    /**
     * @return the evento
     */
    public int getEvento() {
        return evento;
    }

    /**
     * @param evento the evento to set
     */
    public void setEvento(int evento) {
        this.evento = evento;
    }

    /**
     * @return the tipo
     */
    
    
    public boolean esPlacaPublica(String placa) {
        if (placa.charAt(0) == 'S' || placa.charAt(0) == 'T' || placa.charAt(0) == 'U' || placa.charAt(0) == 'V' || placa.charAt(0) == 'W' || placa.charAt(0) == 'X') {
            return true;
        }
        return false;
    }

    /**
     * @return the latitud
     */
    public String getLatitud() {
        return latitud;
    }

    /**
     * @param latitud the latitud to set
     */
    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    /**
     * @return the longitud
     */
    public String getLongitud() {
        return longitud;
    }

    /**
     * @param longitud the longitud to set
     */
    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }
    
}
