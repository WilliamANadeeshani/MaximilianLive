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
            <title>Student Login</title>
            <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="resources/css/materialize.min.css" rel="stylesheet">
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
                    <a id="logo-container" href="#" class="brand-logo">Student Login</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/home/studentLogin.jsp">Login</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/home/speakerLogin.jsp">Login</a></li>
                    </ul>
                </div>
            </nav>
            <form action="StudentLogin" method="POST">
                <div class="row">
                    <div class="col s4"></div>
                    <div class="row">
                        <div class="col s4">
                            <div class="card">
                                <div class="card-image">
                                    <img src="resources/img/register.jpg"/>
                                    <span class="card-title">Login</span>
                                </div>
                                <div class="card-content">
                                    <p>
                                    <div class="input-field row">
                                        <i class="material-icons prefix">account_circle</i>
                                        <input  path="username" id="icon_prefix" type="text" class="validate" name="studentId" required/>
                                        <label for="icon_prefix">Student Id</label>
                                    </div>

                                    <div class="input-field row">
                                        <i class="material-icons prefix">lock_outline</i>
                                        <input  path="username" id="icon_prefix" type="password" class="validate" name="password" required/>
                                        <label for="icon_prefix">Password</label>
                                    </div>
                                    </p>
                                </div>
                                <div class="card-action center-align">
                                    <button class="btn waves-effect waves-purple" type="submit" name="action" >Login
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col s4"></div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
    </body>
</html>


