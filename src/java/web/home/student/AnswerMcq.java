package web.home.student;

import config.HibernateUtil;
import entity.Mcq;
import entity.Seminar;
import entity.Student;
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

/**
 *
 * @author William A Nadeeshani
 */
public class AnswerMcq extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String qId = request.getParameter("qId");
            long id = java.lang.Long.valueOf(qId);
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();
            HttpSession httpSession = request.getSession();
            Seminar seminar = (Seminar) httpSession.getAttribute("seminar");
            Student student = (Student) httpSession.getAttribute("student");
            Mcq mcq = (Mcq) hibernateSession.get(Mcq.class, id);
            if (seminar != null) {
                if (student != null) {
                    httpSession.setAttribute("mcq", mcq);
                    tx.commit();
                    hibernateSession.close();

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Session is expired...');");
                    out.println("location='jsp/home/studentLogin.jsp';");
                    out.println("</script>");
                    hibernateSession.close();
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session is expired...');");
                out.println("location='jsp/home/studentLogin.jsp';");
                out.println("</script>");
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
