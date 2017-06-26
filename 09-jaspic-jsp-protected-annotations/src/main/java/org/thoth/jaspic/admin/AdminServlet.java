/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.thoth.jaspic.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.thoth.jaspic.stockholder.StockholderServlet;

/**
 *
 * @author Michael Remijan mjremijan@yahoo.com @mjremijan
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/admin/*"})
@ServletSecurity(
    @HttpConstraint(rolesAllowed = {"AdminRole"})
)
public class AdminServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(AdminServlet.class);
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // I should get a HTTP Status 403 - Forbidden from the server before
        // this code is executed because I don't have the "AdminRole" role
        
        
        // http://www.example.com:80/super-application/path/to/servlet/path/info?a=1&b=2#boo
        //
        // servlet path: path/to/servlet
        // path info: path/info
        // query: a=1&b=2
        // fragment: boo
        String forward
            = "/WEB-INF";
        
        // Servlet Path
        forward += request.getServletPath();
    
        // Path Info
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.isEmpty()) {
            forward += pathInfo;
        }
        
        // Query String
        String query = request.getQueryString();
        if (query != null && !query.isEmpty()) {
            forward += "?" + query;
        }
        
        log.info(String.format("Forward to: \"%s\"", forward));
        request.getRequestDispatcher(forward).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
