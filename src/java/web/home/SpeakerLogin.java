/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.home;

import config.HibernateUtil;
import entity.Seminar;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SpeakerLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();
            String username = request.getParameter("userName");
            String password = request.getParameter("password");
            String keyS = request.getParameter("eventCode");
            try {
                //select sseminar from given id
                Long key = Long.parseLong(keyS);
                Seminar seminar = (Seminar) hibernateSession.get(Seminar.class, key);
                //check session is expired or not
                if (seminar != null) {
                    System.out.println(username);
                    if (seminar.getUserName().equals(username)) {
                        if (seminar.getPassword().equals(password)) {
                            HttpSession httpSession = request.getSession();
                            httpSession.setAttribute("seminar", seminar);
                            RequestDispatcher rd = request.getRequestDispatcher("jsp/home/speakerDashBoard.jsp");
                            rd.forward(request, response);
                            tx.commit();
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Invalid Password ...');");
                            out.println("location='jsp/home/speakerLogin.jsp';");
                            out.println("</script>");
                        }

                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Invalid User Name...');");
                        out.println("location='jsp/home/speakerLogin.jsp';");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Event Code...');");
                    out.println("location='jsp/home/speakerLogin.jsp';");
                    out.println("</script>");
                }
            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Event Code...');");
                out.println("location='jsp/home/speakerLogin.jsp';");
                out.println("</script>");
            } finally {
                hibernateSession.close();
            }
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
