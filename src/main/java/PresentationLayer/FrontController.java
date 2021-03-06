/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PresentationLayer;

import FunctionLayer.Exceptions.LoginSampleException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Class that process request for both GET and POST methods
 *
 * @author Alexander Pihl, Mick Larsen, Morten Rahbek, Per Kringelbach, Jean-Poul Leth-Møller
 */
@WebServlet( name = "FrontController", urlPatterns = { "/FrontController" } )
public class FrontController extends HttpServlet {

    /**
     Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     methods.

     @param request servlet request
     @param response servlet response
     @throws ServletException if a servlet-specific error occurs
     @throws IOException if an I/O error occurs
     */
    protected void processRequest( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            Command action = Command.from( request );
            String view = action.execute( request, response );
            if (view.equals("index")){
                request.getRequestDispatcher(view + ".jsp").forward(request, response);
            }
            if (view.contains("admin")) {
                request.getRequestDispatcher("/WEB-INF/Admin/" + view + ".jsp").forward(request, response);
            }
            if (view.contains("customer")) {
                request.getRequestDispatcher("/WEB-INF/Customer/" + view + ".jsp").forward(request, response);
            }
            if (view.equals("login")) {
                request.getRequestDispatcher("/WEB-INF/System/" + view + ".jsp").forward(request, response);
            }
        } catch (UnsupportedEncodingException | LoginSampleException | ClassNotFoundException ex) {
            request.setAttribute( "error", ex.getMessage() );
            request.getRequestDispatcher( "/WEB-INF/System/error.jsp" ).forward( request, response );
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     Handles the HTTP <code>GET</code> method.

     @param request servlet request
     @param response servlet response
     @throws ServletException if a servlet-specific error occurs
     @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
    }

    /**
     Handles the HTTP <code>POST</code> method.

     @param request servlet request
     @param response servlet response
     @throws ServletException if a servlet-specific error occurs
     @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost( HttpServletRequest request, HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
    }

    /**
     Returns a short description of the servlet.

     @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
