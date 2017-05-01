<%@page import="entity.Feedback"%>
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
            <title>Feedback</title>
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
                var face = 0;
                var feedback = document.getElementById('feedback').value;
                if (document.getElementById('1').checked) {
                    face = document.getElementById('1').value;
                }
                if (document.getElementById('2').checked) {
                    face = document.getElementById('2').value;
                }
                if (document.getElementById('3').checked) {
                    face = document.getElementById('3').value;
                }
                if (document.getElementById('4').checked) {
                    face = document.getElementById('4').value;
                }
                if (document.getElementById('5').checked) {
                    face = document.getElementById('5').value;
                }
                var url = "AddFeedback?feedback=" + feedback + "&face=" + face;
                var request = createXMLHttpRequest();
                request.open("GET", url, true);
                request.send(null);
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            document.getElementById('feedback').disabled = true;
                            document.getElementById('update').style.visibility = "hidden";
                            document.getElementById("1").disabled = true;
                            document.getElementById("2").disabled = true;
                            document.getElementById("3").disabled = true;
                            document.getElementById("4").disabled = true;
                            document.getElementById("5").disabled = true;
                            alert("Successfully added your feedback")
                        }
                    }
                };
            }
            function visibleUpdateButton() {
                document.getElementById("update").style.visibility = "visible";
                document.getElementById("1").disabled = false;
                document.getElementById("2").disabled = false;
                document.getElementById("3").disabled = false;
                document.getElementById("4").disabled = false;
                document.getElementById("5").disabled = false;
            }
        </script>
    </head>
    <body class="indigo darken-1">
        <%
            Feedback feedback = (Feedback) session.getAttribute("feedback");
            if (feedback != null) {
                String feedBackString = feedback.getFeedback();
                String face = feedback.getFaceType();
                pageContext.setAttribute("feedback", feedBackString);
                pageContext.setAttribute("face", face);
            }

        %>
        
        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">Your Feedback</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="ViewFeedback">Feedback</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="ViewFeedback">Feedback</a></li>
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
                                <span class="card-title">Feedback</span>
                            </div>
                            <div class="card-content">
                                <p>
                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">work</i>
                                        <input disabled  id="feedback" type="text"  class="validate" required name="feedback" value="${pageScope.feedback}"/>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 50 characters">Feedback</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('feedback').disabled = false;
                                                visibleUpdateButton();
                                                visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <br>
                                    <div class="col s1"></div>
                                    <div id="face">
                                        <div class="col s2">
                                            <p>
                                                <input name="group1" type="radio" id="1" name='face' value="1" disabled="disabled"/>
                                                <label for="1"><img src="resources/img/faces/01.jpg" class="circle responsive-img" /></label>
                                            </p>
                                        </div>
                                        <div class="col s2">
                                            <p>
                                                <input name="group1" type="radio" id="2" name='face' value="2" disabled="disabled"/>
                                                <label for="2"><img src="resources/img/faces/02.jpg" class="circle responsive-img" /></label>
                                            </p>
                                        </div>
                                        <div class="col s2">
                                            <p>
                                                <input name="group1" type="radio" id="3" name='face' value="3" disabled="disabled"/>
                                                <label for="3"><img src="resources/img/faces/03.jpg" class="circle responsive-img" /></label>
                                            </p>
                                        </div>
                                        <div class="col s2">
                                            <p>
                                                <input name="group1" type="radio" id="4" name='face' value="4" disabled="disabled"/>
                                                <label for="4"><img src="resources/img/faces/04.jpg" class="circle responsive-img" /></label>
                                            </p>
                                        </div>
                                        <div class="col s2">
                                            <p>
                                                <input name="group1" type="radio" id="5" name='face' value="5" disabled="disabled"/>
                                                <label for="5"><img src="resources/img/faces/05.jpg" class="circle responsive-img" /></label>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-action center-align">
                                    <button id="update" onclick="sendRequest();" class="btn waves-effect waves-purple" type="submit" name="action" style="visibility: hidden">Submit
                                    </button>
                                </div>
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


