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
            input[type="date"][disabled] {
                color: #004d40;
            }
            input[type="time"][disabled] {
                color: #004d40;
            }
        </style>

        <script>
            function visibleUpdateButton() {
                document.getElementById("update").style.visibility = "visible";
            }

            $('#date').pickadate({
                
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 15 // Creates a dropdown of 15 years to control year
            });

            $('#time').pickatime({
                twelvehour: false, // change to 12 hour AM/PM clock from 24 hour
                donetext: 'OK',
                autoclose: false,
                vibrate: true // vibrate the device when dragging clock hand
            });
        </script>

        <!--Ajax-->
        <script type="text/javascript">
            function createXMLHttpRequest() {
                var xmlhttp;
                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                } else {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }
            function sendRequest() {

                var eventName = document.getElementById('eventName').value;
                var lecturerName = document.getElementById('lecturerName').value;
                var lecturerDetails = document.getElementById('lecturerDetails').value;
                var date = document.getElementById('date').value;
                var time = document.getElementById('time').value;
                var place = document.getElementById('place').value;
                var url = "EventDetails?eventName=" + eventName + "&lecturerName=" + lecturerName + "&lecturerDetails=" + lecturerDetails + "&date=" + date + "&time=" + time + "&place=" + place;
                var request = createXMLHttpRequest();
                request.open("GET", url, true);
                request.send(null);
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            document.getElementById('eventName').disabled = true;
                            document.getElementById('lecturerName').disabled = true;
                            document.getElementById('lecturerDetails').disabled = true;
                            document.getElementById('date').disabled = true;
                            document.getElementById('time').disabled = true;
                            document.getElementById('place').disabled = true;
                            document.getElementById('update').style.visibility = "hidden";
                            alert("Successfully added to the database...");
                        }
                    }
                };
            }
        </script>
    </head>
    <body class="indigo darken-1">
        <%
            EventInformation eventInformation = (EventInformation) session.getAttribute("eventInformation");
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
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="EventDetailsView">Event</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="EventDetailsView">Event</a></li>
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
                                        <input  disabled id="eventName" type='text'  class='validate' required name='eventName'  length="50" value="${pageScope.eventName}"/>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('eventName').disabled = false;
                                                visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">person_pin</i>
                                        <input disabled  id="lecturerName" type="text"  class="validate" required name="lecturerName" length="20" value="${pageScope.lecturerName}"/>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 20 characters">Lecturer Name</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('lecturerName').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">work</i>
                                        <input disabled  id="lecturerDetails" type="text" class="validate" required name="lecturerDetails" value="${pageScope.lecturerDetails}"/>
                                        <label  for="icon_prefix" class="active">Lecturer Details</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('lecturerDetails').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">today</i>
                                        <label  for="icon_prefix" class="active">Date</label>
                                        <input disabled  id="date" type="date" class="validate" required name="date" value="${pageScope.date}"/>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('date').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">schedule</i>
                                        <label  for="icon_prefix" class="active">Time</label>
                                        <input disabled  id="time" type="time" class="validate" required name="time" value="${pageScope.time}"/>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('time').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">location_on</i>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 50 characters">Place</label>
                                        <input  disabled id="place" type='text'  class='validate' required name='place'  length="50" value="${pageScope.place}"/>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('place').disabled = false;
                                                visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>
                                </p>
                            </div>
                            <div class="card-action center-align">
                                <button id="update" onclick="sendRequest();" class="btn waves-effect waves-purple" type="submit" name="action" style="visibility: hidden">Submit
                                </button>
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


