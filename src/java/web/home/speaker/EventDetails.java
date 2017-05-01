/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.home.speaker;

import config.HibernateUtil;
import entity.EventInformation;
import entity.Seminar;
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

public class EventDetails extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            SessionFactory factory = new HibernateUtil().createSessionFactory();
            Session hibernateSession = factory.openSession();
            Transaction tx = hibernateSession.beginTransaction();

            String eventName = request.getParameter("eventName");
            String lecturerName = request.getParameter("lecturerName");
            String lecturerDetails = request.getParameter("lecturerDetails");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String place = request.getParameter("place");

            HttpSession httpSession = request.getSession();
            Seminar seminar = (Seminar) httpSession.getAttribute("seminar");
            //check session is expired or not
            if (seminar != null) {
                long eventId = seminar.getEventId();

                EventInformation eventInformation = (EventInformation) hibernateSession.get(EventInformation.class, eventId);
                if (eventInformation == null) {
                    eventInformation = new EventInformation();
                }
                eventInformation.setEventName(eventName);
                eventInformation.setLecturerName(lecturerName);
                eventInformation.setLecturerDetails(lecturerDetails);
                eventInformation.setDate(date);
                eventInformation.setTime(time);
                eventInformation.setPlace(place);
                eventInformation.setSeminar(seminar);

                hibernateSession.saveOrUpdate(eventInformation);
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
