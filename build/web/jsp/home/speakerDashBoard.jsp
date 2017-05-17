<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="uri" value="${req.requestURI}" />
<c:set var="url">${req.requestURL}</c:set>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">

    <html lang="en-US">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>Lecturer Dash Board</title>
            <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/" />

        <meta name="description" content="Demo of Material design portfolio template by TemplateFlip.com."/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;amp;lang=en" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" rel="stylesheet">
        <link href="resources/css/main.css" rel="stylesheet">
    </head>
    <body id="top">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <header class="mdl-layout__header mdl-layout__header--waterfall site-header">
                <div class="mdl-layout__header-row site-logo-row">
                    <span class="mdl-layout__title">
                        <div class="site-logo"></div>
                        <span class="site-description">Lecturer Dash Board</span>
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
            </header>
            <div class="mdl-layout__drawer mdl-layout--small-screen-only">
                <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                    <a class="mdl-navigation__link" href="index.jsp">Home</a>
                    <a class="mdl-navigation__link" href="jsp/home/about.jsp">About</a>
                    <a class="mdl-navigation__link" href="jsp/home/speakerLogin.jsp">Lecturer Login</a>
                    <a class="mdl-navigation__link" href="jsp/home/studentLogin.jsp">Student Login</a>
                </nav>
            </div>
            <main class="mdl-layout__content">
                <div class="site-content">
                    <div class="container"><div class="mdl-grid site-max-width">
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="resources/img/speakerDashBoard/accountDetails.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Account Details</h2>
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

                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="resources/img/speakerDashBoard/eventDetails.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Event Details</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Here you can add your event information and your audience can view them.
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="EventDetailsView">
                                        Your Event
                                    </a>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="resources/img/speakerDashBoard/mcq.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">MCQ</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Add your new question to measure your students' progress. You can and Multiple Choice Questions..
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="jsp/speaker/mcqDashBoard.jsp">
                                        Your Questions
                                    </a>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="resources/img/pencil.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Student Marks</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Now you can check your students' performance for your MCQ s with overall percentage. 
                                </div><br>       
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="mcqResult">
                                        View Result
                                    </a>
                                </div>
                            </div><br>
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="resources/img/feedback.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Feedback</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Now you can see you students' feedback. It shows overall feedback with the percentage. 
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="FeedbackSpeaker">
                                        View Feedback
                                    </a>
                                </div>
                            </div><br>    
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="resources/img/qa.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Questions</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Now you can see, all the questions asked by your audience with number of votes.
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="VoteSpeaker">
                                        View Question
                                    </a>
                                </div>
                            </div><br>    

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
            <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
            <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        </div>
    </body>
</html>

