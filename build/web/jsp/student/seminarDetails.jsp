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
            EventInformation eventInformation = (EventInformation) request.getAttribute("eventInformation");
            if (eventInformation != null) {
                String eventName = eventInformation.getEventName();
                String lecturerName = eventInformation.getLecturerName();
                String lecturerDetails = eventInformation.getLecturerDetails();
                String date = eventInformation.getDate();
                String time = eventInformation.getTime();
                String place = eventInformation.getPlace();
                pageContext.setAttribute("eventName", eventName);
                pageContext.setAttribute("lecturerName", lecturerName);
                pageContext.setAttribute("lecturerDetails", lecturerDetails);
                pageContext.setAttribute("date", date);
                pageContext.setAttribute("time", time);
                pageContext.setAttribute("place", place);
            }

        %>
        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">Your Event</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="SeminarDetails">Event</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="SeminarDetails">Event</a></li>
                    </ul>
                </div>
            </nav>

            <div class="row">
                <div class="col s3"></div>
                <div class="row">
                    <div class="col s6">
                        <div class="card">
                            <div class="card-image">
                                <img src="resources/img/speakerDashBoard/eventDetailsUpdate.jpg"/>
                                <span class="card-title">Event Details</span>
                            </div>
                            <div class="card-content">
                                <p>
                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">picture_in_picture</i>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 50 characters">Event Name</label>
                                        <input  disabled id="eventName" type='text' name='eventName' value="${pageScope.eventName}"/>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">person_pin</i>
                                        <input disabled  id="lecturerName" type="text" name="lecturerName" value="${pageScope.lecturerName}"/>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 20 characters">Lecturer Name</label>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">work</i>
                                        <input disabled  id="lecturerDetails" type="text" name="lecturerDetails" value="${pageScope.lecturerDetails}"/>
                                        <label  for="icon_prefix" class="active">Lecturer Details</label>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">today</i>
                                        <label  for="icon_prefix" class="active">Date</label>
                                        <input disabled  id="date" type="date" name="date" value="${pageScope.date}"/>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">schedule</i>
                                        <label  for="icon_prefix" class="active">Time</label>
                                        <input disabled  id="time" type="time" name="time" value="${pageScope.time}"/>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">location_on</i>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 50 characters" >Place</label>
                                        <input  disabled id="place" type='text' required name='place' value="${pageScope.place}"/>
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


