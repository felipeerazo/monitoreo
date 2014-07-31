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
    if (request.getParameter("placa") == null || request.getParameter("posicion") == null) {
        response.sendRedirect("index.jsp");
    }
    String placa = request.getParameter("placa");
    String posicion = request.getParameter("posicion");
    String estado = request.getParameter("estado");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Monitoreo - SAE Taxímetros</title>
        <link rel="shortcut icon" href="../imagenes/dq.ico">
        
        <link rel="stylesheet" href="../css/pure/pure.css">
        <!--[if lte IE 8]>
            <link rel="stylesheet" href="../css/pure/side-menu-old-ie.css">
        <![endif]-->
        <!--[if gt IE 8]><!-->
        <link rel="stylesheet" href="../css/pure/side-menu.css">
        <!--<![endif]-->
        <link rel="stylesheet" href="../css/monitoreoMovil.css">
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=es"></script>        
        <script type="text/javascript" src="../js/jquery.js"></script>
        <script type="text/javascript" src="../js/monitoreoMovil.js"></script>
    </head>
    <body>
        <div id="main">
            <div class="header">
                <center>
                    <img class="pure-img" src="../imagenes/logo.jpg">
                    <a href="cerrarSesion.jsp" ><button class="pure-button">Cerrar Sesion (<%=usuario%>)</button></a>
                </center>
            </div>
            <div class="content">

                <center>
                    
                    Placa: <input class="noBorde" type="text" id="placa" value="<%=placa%>"/><br>
                    Ciudad: <input class="noBorde" type="text" id="ciudad"/><br>
                    Estado: <input class="noBorde" type="text" id="estado" value="<%=estado%>"/><br>
                    <a href="listadoPlacas.jsp"><button type="submit" class="pure-button pure-button-primary">Volver</button></a>
                    <br>
                    <div id="mapa">
                    </div>
                    <script type="text/javascript">
                        $("#mapa").ready(function() {
                        mostrarMapa(<%=posicion%>);
                        obtenerCiudad('#ciudad', <%=posicion%>);
                    });
                    </script>
                    <button class="button-secondary pure-button" id="botonVerMas">Ver más...</button>
                    <table id="tabla">
                        <thead>
                            <tr>                                					
                                <th>Placa</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Estado</th>
                                <!--<th>Posición</th>-->
                                <th>Recorrido</th>
                            </tr>
                        </thead>
                        <tbody id="resultado">
                            <!--<tr>
                                <td>James</td>
                                <td>Matman</td>
                                <td>Chief Sandwich Eater</td>
                                <td>Lettuce Green</td>
                                <td>Trek</td>
                                <td>Digby Green</td>
                            </tr>-->                            
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>