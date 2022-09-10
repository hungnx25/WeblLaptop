/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CusDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

/**
 *
 * @author Admin
 */
public class Verify extends HttpServlet {

    CusDAO cusDao;
    Ultility u = new Ultility();

    public void init() {
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
            out.println("<title>Servlet Verify</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Verify at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        HttpSession ses = request.getSession();
        String verCode = String.valueOf(u.codeVerify());
        String host = getServletContext().getInitParameter("host");
        String port = getServletContext().getInitParameter("port");
        String userName = getServletContext().getInitParameter("user");
        String password = getServletContext().getInitParameter("pass");
        String toAddress = (String) ses.getAttribute("email");

        ses.setAttribute("verifyCode", verCode);
        try {
            u.sendEmail(host, port, userName, password, toAddress, "Verify Code for you account", verCode);
        } catch (MessagingException ex) {
            Logger.getLogger(Verify.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("/View/Vertify.jsp").forward(request, response);

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
        HttpSession ses = request.getSession();

        //processRequest(request, response);
        String logName = (String) ses.getAttribute("userName");

        String vcode = (String) ses.getAttribute("verifyCode");
        String code = request.getParameter("code");

        if (code.equals(vcode)) {
            cusDao.UpdateActive(logName, true);
            request.getRequestDispatcher("/ControlSignIn").forward(request, response);
        } else {
            request.setAttribute("wrongCode", "Wrong verifyCode");
            request.getRequestDispatcher("/View/Vertify.jsp").forward(request, response);
        }    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet descriptiontry {
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
