<%-- 
    Document   : cerrarSesion
    Created on : 26/05/2014, 07:41:04 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
    //request.getSession().removeAttribute("Sesion");
    // out.print(request.getSession().getAttribute("Sesion"));
    //session.invalidate();
    //
    response.setHeader("Cache-Control", "no-store");
    HttpSession sesionOk = request.getSession();
    sesionOk.setAttribute("Sesion", "");
    sesionOk.invalidate();
    response.sendRedirect("index.jsp");
%>

