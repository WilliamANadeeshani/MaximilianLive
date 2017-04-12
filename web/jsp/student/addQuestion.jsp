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
            <title>Question</title>
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
        </style>
    </head>
    <body class="indigo darken-1">
        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">Your Question</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/addQuestion.jsp">Question</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/studentDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/addQuestion.jsp">Question</a></li>
                    </ul>
                </div>
            </nav>
            <form action="AddQuestion" method="POST">
                <div class="row">
                    <div class="col s3"></div>
                    <div class="row">
                        <div class="col s6">
                            <div class="card">
                                <div class="card-image">
                                    <img src="resources/img/register.jpg"/>
                                    <span class="card-title">Question</span>
                                </div>
                                <div class="card-content">
                                    <p>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">input</i>
                                            <textarea id="textarea1" class="materialize-textarea" name="quiz"></textarea>
                                            <label for="textarea1">Question</label>
                                        </div>
                                    </div>
                                    <div class="card-action center-align">
                                        <button class="btn waves-effect waves-purple" type="submit" name="action">Submit
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col s3"></div>
                    </div>
                </div>
            </form>
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


