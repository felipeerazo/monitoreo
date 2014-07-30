/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Modelo.HistorialVehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Felipe
 */
@WebServlet(name = "ServletHistorialVehiculo", urlPatterns = {"/ServletHistorialVehiculo"})
public class ServletHistorialVehiculo extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String placa = request.getParameter("placa");
        Controlador.DAOHistorialVehiculo daoHistorialVehiculo = new Controlador.DAOHistorialVehiculo();
        LinkedList<HistorialVehiculo> lista;
        try {
            lista = daoHistorialVehiculo.listar(placa);
            if (lista.size() == 0) {
                lista = new LinkedList<HistorialVehiculo>();
                lista.add(new HistorialVehiculo("No existen registros o el vehículo no está registrado.", "", "", "", "", ""));
            }
        } catch (SQLException ex) {
            out.println("Error: " + ex);
            out.close();
            return;
        }
        try {
            /* TODO output your page here. You may use following sample code. */
            for (int i = 0; i < lista.size(); i++) {
                out.print("<tr><td>" + lista.get(i).getPlaca() + "</td>");
                out.print("<td>" + lista.get(i).getFecha() + "</td>");
                out.print("<td>" + lista.get(i).getHora() + "</td>");
                out.print("<td>" + lista.get(i).getEstadoGps() + "</td>");
                //out.print("<td>" + lista.get(i).getPosicion() + "</td>");
                out.print("<td>" + lista.get(i).getRecorrido() + "</td></tr>");
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
