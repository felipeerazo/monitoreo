<%@page import="Modelo.HistorialVehiculo"%>
<%@page import="java.util.LinkedList"%>
<%
    Controlador.DAOHistorialVehiculo daoHistorialVehiculo = new Controlador.DAOHistorialVehiculo();
    String placa = request.getParameter("placa");
    String titulo = "";
    boolean mostrarBoton = false;

    LinkedList<HistorialVehiculo> lista;
    if (placa == null || placa.equals("")) {
        lista = daoHistorialVehiculo.listar();
        titulo = "Mostrando todos los historiales de vehículos";
    } else {
        lista = daoHistorialVehiculo.listar(placa);
        titulo = "Mostrando los resultados para el vehículo: " + placa;
        mostrarBoton = true;
        if (lista.size() == 0) {
            lista = new LinkedList<HistorialVehiculo>();
            lista.add(new HistorialVehiculo("No existen registros o el vehículo no está registrado.", "", "", "", "", ""));
        }
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Monitoreo - SAE Taxímetros</title>
        <link rel="shortcut icon" href="imagenes/dq.ico">

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/grid.css" rel="stylesheet">
        <link type="text/css" href="css/estiloTabla.css" rel="stylesheet" media="all" />
        <link type="text/css" href="css/estilo.css" rel="stylesheet" media="all" />
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->

        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=es"></script>        
        <script type="text/javascript" src="js/scriptMapa.js"></script>

        <%   
    response.setHeader("Cache-Control", "no-store");
            //String usuario = (String) request.getSession().getAttribute("Sesion");
            String usuario=(String) session.getAttribute("Sesion");
             //out.print(usuario);
            //request.getSession().invalidate();
            if (usuario == null) {
                response.sendRedirect("index.jsp");
            }

        %>
    </head>

    <body>
        <div class="container">

            <div class="navbar-collapse ">
                <table class="navbar-header">
                    <tr>
                        <td><img src="imagenes/logo.jpg" alt="logo" height="70"></td>
                        <td><h3 class="letra-verde">Monitoreo de vehículos</h3></td>
                    </tr>
                </table>



                <form class="navbar-form navbar-right" action="monitoreo.jsp" method="POST">
                    <div class="form-group">
                        <input type="text" placeholder="Buscar placa..." class="form-control" name="placa">
                    </div>


                    <button type="submit" class="btn btn-success">Buscar</button>

                    <a href="cerrarSesion.jsp" >Cerrar Sesion (<%=usuario%>)</a>
                </form>

            </div>

            <div class="row">
                <div class="col-md-8">
                    <legend class="letra-verde"><%=titulo%></legend>
                    <%if (mostrarBoton) {%>
                    <form action="monitoreo.jsp" method="POST">
                        <button name="Mostrar_Todo" type="submit" class="btn btn-default">Mostrar Todo</button>                                    
                    </form>
                    <br>
                    <%}%>                    
                    <div id="page-wrap">
                        <table>
                            <thead>
                                <tr>
                                    <th>Placa</th>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Estado</th>
                                    <th>Posición</th>
                                    <th>Recorrido</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (int i = 0; i < lista.size(); i++) {
                                        out.print("<tr onclick=\"verInfo(" + lista.get(i).getPosicion() + ", true, '" + lista.get(i).getPlaca() + "');\">");
                                        out.print("<td>" + lista.get(i).getPlaca() + "</td>");
                                        out.print("<td>" + lista.get(i).getFecha() + "</td>");
                                        out.print("<td>" + lista.get(i).getHora() + "</td>");
                                        out.print("<td>" + lista.get(i).getEstadoGps()+ "</td>");
                                        out.print("<td>" + lista.get(i).getPosicion() + "</td>");
                                        out.print("<td>" + lista.get(i).getRecorrido() + "</td></tr>");
                                    }
                                %>                                
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-4">
                    <fieldset>
                        <legend class="letra-verde">Placa:</legend>
                        <!img src="imagenes/placa.JPG" alt="Placa">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td id="fuenteplaca" width="151" height="68" background="imagenes/placa_particular.png"></td>
                            </tr>
                        </table>
                    </fieldset>                    
                    <fieldset class="fieldset_mapa">
                        <legend class="letra-verde">Posición:</legend>
                        <div id="mapa">
                        </div>
                        <script type="text/javascript">
                            //mostrarMapa(5.0622453,-75.5071972, false);
                            <%="verInfo(" + lista.get(0).getPosicion() + ", true, '" + lista.get(0).getPlaca() + "');"%>
                        </script>
                    </fieldset>
                </div>
            </div>                      
        </div> <!-- /container -->

        <div id="footer">
            <div class="container">
                <p class="text-muted credit">DQ Ingeniería &copy;Copyright</p>
            </div>
        </div>





        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
    </body>
</html>
