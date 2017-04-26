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

public class StudentRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //create session factory
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String eventCode = request.getParameter("eventCode");
            HttpSession httpSession = request.getSession();

            //Check valid event code or not
            try {
                Long key = Long.parseLong(eventCode);
                Seminar seminar = (Seminar) hibernateSession.get(Seminar.class, key);
                if (seminar != null) {
                    Student student = new Student();
                    student.setUsername(username);
                    student.setPassword(password);
                    student.setSeminar(seminar);
                    hibernateSession.saveOrUpdate(student);
                    httpSession.setAttribute("seminar", seminar);
                    httpSession.setAttribute("student", student);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Event Code ...');");
                    out.println("location='jsp/home/studentRegisteration.jsp';");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("jsp/home/studentDashBoard.jsp");
                    rd.forward(request, response);
                    
                    tx.commit();

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid Event Code ...');");
                    out.println("location='jsp/home/studentRegisteration.jsp';");
                    out.println("</script>");
                }
            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Event Code ...');");
                out.println("location='jsp/home/studentRegisteration.jsp';");
                out.println("</script>");
            }
            //update database and request forward
//            httpSession.setAttribute("seminar", seminar);
//            RequestDispatcher rd = request.getRequestDispatcher("jsp/home/speakerDashBoard.jsp");
//            rd.forward(request, response);
//            hibernateSession.close();
        } finally {
            System.out.println("********************");
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
