package web.home.student;

import config.HibernateUtil;
import entity.Question;
import entity.Seminar;
import entity.Student;
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

public class AddQuestion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            
            Transaction tx = hibernateSession.beginTransaction();
            String quiz = request.getParameter("quiz");
            HttpSession httpSession = request.getSession();
            Seminar seminar = (Seminar) httpSession.getAttribute("seminar");
            Student student = (Student)httpSession.getAttribute("student");
            //check session is expired or not
            if (seminar != null) {
                Question question = new Question();
                question.setSeminar(seminar);
                question.setQuestion(quiz);
                hibernateSession.saveOrUpdate(question);
                hibernateSession.saveOrUpdate(seminar);
                hibernateSession.saveOrUpdate(student);
                tx.commit();
                hibernateSession.flush();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Successfully Added To the Database...');");
                out.println("location='jsp/student/addQuestion.jsp';");
                out.println("</script>");
                hibernateSession.close();
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session Is Expired...');");
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
