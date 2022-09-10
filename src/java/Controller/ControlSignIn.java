/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AdDAO;
import DAL.CusDAO;
import Models.*;
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
public class ControlSignIn extends HttpServlet {

    AdDAO adDao;
    CusDAO cusDao;

    public void init() {
        adDao = new AdDAO();
        cusDao = new CusDAO();
    }

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControlSignIn</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlSignIn at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        response.sendRedirect(request.getContextPath() + "/View/SignIn.jsp");
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
        //processRequest(request, response);
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");

        Cookie cname = new Cookie("cname", name);
        Cookie cpass = new Cookie("cpass", pass);
        Cookie cremember = new Cookie("cremember", remember);

        if (remember != null) {
            cname.setMaxAge(60 * 60 * 24);
            cpass.setMaxAge(60 * 60 * 24);
            cremember.setMaxAge(60 * 60 * 24);
        } else {
            cname.setMaxAge(0);
            cpass.setMaxAge(0);
            cremember.setMaxAge(0);
        }
        response.addCookie(cname);
        response.addCookie(cpass);
        response.addCookie(cremember);

        Admins ad = checkAdmins(name, pass);
        Customers cus = checkCustomers(name, pass);
        HttpSession ses = request.getSession();
        ArrayList<Products> plist = (ArrayList<Products>) ses.getAttribute("listPro");

        if (cus == null && ad == null) {
            response.sendRedirect(request.getContextPath() + "/View/SignIn.jsp");
        } else if (cus != null) {
            ses.setAttribute("cus", cus);

            Cookie[] arr = request.getCookies();
            String txt = "";

            for (Cookie c : arr) {
                if (c.getName().equals("cart" + cus.getLoginName())) {
                    txt = c.getValue();
                    break;
                }
            }

            Cart cart = new Cart(txt, plist, cus.getLoginName());
            ses.setAttribute("size", cart.getSize());
            ses.setAttribute("cart", cart);

            response.sendRedirect(request.getContextPath() + "/View/Home.jsp");
        } else if (ad != null) {
            ses.setAttribute("ad", ad);
            response.sendRedirect(request.getContextPath() + "/View/Home.jsp");
        } else {
            doGet(request, response);
        }
    }

    private Customers checkCustomers(String u, String p) {
        for (Customers cs : cusDao.getCustomerList()) {
            if (cs.getLoginName().equals(u) && cs.getPassword().equals(p)) {
                return cs;
            }
        }
        return null;
    }

    private Admins checkAdmins(String u, String p) {
        for (Admins ad : adDao.getAdminList()) {
            if (ad.getLoginName().equals(u) && ad.getPassword().equals(p)) {
                return ad;
            }
        }
        return null;
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
