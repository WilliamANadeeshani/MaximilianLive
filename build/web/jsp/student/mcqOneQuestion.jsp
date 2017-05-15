<%@page import="entity.Mcq"%>
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
            String f = "fsdfds";
            Mcq mcq = (Mcq) session.getAttribute("mcq");
            if (mcq != null) {
                String question = mcq.getQuestion();
                String a = mcq.getAns_a();
                String b = mcq.getAns_b();
                String c = mcq.getAns_c();
                String d = mcq.getAns_d();
                String correct = mcq.getAns_correct();
                pageContext.setAttribute("question", question);
                pageContext.setAttribute("a", a);
                pageContext.setAttribute("b", b);
                pageContext.setAttribute("c", c);
                pageContext.setAttribute("d", d);
                pageContext.setAttribute("f", f);
                pageContext.setAttribute("correct", correct);
            }

        %>

        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">MCQ</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="ViewMcq">MCQ</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="ViewMcq">MCQ</a></li>
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
                                <span class="card-title">MCQ</span>
                            </div>
                            <div class="card-content">
                                <p>
                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">work</i>
                                        <input disabled  id="feedback" type="text"  class="validate" required name="feedback" value="${pageScope.question}"/>
                                        <label   for="icon_prefix" class="active" data-error="Use at most 50 characters">Question</label>
                                    </div>

                                </div>
                                <div id="face">
                                    <div class="input-field row">
                                        <br>
                                        <div class="col s10">
                                            <p>
                                                <input name="group1" type="radio" id="a" name='face' value="a" disabled="disabled"/>
                                                <label for="a" >${f}</label>
                                            </p>
                                        </div>
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


