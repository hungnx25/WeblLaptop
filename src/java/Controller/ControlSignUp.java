/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CusDAO;
import Models.Customers;
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
public class ControlSignUp extends HttpServlet {

    CusDAO cusDao;

    public void init() {
        cusDao = new CusDAO();
    }

    Ultility u = new Ultility();

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
            out.println("<title>Servlet ControlSignUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlSignUp at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
        response.sendRedirect(request.getContextPath()+"/View/SignUp.jsp");
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
        String logName = request.getParameter("logname");
        String pass = request.getParameter("pass");
        String cfPass = request.getParameter("cfpass");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int quesId = Integer.parseInt(request.getParameter("quesId"));
        String ans = request.getParameter("ans");
        boolean active = false;
               
        HttpSession ses = request.getSession();
        ses.setAttribute("email", email);
        ses.setAttribute("userName", logName);
        
        Customers cus = u.checkLogName(logName);
        Customers mail = u.checkEmail(email);
        
        if (!u.checkPara(phone, "^0[913]{1}[0-9]{8}$")) {
            request.setAttribute("ErrorPhone", "ErrorPhone");
            request.getRequestDispatcher("View/SignUp.jsp").forward(request, response);
        }
        if (cus != null) {
            request.setAttribute("Existed", "LogName này đã tồn tại mời nhập LogName khác");
            request.getRequestDispatcher("View/SignUp.jsp").forward(request, response);
        } else if (!pass.equals(cfPass)) {
            request.setAttribute("ErrorPass", "Mật khẩu nhập lại không đúng ");
            request.getRequestDispatcher("View/SignUp.jsp").forward(request, response);
        } else if (mail != null) {
            request.setAttribute("MailExisted", "Email này đã tồn tại mời nhập Email khác ");
            request.getRequestDispatcher("View/SignUp.jsp").forward(request, response);
        } else {
            cusDao.Insert(logName, pass, name, email, phone, quesId, ans, active);
            
            response.sendRedirect(request.getContextPath() + "/Verify");
        }
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
