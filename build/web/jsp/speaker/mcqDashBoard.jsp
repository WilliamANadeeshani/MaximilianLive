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
            <title>MCQ</title>
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
                    <a id="logo-container" href="#" class="brand-logo">Multiple Choice Questions</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/mcqDashBoard.jsp">MCQ</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/mcqDashBoard.jsp">MCQ</a></li>
                    </ul>
                </div>
            </nav>
            <br/><br/><br/><br/>
            <div class="row">
                <div class="col s2"></div>
                <div class="col s2">
                    <div class="card">
                        <div class="card-content">
                            <div class="mdl-card__title">
                                <h5 class="mdl-card__title-text">Add </h5>
                            </div>
                            <div class="mdl-card__supporting-text">
                                Now you can add Multiple Choice Answer questions to measure your teaching and audience engagement.
                            </div><br>        
                            <div class="mdl-card__actions mdl-card--border">
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="jsp/speaker/addMcq.jsp">
                                    New MCQ
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col s2">
                    <div class="card">
                        <div class="card-content">
                            <div class="mdl-card__title">
                                <h5 class="mdl-card__title-text">Edit </h5>
                            </div>
                            <div class="mdl-card__supporting-text">
                                Now you can edit or update your already added Multiple Choice Questions in your event.
                            </div><br>        
                            <div class="mdl-card__actions mdl-card--border">
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="ViewAllMcq">
                                    Edit MCQ
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col s2">
                    <div class="card">
                        <div class="card-content">
                            <div class="mdl-card__title">
                                <h5 class="mdl-card__title-text">Start </h5>
                            </div>
                            <div class="mdl-card__supporting-text">
                                Now you can check your account Details and change your personal information.
                            </div><br>        
                            <div class="mdl-card__actions mdl-card--border">
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="jsp/speaker/accountDetails.jsp">
                                    Your Profile
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col s2">
                    <div class="card">
                        <div class="card-content">
                            <div class="mdl-card__title">
                                <h5 class="mdl-card__title-text">Result</h5>
                            </div>
                            <div class="mdl-card__supporting-text">
                                Now you can check your account Details and change your personal information.
                            </div><br>        
                            <div class="mdl-card__actions mdl-card--border">
                                <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="jsp/speaker/accountDetails.jsp">
                                    Your Profile
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col s2"></div>
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


