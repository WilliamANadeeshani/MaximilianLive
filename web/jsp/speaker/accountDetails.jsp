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
            <title>Account</title>
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
            input[type="email"][disabled] {
                color: #004d40;
            }
        </style>

        <!--js-->
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
                    // code for IE7+, Firefox, Chrome, Opera, Safari 
                    xmlhttp = new XMLHttpRequest();
                } else {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                return xmlhttp;
            }
            function sendRequest() {
                var userName = document.getElementById('userName').value;
                var email = document.getElementById('email').value;
                var url = "AccountDetails?userName=" + userName + "&email=" + email;

                var request = createXMLHttpRequest();
                request.open("GET", url, true);
                request.send(null);
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            document.getElementById('userName').disabled = true;
                            document.getElementById('email').disabled = true;
                            document.getElementById('update').style.visibility = "hidden";
                        }
                    }
                };
            }
        </script>


    </head>
    <body class="indigo darken-1">
        <%
            Seminar seminar = (Seminar) session.getAttribute("seminar");
            if (seminar != null) {
                String userName = seminar.getUserName();
                String email = seminar.getEmail();
                String eventId = "" + seminar.getEventId();
                pageContext.setAttribute("userName", userName);
                pageContext.setAttribute("email", email);
                pageContext.setAttribute("eventId", eventId);
            }

        %>
        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">Your Profile</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/accountDetails.jsp">Account</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/accountDetails.jsp">Account</a></li>
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
                                <span class="card-title">Account Details</span>
                            </div>
                            <div class="card-content">
                                <p>
                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">vpn_key</i>
                                        <label  for="icon_prefix" class="active">Account Key</label>
                                        <input disabled  id='eventId' type='text'  class='validate' required name='eventId' value="${pageScope.eventId}" />
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">account_circle</i>
                                        <input disabled  id="userName" type="text"  class="validate" required name="userName" value="${pageScope.userName}" length="10"/>
                                        <label  for="icon_prefix" class="active" data-error="Use at most 10 characters" >User Name</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('userName').disabled = false;
                                                visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">email</i>
                                        <input disabled  id="email" type="email"  class="validate"  name="email" value="${pageScope.email}" required/>
                                        <label  for="icon_prefix" class="active" data-error="Use valid email">Email</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('email').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                </p>
                            </div>
                            <div class="card-action center-align">
                                <button id="update" onclick="sendRequest();" class="btn waves-effect waves-purple" type="submit" name="action" style="visibility: hidden">Update
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
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
    </body>
</html>


