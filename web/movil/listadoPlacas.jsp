<%-- 
    Document   : index
    Created on : 24/07/2014, 03:05:22 PM
    Author     : Felipe
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Modelo.HistorialVehiculo"%>
<%@page import="Controlador.DAOLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-store");
    String usuario = (String) session.getAttribute("Sesion");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
    }
    
Controlador.DAOHistorialVehiculo daoHistorialVehiculo = new Controlador.DAOHistorialVehiculo();
    LinkedList<HistorialVehiculo> listaHistorialVehiculo=daoHistorialVehiculo.listar();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Listado de placas - SAE Taxímetros</title>
        <link rel="shortcut icon" href="../imagenes/dq.ico">
        
        <link rel="stylesheet" href="../css/pure/pure.css">
        <!--[if lte IE 8]>
            <link rel="stylesheet" href="../css/pure/side-menu-old-ie.css">
        <![endif]-->
        <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="../css/pure/side-menu.css">
        <!--<![endif]-->
    </head>
    <body>
        <div id="main">
            <div class="header">
                <center><img class="pure-img" src="../imagenes/logo.jpg">
                    <a href="cerrarSesion.jsp" ><button class="pure-button">Cerrar Sesion (<%=usuario%>)</button></a>
                </center>
            </div>

            <div class="content">
                <center>
                    <section id="placas">
                        <%                            
                            String imagen = "";
                            for (int i = 0; i < listaHistorialVehiculo.size(); i++) {
                                ;
                                if (listaHistorialVehiculo.get(i).esPlacaPublica(listaHistorialVehiculo.get(i).getPlaca())) {
                                    imagen = "publico";
                                } else {
                                    imagen = "particular";
                                }
                        %>
                        <article>
                            <a href="monitoreo.jsp?placa=<%=listaHistorialVehiculo.get(i).getPlaca()%>&posicion=<%=listaHistorialVehiculo.get(i).getPosicion()%>&estado=<%=listaHistorialVehiculo.get(i).getEstadoGps()%>">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td id="fuenteplaca" width="151" height="68" background="../imagenes/placa_<%=imagen%>.png"><%=listaHistorialVehiculo.get(i).getPlaca()%></td>
                                    </tr>
                                </table>
                            </a>
                        </article>
                                    <%
                                                }
                                    %>
                    </section>
                </center>
            </div>
        </div>
    </body>
</html>