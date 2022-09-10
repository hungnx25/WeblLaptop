/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.AdDAO;
import Models.Admins;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class SettingAd extends HttpServlet {
    AdDAO adao;
    Ultility u = new Ultility();
    
    public void init(){
        adao = new AdDAO();
    }
    
    
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SettingAd</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingAd at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       // processRequest(request, response);
//        HttpSession ses= request.getSession();
//        Admins a = (Admins) ses.getAttribute("ad");
//        String logname = a.getLoginName();
//        Admins ad = adao.getAdByLogName(logname);
//        ses.setAttribute("ad", ad);
        response.sendRedirect(request.getContextPath()+"/View/Setting.jsp");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        String name = request.getParameter("name");
        String logname = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String add = request.getParameter("add");
        String pass = request.getParameter("pass");
        String npass = request.getParameter("npass");
        String cfpass = request.getParameter("cfpass");

        adao.InforUpdate(logname, name, email, phone, add);
        if (npass.equals(cfpass) && u.checkPass(logname, pass) != null) {
            adao.UpdatePass(logname, npass);
        }else{
            request.setAttribute("ErrorUpdate", "Wrong pass or re-pass");
            request.getRequestDispatcher(request.getContextPath()+"/View/Setting.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
