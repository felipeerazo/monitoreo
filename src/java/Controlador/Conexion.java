package Controlador;

import Modelo.HistorialVehiculo;
import java.io.Serializable;
import java.sql.*;
import java.util.LinkedList;

public class Conexion implements Serializable {

    ResultSet res = null;
    private Connection con = null;
    Statement st = null;
    CallableStatement cs = null;
    String driver = "org.postgresql.Driver";
    //String url = "jdbc:postgresql://190.240.3.67:5432/db_sae_aquitax";
    String url = "jdbc:postgresql://127.0.0.1:5432/db_sae_aquitax";
    String userDB = "postgres";
    String passDB = "admin";

    public Conexion() {
        conectar();
    }

    public int conectar() {

        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            System.out.println("No se pudo cargar el driver :( " + driver);
            return -1;

        }
        try {
            con = DriverManager.getConnection(url, userDB, passDB);
        } catch (SQLException e) {
            System.out.println("No se pudo realizar la conexion :( " + e.getMessage());
            return -2;
        }
        return 1;
    }

    public StringBuffer reciente(String sql) {
        StringBuffer sb = new StringBuffer();
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            int x = 1;
            while (res.next()) {
                x = 1;
                while (res.getMetaData().getColumnCount() >= x) {
                    if (res.getString(x) != null) {
                        sb.append("<p>");
                        sb.append(res.getString(x));
                        sb.append("</p>");
                    }
                    x++;
                }
            }
        } catch (SQLException e) {
            sb.append(e.toString());
            return sb;
        }
        return sb;
    }

    public String reporteSQL4(String sql) throws SQLException {
        cs = getCon().prepareCall(sql);
        res = cs.executeQuery();
        if (res.next()) {
            return res.getString(2);
        }
        return null;
    }

    public StringBuffer reporteSQL2(String sql) {
        StringBuffer sb = new StringBuffer();
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            int x = 1;
            while (res.next()) {
                sb.append("<tr>");
                x = 1;
                while (res.getMetaData().getColumnCount() >= x) {
                    if (res.getString(x) != null) {
                        sb.append("<td>");
                        sb.append(res.getString(x));
                        sb.append("</td>");
                    }
                    x++;
                }
                sb.append("</tr>");
            }
        } catch (SQLException e) {
            sb.append(e.toString());
            return sb;
        }
        return sb;
    }

    public LinkedList<HistorialVehiculo> listarHistorialVehiculo(String sql) {
        LinkedList<HistorialVehiculo> lista = new LinkedList();
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            int x = 1;
            while (res.next()) {
                x = 1;
                while (res.getMetaData().getColumnCount() >= x) {
                    lista.add(new HistorialVehiculo(res.getString(x), res.getString(x + 1), res.getString(x + 2), res.getString(x + 3), res.getString(x + 4), res.getString(x + 5)));
                    x = x + 6;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return lista;
    }

//    public LinkedList<HistorialVehiculo> listarTodoHistorialVehiculo(String sql) {
//        LinkedList<HistorialVehiculo> lista = new LinkedList();
//        try {
//            CallableStatement cs = getCon().prepareCall(sql);
//            res = cs.executeQuery();
//            int x = 1;
//            while (res.next()) {                
//                x = 1;
//                while (res.getMetaData().getColumnCount() >= x) {                    
//                    lista.add(new HistorialVehiculo(res.getString(x), res.getString(x+1),res.getString(x+2),res.getString(x+3),res.getString(x+4),res.getString(x+5),res.getString(x+6),res.getString(x+7)));
//                    x=x+6;
//                }                
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//            return null;
//        }
//        return lista;
//    }
    public LinkedList<HistorialVehiculo> vehiculosEnPanico(String sql) {
        LinkedList<HistorialVehiculo> lista = new LinkedList();
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            int x = 1;
            while (res.next()) {
                x = 1;
                while (res.getMetaData().getColumnCount() >= x) {
                    lista.add(new HistorialVehiculo(res.getString(x), res.getString(x + 1)));
                    x = x + 6;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return lista;
    }

    public void eliminar2(String sql) {
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
        } catch (Exception e) {
            System.out.println("fallo conexion ");
            e.printStackTrace();
        }
    }

    public void insertarCliente(String sql) {
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();


        } catch (Exception e) {
            System.out.println("fallo conexion ");
            e.printStackTrace();
        }
    }

    public String buscarS(String sql) {
        try {
            res = null;
            st = getCon().createStatement();
            res = st.executeQuery(sql);
            res.next();
            return res.getString(1);
        } catch (SQLException e) {
            return "-1";
        }
    }

    public String buscarC(String sql, int c) {
        try {
            res = null;
            st = getCon().createStatement();
            res = st.executeQuery(sql);
            if (res.next());
            return res.getString(c);
        } catch (SQLException e) {
            return "-1";
        }
    }

    public int insertar(String sql) {
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            cs.close();
            res.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e.toString());
            return -1;
        }
    }

    public ResultSet consultar(String sql) {
        try {
            st = getCon().createStatement();
            res = st.executeQuery(sql);
            st.close();
        } catch (SQLException e) {
            return null;
        }
        return res;
    }

    public int consultar2(String sql) {
        try {
            st = getCon().createStatement();
            if (st.execute(sql)) {
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException e) {
            System.out.println("Excepción método 'ejectuar2': " + e);
            return -1;
        }
    }

    public int verificar(String sql) {
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            if (res.next()) {
                res.close();
                return 1;
            }
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public int actualizar(String sql) {
        try {
            st = getCon().createStatement();
            st.executeUpdate(sql);
            st.close();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
            return -1;
        }

    }

    public void cerrar() {
        try {
            if (cs != null) {
                cs.close();
            }
            if (st != null) {
                st.close();
            }
            if (res != null) {
                res.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Excepción método 'cerrar': " + e.getMessage());
        }
    }

    /**
     * @return the con
     */
    public Connection getCon() {
        return con;
    }

    public String comprobarUsuario(String sql) {
        String respuesta = "";
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            if (res.next()) {
                respuesta = String.valueOf(res.getString(1));
            }
//            int x = 1;
//            while (res.next()) {                
//                x = 1;
//                while (res.getMetaData().getColumnCount() >= x) {                    
//                    respuesta=res.getString(x);
//                }                
//            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return respuesta;
    }

    public LinkedList<HistorialVehiculo> listarVecinos(String sql) {
        LinkedList<HistorialVehiculo> lista = new LinkedList();
        try {
            cs = getCon().prepareCall(sql);
            res = cs.executeQuery();
            int x = 1;
            while (res.next()) {
                x = 1;
                while (res.getMetaData().getColumnCount() >= x) {
                    HistorialVehiculo his = new HistorialVehiculo();
                    his.setPlaca(res.getString(x + 1));
                    his.setPosicion(res.getString(x + 2));
                    lista.add(his);
                    x = x + 3;
                }
            }
            res.close();
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return lista;
    }
}