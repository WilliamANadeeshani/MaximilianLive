/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.home.student;

import config.HibernateUtil;
import entity.Feedback;
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

/**
 *
 * @author William A Nadeeshani
 */
public class AddFeedback extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();

            String feedbackString = request.getParameter("feedback");
            String face = request.getParameter("face");
            HttpSession httpSession = request.getSession();
            Seminar seminar = (Seminar) httpSession.getAttribute("seminar");
            Student student = (Student) httpSession.getAttribute("student");

            //check session is expired or not
            if (seminar != null && student != null) {
                Feedback feedback = student.getFeedback();
                if (feedback == null) {
                    feedback = new Feedback();
                } else {
                    String faceAdded = feedback.getFaceType();
                    if (faceAdded.equals("1")) {
                        seminar.setFace1(seminar.getFace1()- 1);
                    } else if (faceAdded.equals("2")) {
                        seminar.setFace2(seminar.getFace2()- 1);
                    } else if (faceAdded.equals("3")) {
                        seminar.setFace3(seminar.getFace3()- 1);
                    } else if (faceAdded.equals("4")) {
                        seminar.setFace4(seminar.getFace4()- 1);
                    } else if (faceAdded.equals("5")) {
                        seminar.setFace5(seminar.getFace5()- 1);
                    } 
                }
                if (face.equals("1")) {
                    seminar.setFace1(seminar.getFace1()+ 1);
                } else if (face.equals("2")) {
                    seminar.setFace2(seminar.getFace2()+ 1);
                } else if (face.equals("3")) {
                    seminar.setFace3(seminar.getFace3()+ 1);
                } else if (face.equals("4")) {
                    seminar.setFace4(seminar.getFace4()+ 1);
                } else if (face.equals("5")) {
                    seminar.setFace5(seminar.getFace5()+ 1);
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Add Your Face Feedback...');");
                    out.println("location='jsp/home/studentLogin.jsp';");
                    out.println("</script>");
                }
                feedback.setFeedback(feedbackString);
                feedback.setFaceType(face);
                feedback.setStudent(student);
                student.setFeedback(feedback);
                hibernateSession.saveOrUpdate(feedback);
                hibernateSession.saveOrUpdate(student);
                hibernateSession.saveOrUpdate(seminar);

                tx.commit();
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
