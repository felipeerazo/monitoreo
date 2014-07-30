<%@page import="Controlador.DAOLogin"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <script type="text/javascript">
            var device = navigator.userAgent;
            if (device.match(/Iphone/i) || device.match(/Ipod/i) || device.match(/Android/i) || device.match(/J2ME/i) || device.match(/BlackBerry/i) || device.match(/iPhone|iPad|iPod/i) || device.match(/Opera Mini/i) || device.match(/IEMobile/i) || device.match(/Mobile/i) || device.match(/Windows Phone/i) || device.match(/windows mobile/i) || device.match(/windows ce/i) || device.match(/webOS/i) || device.match(/palm/i) || device.match(/bada/i) || device.match(/series60/i) || device.match(/nokia/i) || device.match(/symbian/i) || device.match(/HTC/i)) {
                document.location = 'movil/index.jsp';
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>Login - SAE Taxímetros</title>
        <link rel="shortcut icon" href="imagenes/dq.ico">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/grid.css" rel="stylesheet">
        <link type="text/css" href="css/estiloTabla.css" rel="stylesheet" media="all" />
        <link type="text/css" href="css/estilo.css" rel="stylesheet" media="all" />
        <link type="text/css" href="css/slide.css" rel="stylesheet" media="all" />
        <script src="js/jquery.js"></script>
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">            
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-6">
                    <center><img src="imagenes/logo.jpg" alt="logo"></center>
                </div>
                <div class="col-md-3">
                    <img src="imagenes/llaves.png" alt="logo">
                </div>
                <div class="col-md-3">                    
                    <fieldset>
                        <legend>Ingreso:</legend>
                        <form method="POST" action="index.jsp">
                            <div class="form-group">
                                <input type="text" placeholder="Usuario" class="form-control" name="usuario"><br>
                                <input type="password" placeholder="Clave" class="form-control" name="clave">
                            </div>
                            <button type="submit" class="btn btn-success">Ingresar</button>
                        </form>
                        <%

                            if (request.getParameter("usuario") != null && request.getParameter("clave") != null) {
                                String usuario = request.getParameter("usuario");
                                String clave = request.getParameter("clave");
                                DAOLogin daoLogin = new DAOLogin();
                                String reporte = daoLogin.comprobarUsuario(usuario, clave);
                                out.print(reporte);

                                if (reporte.equals("")) {
                                    out.print("El usuario no existe");
                                }
                                if (reporte.equals("1")) {
                                    HttpSession sesion = request.getSession();
                                    sesion.setAttribute("Sesion", usuario);
                                    response.sendRedirect("panico.jsp");
                                }
                                if (reporte.equals("2")) {
                                    HttpSession sesion = request.getSession();
                                    sesion.setAttribute("Sesion", usuario);
                                    response.sendRedirect("monitoreo.jsp");
                                }

                            }
                        %>
                    </fieldset>
                </div>                        

            </div>


            <!slide>
            <div class="row" style="border: 0;">
                <div id="wowslider-container1">
                    <div class="ws_images">
                        <ul>
                            <li><img src="imagenes/slide/images/celular.png" alt="celular" title="Tu localización" id="wows1_0"/></li>
                            <li><img src="imagenes/slide/images/movil.jpg" alt="movil" title="Desde tu movil" id="wows1_1"/></li>
                            <li><img src="imagenes/slide/images/monitoreo.png" alt="monitoreo" title="Monitoreo de tu taxi" id="wows1_2"/></li>
                            <li><img src="imagenes/slide/images/taxi.png" alt="taxi" title="En todo el mundo" id="wows1_3"/></li>
                            <li><img src="imagenes/slide/images/sae.jpg" alt="Localizando" title="SAE-AQUITAX" id="wows1_4"/></li>
                            <li><img src="imagenes/slide/images/gprs.jpg" alt="gprs" title="GPRS" id="wows1_5"/></li>
                            <li><img src="imagenes/slide/images/taximetro.png" alt="taximetro" title="Taximetros" id="wows1_6"/></li>
                        </ul>
                    </div>
                    <div class="ws_bullets">
                        <div>
                            <a href="#" title="Tu localizacion"><img src="imagenes/slide/tooltips/celular.png" alt="celular"/>1</a>
                            <a href="#" title="Desde tu móvil"><img src="imagenes/slide/tooltips/movil.jpg" alt="movil"/>2</a>
                            <a href="#" title="Monitoreo de tu taxi"><img src="imagenes/slide/tooltips/monitoreo.png" alt="monitoreo"/>3</a>
                            <a href="#" title="En todo el mundo"><img src="imagenes/slide/tooltips/taxi.png" alt="taxi"/>4</a>
                            <a href="#" title="SAE-AQUITAX"><img src="imagenes/slide/tooltips/sae.jpg" alt="sae"/>5</a>
                            <a href="#" title="GPRS"><img src="imagenes/slide/tooltips/gprs.jpg" alt="gprs"/>6</a>
                            <a href="#" title="Taximetros"><img src="imagenes/slide/tooltips/taximetro.png" alt="unnamed"/>7</a>
                        </div>
                    </div>
                    <div class="ws_shadow"></div>
                </div>
                <script type="text/javascript" src="js/wowslider.js"></script>
                <script type="text/javascript" src="js/script.js"></script>
            </div>
        </div>
        <div id="footer">
            <div class="container">
                <p class="text-muted credit">DQ Ingeniería &copy;Copyright</p>
            </div>
        </div>
    </body>
</html>