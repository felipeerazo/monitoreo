
<%@page import="Modelo.HistorialVehiculo"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Pánico - SAE Taxímetros</title>
        <link rel="shortcut icon" href="imagenes/dq.ico">

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/grid.css" rel="stylesheet">
        <link type="text/css" href="css/estiloTabla.css" rel="stylesheet" media="all" />
        <link type="text/css" href="css/estilo.css" rel="stylesheet" media="all" />
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">


        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9] >
        < script src = "../../assets/js/html5shiv.js" ></script>
    <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->

        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=es"></script>        
        <script type="text/javascript" src="js/scriptMapa.js"></script>
        <%
            response.setHeader("Cache-Control", "no-store");
            String usuario = (String) session.getAttribute("Sesion");
            if (usuario == null) {
                response.sendRedirect("index.jsp");
            }

            Controlador.DAOHistorialVehiculo daoHistorialVehiculo = new Controlador.DAOHistorialVehiculo();
            String placa = request.getParameter("placa");
            String s="";
            String posicion="";
            if(placa!=null)
            {
                LinkedList<HistorialVehiculo> lista=daoHistorialVehiculo.listar(placa);
                posicion= lista.get(0).getPosicion();
                out.print("<script>window.onload=function(){ buscarPanico("+posicion+");};</script>");
            }
        %>
    </head>

    <body>
        <div class="contenido">

            <div class="navbar-collapse ">
                <table class="navbar-header">
                    <tr>
                        <td><img src="imagenes/logo.jpg" alt="logo" height="70"></td>
                        <td><h3 class="letra-verde">Monitoreo policial</h3></td>
                    </tr>
                </table>

                <form class="navbar-form navbar-right"  method="POST" action="panico.jsp">

                    <div class="form-group">
                        <input type="text" placeholder="Ingresar Placa..." class="form-control" name="placa" id="placa">
                    </div>
                    <button type="submit" class="btn btn-success" >Detalles del Vehículo</button>
                    <a href="cerrarSesion.jsp" >Cerrar Sesion (<%=usuario%>)</a>

                </form>

            </div>
            <div class="row">
                <fieldset class="mapa">
                    <div id="mapa_panico">
                    </div>
                    <script type="text/javascript">mostrarMapaPanico();</script>
                    <%                        
                        LinkedList<HistorialVehiculo> panico = daoHistorialVehiculo.vehiculosPanico();
                        LinkedList<HistorialVehiculo> lista = daoHistorialVehiculo.listar();
                        out.print("<script type=\"text/javascript\">");
                        //sin panico
                        // if (panico.size() == 0 || panico==null) {
                        for (int i = 0; i < lista.size(); i++) {
                            out.print("ubicarVehiculos(" + lista.get(i).getPosicion() + ", '" + lista.get(i).getPlaca() + "', 'imagenes/icono_carro.png');");
                            //   }
                        }
                            //else {

                        //panico
                        if (panico != null) {
                            for (int i = 0; i < panico.size(); i++) {

                                LinkedList<HistorialVehiculo> listaVecinos = daoHistorialVehiculo.listarVecinos(panico.get(i).getPlaca(), panico.get(i).getPosicion());
                                for (int j = 0; j < listaVecinos.size(); j++) {
                                    out.print("ubicarVehiculos(" + listaVecinos.get(j).getPosicion() + ", '" + listaVecinos.get(j).getPlaca() + "', 'imagenes/icono_carro_vecino.png');");
                                }
                                out.print("ubicarVehiculos(" + panico.get(i).getPosicion() + ", '" + panico.get(i).getPlaca() + "', 'imagenes/icono_carro_panico.png');");
                            }
                        }
                        //}
                        out.print("</script>");

                    %>

                    <!--<div id="modal" class="modal">
                        <center>
                            <div class="modal_form">
                                <form action="">
                                    <input type="text" name="telefono" value="Teléfono"><br/>						
                                </form>
                                <a href="#close"><button onclick="mostrarMapa(5.0622453, -75.5071972, true);">Verificar<br>asignación</button></a>			
                            </div>
                        </center>
                    </div>                       -->
                </fieldset>            

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
