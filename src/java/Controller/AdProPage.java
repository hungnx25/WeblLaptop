package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAL.ProDAO;
import Models.PageInfor;
import Models.Products;
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
public class AdProPage extends HttpServlet {

//    ProDAO pdao; 
//    
//    public void init() {
//        pdao = new ProDAO();
//    }
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
            out.println("<title>Servlet AdProPage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdProPage at " + request.getContextPath() + "</h1>");
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
        ArrayList<Products> listPro = (ArrayList<Products>) ses.getAttribute("listPro");
        
        PageInfor pagePro = (PageInfor) ses.getAttribute("page");
        String cp = request.getParameter("cp");
        int nrpp = 6;
        
        if (cp != null) {
            pagePro.setCp(Integer.parseInt(cp));
            pagePro.calc();
            ses.setAttribute("page", pagePro);
        }
        if (pagePro != null && listPro != null) {
            pagePro.setSize(listPro.size());
            pagePro.calc();
            ses.setAttribute("page", pagePro);
        }

        if (pagePro == null) {
            pagePro = new PageInfor(1, 6, listPro.size());
            pagePro.calc();
            ses.setAttribute("page", pagePro);
        }

        response.sendRedirect(request.getContextPath() + "/View/AdminProPage.jsp");
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
        doGet(request, response);
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
