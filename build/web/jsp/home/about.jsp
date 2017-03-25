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
                                        <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.</p>
                                        <p>Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.</p>
                                    </div>


                                    <h3 class="mdl-cell mdl-cell--12-col mdl-typography--headline">Mission</h3>
                                    <div class="mdl-cell mdl-cell--8-col mdl-card__supporting-text no-padding ">
                                        <p>
                                            Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.
                                        </p>
                                    </div>


                                    <h3 class="mdl-cell mdl-cell--12-col mdl-typography--headline">Team</h3>

                                    <div class="mdl-grid">
                                        <div class="mdl-cell mdl-cell--4-col">
                                            <div class="demo-card-image mdl-card mdl-shadow--2dp person1">
                                                <div class="mdl-card__title mdl-card--expand"></div>
                                                <div class="mdl-card__actions">
                                                    <span class="demo-card-image__filename">John Doe</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="mdl-cell mdl-cell--4-col">
                                            <div class="demo-card-image mdl-card mdl-shadow--2dp person2">
                                                <div class="mdl-card__title mdl-card--expand"></div>
                                                <div class="mdl-card__actions">
                                                    <span class="demo-card-image__filename">Gary Doe</span>
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


