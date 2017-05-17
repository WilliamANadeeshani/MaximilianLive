<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        </style>
    </head>
    <body class="indigo darken-1">
        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">Feedback</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/student/feedback.jsp">Feedback</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/home/speakerDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/student/feedback.jsp">Feedback</a></li>
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
                                <span class="card-title">Feedback</span>
                            </div>
                            <div class="card-content">
                                <p>
                                <div class="row">
                                    <div class="col s2">
                                        <label><img src="resources/img/faces/01.jpg" class="circle responsive-img" /></label>
                                        <input type="button" value="${seminar.getFace1()}">
                                    </div>
                                    <div class="col s2">
                                        <label><img src="resources/img/faces/02.jpg" class="circle responsive-img" /></label>
                                        <input type="button" value="${seminar.getFace2()}">
                                    </div> 
                                    <div class="col s2">
                                        <label><img src="resources/img/faces/03.jpg" class="circle responsive-img" /></label>
                                        <input type="button" value="${seminar.getFace3()}">
                                    </div> 
                                    <div class="col s2">
                                        <label><img src="resources/img/faces/04.jpg" class="circle responsive-img" /></label>
                                        <input type="button" value="${seminar.getFace4()}">
                                    </div> 
                                    <div class="col s2">
                                        <label><img src="resources/img/faces/05.jpg" class="circle responsive-img" /></label>
                                        <input type="button" value="${seminar.getFace5()}">
                                    </div>
                                    <div class="col s2">
                                        <label>Total:</label>
                                        <input type="button" value="${seminar.getFace1()+seminar.getFace2()+seminar.getFace3()+seminar.getFace4()+seminar.getFace5()}">
                                    </div>
                                </div>
                                <br><br>
                                <h5>Feedbacks:</h5>
                                <table>
                                    <tbody>
                                        <c:forEach items="${stringFeedbacks}" var="string">
                                            <tr>
                                                <td><c:out value="${string.getFeedback()}" /><td>
                                            </tr>
                                        </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col s3"></div>
                </div>
            </div>
            <!--</form>-->
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


