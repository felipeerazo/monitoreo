<%-- 
    Document   : index
    Created on : 24/07/2014, 03:05:22 PM
    Author     : Felipe
--%>

<%@page import="Controlador.DAOLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            response.sendRedirect("listadoPlacas.jsp");
        }

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Login - SAE Taxímetros</title>
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
                <center><img class="pure-img" src="../imagenes/logo.jpg"></center>
            </div>

            <div class="content">
                <center>
                    <h2 class="content-subhead">Ingreso</h2>                
                    <form class="pure-form" method="POST" action="index.jsp">                        
                        <input type="text" placeholder="Usuario" name="usuario">
                        <input type="password" placeholder="Clave" name="clave">
                        <!--<label for="remember">
                            <input id="remember" type="checkbox"> Remember me
                        </label>-->
                        <button type="submit" class="pure-button pure-button-primary">Ingresar</button>

                    </form>
                </center>
            </div>
        </div>
    </body>
</html>