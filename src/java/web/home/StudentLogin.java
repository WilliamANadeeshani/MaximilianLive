package web.home;

import config.HibernateUtil;
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
public class StudentLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();
            String studentId = request.getParameter("studentId");
            String password = request.getParameter("password");
            try {
                Long key = Long.parseLong(studentId);
                try {
                    Student student = (Student) hibernateSession.get(Student.class, key);
                    //check session is expired or not
                    if (student != null) {
                        if (student.getPassword().equals(password)) {
                            HttpSession httpSession = request.getSession();
                            httpSession.setAttribute("seminar", student.getSeminar());
                            httpSession.setAttribute("student", student);
                            RequestDispatcher rd = request.getRequestDispatcher("jsp/home/studentDashBoard.jsp");
                            rd.forward(request, response);
                            tx.commit();
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Invalid Password...');");
                            out.println("location='jsp/home/studentLogin.jsp';");
                            out.println("</script>");
                        }
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Invalid Login Details...');");
                        out.println("location='jsp/home/studentLogin.jsp';");
                        out.println("</script>");
                    }
                } catch (Exception e) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Event Code...');");
                    out.println("location='jsp/home/studentLogin.jsp';");
                    out.println("</script>");
                } finally {
                    hibernateSession.close();
                }
            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Student Id...');");
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
