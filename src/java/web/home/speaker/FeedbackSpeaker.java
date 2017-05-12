package web.home.speaker;

import config.HibernateUtil;
import entity.Feedback;
import entity.Seminar;
import entity.Student;
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

/**
 *
 * @author William A Nadeeshani
 */
public class FeedbackSpeaker extends HttpServlet {

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
                List list = hibernateSession.createCriteria(Student.class).list();
                    List< String> feedback = new ArrayList<String>();
                    int[] faceCount = new int[]{0,0,0,0};
                    
                    for (Object o:list) {
                        Student s = (Student)o;
                        if (s.getSeminar().getEventId().equals( seminar.getEventId())) {
                            if (s.getFeedback() != null) {
                                feedback.add(s.getFeedback().getFeedback());
                                String ft = s.getFeedback().getFaceType();
                                if (ft.equals("1")) {
                                    faceCount[0]=faceCount[0]+1;
                                }else if(ft.equals("2")){
                                    faceCount[1]=faceCount[1]+1;
                                }else if(ft.equals("3")){
                                    faceCount[2]=faceCount[2]+1;
                                }else if(ft.equals("4")){
                                    faceCount[3]=faceCount[3]+1;
                                }else{
                                    faceCount[4]=faceCount[4]+1;
                                }
                            }
                        }
                    }
                    request.setAttribute("feedback", feedback);
                    request.setAttribute("faceCount", faceCount);
                    RequestDispatcher rd = request.getRequestDispatcher("jsp/speaker/feedback.jsp");
                    rd.forward(request, response);
                    tx.commit();
                    hibernateSession.close();
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session is expired...Login Again...');");
                out.println("location='jsp/home/speakerLogin.jsp';");
                out.println("</script>");
            }
            tx.commit();
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
