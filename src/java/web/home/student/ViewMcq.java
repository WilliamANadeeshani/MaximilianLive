package web.home.student;

import config.HibernateUtil;
import entity.Mcq;
import entity.Seminar;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
public class ViewMcq extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();
            HttpSession httpSession = request.getSession();
            Seminar seminar = (Seminar) httpSession.getAttribute("seminar");
            Student student = (Student) httpSession.getAttribute("student");
            //check session is expired or not
            if (seminar != null) {
                if (student != null) {
                    List mcq_list = hibernateSession.createCriteria(Mcq.class).list();
//                    Set<Object> mcq_list = new HashSet<Object>(list);
                    List<Mcq> mcq = new ArrayList<Mcq>();
                    for (Object o : mcq_list) {
                        Mcq q = (Mcq) o;
                        System.out.println(q.getQuestion());
                        if (q.getSeminar().getEventId().equals(seminar.getEventId())) {
                            mcq.add(q);
                        }
                    }
                    System.out.println(mcq.size());
                    request.setAttribute("mcq", mcq);
                    RequestDispatcher rd = request.getRequestDispatcher("jsp/student/mcq.jsp");
                    rd.forward(request, response);
                    tx.commit();
                    hibernateSession.close();
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Session is expired...');");
                    out.println("location='jsp/home/studentLogin.jsp';");
                    out.println("</script>");
                }

            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session is expired...');");
                out.println("location='jsp/home/studentLogin.jsp';");
                out.println("</script>");
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
