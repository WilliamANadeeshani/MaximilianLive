<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${req.requestURL}</c:set>
    <!DOCTYPE html>
    <html lang="en-US">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>About</title>
            <meta name="description" content="Your about page description"/>
            <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;amp;lang=en" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" rel="stylesheet">
        <link href="resources/css/main.css" rel="stylesheet"/>
    </head>
    <body id="top">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <header class="mdl-layout__header mdl-layout__header--waterfall site-header">
                <div class="mdl-layout__header-row site-logo-row">
                    <span class="mdl-layout__title">
                        <div class="site-logo"></div>
                        <span class="site-description">Maximilian Live System</span>
                    </span>
                </div>
                <div class="mdl-layout__header-row site-navigation-row mdl-layout--large-screen-only">
                    <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                        <a class="mdl-navigation__link" href="index.jsp">Home</a>
                        <a class="mdl-navigation__link" href="jsp/home/about.jsp">About</a>
                        <a class="mdl-navigation__link" href="jsp/home/speakerLogin.jsp">Lecturer Login</a>
                        <a class="mdl-navigation__link" href="jsp/home/studentLogin.jsp">Student Login</a>

                    </nav>
                </div>

                <div class="mdl-layout__drawer mdl-layout--small-screen-only">
                    <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                        <a class="mdl-navigation__link" href="index.jsp">Home</a>
                        <a class="mdl-navigation__link" href="jsp/home/about.jsp">About</a>
                        <a class="mdl-navigation__link" href="jsp/home/speakerLogin.jsp">Lecturer Login</a>
                        <a class="mdl-navigation__link" href="jsp/home/studentLogin.jsp">Student Login</a>
                    </nav>
                </div>
            </header>
            <main class="mdl-layout__content">
                <div class="site-content">
                    <div class="mdl-grid site-max-width">
                        <div class="mdl-cell mdl-cell--12-col mdl-card mdl-shadow--4dp page-content">
                            <div class="mdl-card__title">
                                <h1 class="mdl-card__title-text">About</h1>
                            </div>
                            <div class="mdl-card__media"><img class="article-image" src="resources/img/about.jpg" border="0" alt="About">
                            </div>
                            <div class="mdl-grid site-copy">
                                <div class="mdl-cell mdl-cell--12-col"><h3 class="mdl-cell mdl-cell--12-col mdl-typography--headline">Introduction</h3>
                                    <div class="mdl-cell mdl-cell--8-col mdl-card__supporting-text no-padding ">
                                        <p>This is an audience engage and interactive system, which provides interactive platform among speaker and any number of audience members. This system provides Q & A Platform, feedback interface, etc. and also this system helps to handle large number of audience by providing up vote system to the questions and entire details of a seminar. This project is mainly benefit for shy genius among the audience. Now no longer restricted by microphone and Everyone can now speak up using this system.</p>
                                        <p></p>
                                    </div>


                                    <h3 class="mdl-cell mdl-cell--12-col mdl-typography--headline">Guideline</h3>
                                    <div class="mdl-cell mdl-cell--8-col mdl-card__supporting-text no-padding ">
                                        <p>
                                          You just want to register with our system. Then we give event code and user name. Then your audience feel free to use our all functions while using your login details. 
                                        </p>
                                    </div>


                                    <h3 class="mdl-cell mdl-cell--12-col mdl-typography--headline"></h3>

                                    <div class="mdl-grid">
                                        <div class="mdl-cell mdl-cell--4-col">
                                            <div class="demo-card-image mdl-card mdl-shadow--2dp person1">
                                                <div class="mdl-card__title mdl-card--expand"></div>
                                                <div class="mdl-card__actions">
                                                    <span class="demo-card-image__filename">William A Nadeeshani</span>
                                                </div>
                                            </div>
                                        </div>

                                        
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="mdl-mini-footer">
                    <div class="footer-container">
                        <div class="mdl-logo">&copy; WIlliam A Nadeeshani 2017</div>
                        <ul class="mdl-mini-footer__link-list">
                            <li><a href="#">Privacy & Terms</a></li>
                        </ul>
                    </div>
                </footer>
            </main>
            <script src="https://code.getmdl.io/1.3.0/material.min.js" defer></script>
        </div>
    </body>
</html>


