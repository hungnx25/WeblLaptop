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
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class UpdateCus extends HttpServlet {

    CusDAO cdao;
    Ultility u = new Ultility();

    public void init() {
        cdao = new CusDAO();
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
            out.println("<title>Servlet UpdateCus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCus at " + request.getContextPath() + "</h1>");
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
        String logname = request.getParameter("logname");
        Customers c = cdao.getCustomerByLogName(logname);
        ses.setAttribute("Cuss", c);
        response.sendRedirect(request.getContextPath() + "/View/UpdateCus.jsp");
//        request.getRequestDispatcher(request.getContextPath() + "/View/UpdateCus.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        String logname = request.getParameter("logname");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int quesId = Integer.parseInt(request.getParameter("quesid"));
        String answer = request.getParameter("answer");
        boolean active = Boolean.parseBoolean(request.getParameter("active"));

        Customers c = u.checkLogName(logname);
        HttpSession ses = request.getSession();
        
        if (!u.checkPara(phone, "^0[913]{1}[0-9]{8}$")) {
            request.setAttribute("ErrorPhone", "ErrorPhone");
            request.getRequestDispatcher("View/UpdateCus.jsp").forward(request, response);
        }
        if (c != null) {
            cdao.AdUpdate(logname, name, email, phone, quesId, answer, active);
            ArrayList<Customers> listCus = cdao.getCustomerList();
            ses.setAttribute("listCus", listCus);
            response.sendRedirect(request.getContextPath() + "/AdCusPage");
        } else {
            response.sendRedirect(request.getContextPath() + "/ControlSignUp");
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
