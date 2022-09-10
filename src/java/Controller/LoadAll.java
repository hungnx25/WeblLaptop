/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ProDAO;
import Models.PageInfor;
import Models.ProductDetails;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

/**
 *
 * @author Admin
 */
public class LoadAll extends HttpServlet {

    ProDAO proDao;

    public void init() {
        proDao = new ProDAO();
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
            out.println("<title>Servlet LoadAll</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoadAll at " + request.getContextPath() + "</h1>");
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

        PageInfor page = (PageInfor) ses.getAttribute("page");
        String cp = request.getParameter("cp");
        String nrpp = request.getParameter("nrpp");
        String sort = request.getParameter("sort");

        if (sort != null) {
            if (sort.equals("az")) {
                listPro = proDao.sortByName(listPro);
            } else if (sort.equals("low")) {
                listPro = proDao.sortByPrice(listPro);
            } else if (sort.equals("high")) {
                Collections.reverse( proDao.sortByPrice(listPro));
            }
            ses.setAttribute("listPro", listPro);
        } else {

        }

        if (cp != null) {
            page.setCp(Integer.parseInt(cp));
            page.calc();
            ses.setAttribute("page", page);
        }
        if (nrpp != null) {
            page.setNrpp(Integer.parseInt(nrpp));
            page.setCp(1);
            page.calc();
            ses.setAttribute("page", page);
        }
        if (page != null && listPro != null) {
            page.setSize(listPro.size());
            page.calc();
            ses.setAttribute("page", page);
        }

        //phan trang mac dinh
        if (page == null) {
            page = new PageInfor(1, 9, listPro.size());
            page.calc();
            ses.setAttribute("page", page);
        }
        response.sendRedirect(request.getContextPath() + "/View/Shop.jsp");
//        response.sendRedirect(request.getContextPath() + "/View/test.jsp");

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
