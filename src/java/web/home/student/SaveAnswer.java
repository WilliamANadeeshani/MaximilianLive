package web.home.student;

import config.HibernateUtil;
import entity.Mcq;
import entity.Seminar;
import entity.Student;
import entity.StudentMcq;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class SaveAnswer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            boolean t1 = true;
            boolean t2 = true;
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();
            String ans = request.getParameter("ans");
            HttpSession httpSession = request.getSession();
            Seminar seminar = (Seminar) httpSession.getAttribute("seminar");
            Student student = (Student) httpSession.getAttribute("student");
            Mcq mcq = (Mcq) httpSession.getAttribute("mcq");
            long id = mcq.getMcqId();
            if (student != null && seminar != null) {
                List list = hibernateSession.createCriteria(StudentMcq.class).list();
                if (!list.isEmpty()) {
                    t1 = false;
                    for (Object o : list) {
                        StudentMcq sm = (StudentMcq) o;
                        if (sm.getStudent().getStudentId().equals(student.getStudentId()) && sm.getMcq().getMcqId().equals(id)) {
                            t2 = false;
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('You have already answer for this question...');");
                            out.println("location='ViewMcq';");
                            out.println("</script>");
                            tx.commit();
                            hibernateSession.close();
                            break;
                        }
                    }
                }

                if (t2) {
                    StudentMcq sm = new StudentMcq();
                    sm.setMcq(mcq);
                    sm.setStudent(student);
                    if (ans.equals(mcq.getAns_correct())) {
                        sm.setResult("c");
                        int correctCount = sm.getMcq().getCorrectStudentCount();
                        sm.getMcq().setCorrectStudentCount(correctCount + 1);
                        sm.getMcq().setTotal(sm.getMcq().getTotal() + 1);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Your Answer Is Correct...');");
                        out.println("location='ViewMcq';");
                        out.println("</script>");
                    } else {
                        sm.setResult("w");
                        int wrongCount = sm.getMcq().getWrongStudentCount();
                        sm.getMcq().setWrongStudentCount(wrongCount + 1);
                        sm.getMcq().setTotal(sm.getMcq().getTotal() + 1);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Your Answer Is Wrong...');");
                        out.println("location='ViewMcq';");
                        out.println("</script>");
                    }
                    hibernateSession.merge(sm);
                    hibernateSession.merge(sm.getMcq());
                    tx.commit();
                    hibernateSession.close();
                }

            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session Is Expired...');");
                out.println("location='jsp/home/studentLogin.jsp';");
                out.println("</script>");
                tx.commit();
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
