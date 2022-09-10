/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.BillDAO;
import DAL.CusDAO;
import Models.Cart;
import Models.Customers;
import Models.Item;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Bill extends HttpServlet {
   BillDAO bdao;
   public void init(){
       bdao = new BillDAO();
               
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
            out.println("<title>Servlet Bill</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Bill at " + request.getContextPath () + "</h1>");
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
        //processRequest(request, response);
        
        response.sendRedirect(request.getContextPath()+"/View/Buy.jsp");
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
        HttpSession ses = request.getSession();
        Cookie[] cookies = request.getCookies();
        Customers c = (Customers) ses.getAttribute("cus");
        Cart cart = (Cart) ses.getAttribute("cart");

        String Add = (String) ses.getAttribute("add");
        String logname = (String) ses.getAttribute("logname");

        if (c != null) {
            bdao.addBill(c, cart, Add);
            //xoa cookie cu
            for (Cookie ck : cookies) {
                //da co cookie tu truoc
                if (ck.getName().equals("cart" + c.getLoginName())) {
//                    response.sendRedirect(request.getContextPath() + "/views/xxx.jsp");
                    ck.setMaxAge(0);
                    response.addCookie(ck);
                    break;
                }
            }
        }
        ses.setAttribute("size", 0);
        response.sendRedirect(request.getContextPath() + "/View/OrderSuccess.jsp");
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
