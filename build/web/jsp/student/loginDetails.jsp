<%@page import="entity.Student"%>
<%@page import="entity.EventInformation"%>
<%@page import="entity.Seminar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${req.requestURL}</c:set>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
            <title>Event</title>
            <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.1/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            body {
                display: flex;
                min-height: 100vh;
                flex-direction: column;
            }
            main {
                flex: 1 0 auto;
            }
            input[type="text"][disabled] {
                color: #004d40;
            }
            input[type="time"][disabled] {
                color: #004d40;
            }
            input[type="date"][disabled] {
                color: #004d40;
            }
        </style>
    </head>
    <body class="indigo darken-1">
        <%
            Seminar seminar = (Seminar) request.getAttribute("seminar");
            Student student = (Student) request.getAttribute("student");
            if (seminar != null) {
                String userName = seminar.getUserName();
                Long eventCode = seminar.getEventId();

                pageContext.setAttribute("userName", userName);
                pageContext.setAttribute("eventCode", eventCode);
            }
            if (student != null) {
                Long studentId = student.getStudentId();
                String studentName = student.getUsername();
                pageContext.setAttribute("studentId", studentId);
                pageContext.setAttribute("studentName", studentName);

            }

        %>
        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">Your Event</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="LoginDetails">Event</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="LoginDetails">Event</a></li>
                    </ul>
                </div>
            </nav>

            <div class="row">
                <div class="col s3"></div>
                <div class="row">
                    <div class="col s6">
                        <div class="card">
                            <div class="card-image">
                                <img src="resources/img/register.jpg"/>
                                <span class="card-title">Login Details</span>
                            </div>
                            <div class="card-content">
                                <p>
                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">picture_in_picture</i>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 50 characters">Event Name</label>
                                        <input  disabled id="eventName" type='text' name='userName' value="${pageScope.userName}"/>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">vpn_key</i>
                                        <input disabled  id="lecturerName" type="text" name="lecturerName" value="${pageScope.eventCode}"/>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 20 characters">Event Code</label>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">picture_in_picture</i>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 50 characters">User Name</label>
                                        <input  disabled id="eventName" type='text' name='userName' value="${pageScope.studentName}"/>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">account_circle</i>
                                        <input disabled  id="lecturerName" type="text" name="lecturerName" value="${pageScope.studentId}"/>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 20 characters">Student ID</label>
                                    </div>
                                </div>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col s3"></div>
            </div>
        </main>
        <footer class="page-footer  grey darken-3">
            <div class="footer-copyright">
                <div class="container">
                    <div class="mdl-logo" >&copy; WIlliam A Nadeeshani 2017</div>
                </div>
            </div>
        </footer>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>           
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
    </body>
</html>


