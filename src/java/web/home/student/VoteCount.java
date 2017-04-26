/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.home.student;

import config.HibernateUtil;
import entity.Question;
import entity.Seminar;
import entity.Student;
import entity.StudentVote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author William A Nadeeshani
 */
public class VoteCount extends HttpServlet {

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
            Question question = (Question) hibernateSession.get(Question.class, id);

            if (seminar != null) {
                if (student != null) {
                    Query qry=hibernateSession.createQuery(
                            "select sv.id from StudentVote sv where sv.question=:question and sv.student=:student");
                    qry.list();
                    System.out.println("+++++++++");
                    System.out.println("*********************");
//                    if (votedQuestion != null) {
//                        
//                    }else{
//                        StudentVote sv = new StudentVote();
//                        sv.setStudent(student);
//                        sv.setQuestion(question);
//                        System.out.println("*************"+question.getUpVote());
//                        question.setUpVote(question.getUpVote()+1);
//                        hibernateSession.save(sv);
//                        tx.commit();
//                        hibernateSession.close();
//                    }

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
            
            

//            int index = Integer.parseInt(qId);
//            
//            
//            
//            
//            
//
//            if (seminar != null) {
//                List<Question> questions = seminar.getQuestion();
//                ArrayList<String[]> questionArray = new ArrayList<String[]>();
//
//                for (Question q : questions) {
//                    String[] couple = new String[3];
//                    couple[0] = q.getQuestion();
//                    couple[1] = "" + q.getUpVote();
//                    couple[2] = "" + q.getQuestionId();
//                    questionArray.add(couple);
//                }
//                String[] stringArray = questionArray.get(index);
//                String id = stringArray[2];
//                long eventId = Long.parseLong(id);
//                Question q = (Question) hibernateSession.get(Question.class, eventId);
//                if (q != null) {
//                    int currentVote = q.getUpVote() + 1;
//                    q.setUpVote(currentVote);
//                    hibernateSession.saveOrUpdate(q);
//                    tx.commit();
//                    out.print(currentVote);
////                    List<Question> questions2 = seminar.getQuestion();
////                    ArrayList<String[]> questionArray2 = new ArrayList<String[]>();
//
////                    for (Question q2 : questions2) {
////                        String[] couple = new String[3];
////                        couple[0] = q2.getQuestion();
////                        couple[1] = "" + q2.getUpVote();
////                        couple[2] = "" + q2.getQuestionId();
////                        questionArray.add(couple);
////                    }
////                    request.setAttribute("questionArray", questionArray2);
////                    RequestDispatcher rd = request.getRequestDispatcher("Vote");
////                    rd.forward(request, response);
//
//                } else {
//                    out.println("<script type=\"text/javascript\">");
//                    out.println("alert('Session is expired...');");
//                    out.println("location='jsp/home/studentLogin.jsp';");
//                    out.println("</script>");
//                }
//
//            } else {
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Session is expired...');");
//                out.println("location='jsp/home/studentLogin.jsp';");
//                out.println("</script>");
//            }
//            hibernateSession.close();
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
