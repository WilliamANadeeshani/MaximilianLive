/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.home.speaker;

import config.HibernateUtil;
import entity.Seminar;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class AccountDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();

            String userName = request.getParameter("userName");
            String email = request.getParameter("email");

            HttpSession httpSession = request.getSession();
            Seminar seminar = (Seminar) httpSession.getAttribute("seminar");
            //check session is expired or not
            if (seminar != null) {
                seminar.setUserName(userName);
                seminar.setEmail(email);
                hibernateSession.saveOrUpdate(seminar);
                tx.commit();
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session is expired...Login Again...');");
                out.println("location='jsp/home/speakerLogin.jsp';");
                out.println("</script>");
            }

            hibernateSession.close();
        } finally {
            out.close();
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
