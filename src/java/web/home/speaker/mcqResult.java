package web.home.speaker;

import config.HibernateUtil;
import entity.Mcq;
import entity.Seminar;
import entity.StudentMcq;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;

/**
 *
 * @author William A Nadeeshani
 */
public class mcqResult extends HttpServlet {

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
            if (seminar != null) {
                List mcqArray = hibernateSession.createCriteria(Mcq.class).setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY).list();
                List<Mcq> eventMcq = new ArrayList<Mcq>();
                for (int i = 0; i < mcqArray.size(); i++) {
                    Mcq mcq = (Mcq) mcqArray.get(i);
                    if (mcq.getSeminar().getEventId().equals(seminar.getEventId())) {
                        eventMcq.add(mcq);
                    }
                }
                request.setAttribute("eventMcq", eventMcq);
                RequestDispatcher rd = request.getRequestDispatcher("jsp/speaker/mcqresult.jsp");
                rd.forward(request, response);
                tx.commit();
                hibernateSession.close();
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session is expired...Login Again...');");
                out.println("location='jsp/home/speakerLogin.jsp';");
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
