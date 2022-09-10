/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.ProDAO;
import Models.Products;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddPr extends HttpServlet {

    ProDAO pdao;
    Ultility u = new Ultility();

    public void init() {
        pdao = new ProDAO();
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
            out.println("<title>Servlet AddPr</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPr at " + request.getContextPath() + "</h1>");
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
        response.sendRedirect(request.getContextPath() + "/View/CreatePro.jsp");
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String discountPrice = request.getParameter("disprice");
        String brand = request.getParameter("Brand");
        String screen = request.getParameter("Screen");
        String cpu = request.getParameter("CPU");
        String ram = request.getParameter("RAM");
        String hardDrive = request.getParameter("HardDrive");
        String graphics = request.getParameter("Graphics");
        String os = request.getParameter("OS");
        String weight = request.getParameter("Weight");
        int buyed = 0;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String img = request.getParameter("img");
        String des = request.getParameter("des");
        
        Products p = u.checkId(id);
        
        if(p != null){
            request.setAttribute("IdExisted", "Id Existed");
            request.getRequestDispatcher(request.getContextPath()+"/CreatePro.jsp").forward(request, response);
        }else{
            pdao.Insert(id, name, price, discountPrice, brand, screen, cpu, ram, hardDrive, graphics, os, weight, buyed, quantity, img);
            pdao.InsertDes(id, img, des);
            response.sendRedirect(request.getContextPath()+"/AdProPage");
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
