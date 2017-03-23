<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Maximilian Live System</title>

        <meta name="description" content="Demo of Material design portfolio template by TemplateFlip.com."/>
        <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;amp;lang=en" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" rel="stylesheet">
        <spring:url value="/resources/core/css/main.css" var="coreCss"/>
        <spring:url value="/resources/core/img" var="img" />
        <link href="${coreCss}" rel="stylesheet">
        <link href="${coreImg}" rel="stylesheet">
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
                        <a class="mdl-navigation__link" href="#">Home</a>
                        <a class="mdl-navigation__link" href="home/about">About</a>
                        <a class="mdl-navigation__link" href="#">Lecturer Login</a>
                        <a class="mdl-navigation__link" href="#">Student Login</a>

                    </nav>
                </div>
            </header>
            <div class="mdl-layout__drawer mdl-layout--small-screen-only">
                <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                    <a class="mdl-navigation__link" href="home/home">Home</a>
                    <a class="mdl-navigation__link" href="#">About</a>
                    <a class="mdl-navigation__link" href="#">Lecturer Login</a>
                    <a class="mdl-navigation__link" href="#">Student Login</a>
                </nav>
            </div>
            <main class="mdl-layout__content">
                <div class="site-content">
                    <div class="container"><div class="mdl-grid site-max-width">
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="img/portfolio1.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Lecture Details</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Now you can check your lecture Details.
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="portfolio-page.html">
                                        Learn More
                                    </a>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="img/portfolio2.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Add Feedback</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Here you can add your lecture information.
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="portfolio-page.html">
                                        Learn More
                                    </a>
                                </div>
                            </div>
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="img/portfolio3.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Add New Question</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Add your new question to measure your students' progress.
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="portfolio-page.html">
                                        Learn More
                                    </a>
                                </div>
                            </div><br>
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="img/portfolio4.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">View asked Question</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Now you can see you students' feedback.
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="portfolio-page.html">
                                        Learn More
                                    </a>
                                </div>
                            </div><br>    
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="img/portfolio5.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">Give Answers to Lecture's Q</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Try to give answers.
                                </div><br>        
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="portfolio-page.html">
                                        Learn More
                                    </a>
                                </div>
                            </div><br>    
                            <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                                <div class="mdl-card__media">
                                    <img class="article-image" src="img/portfolio6.jpg" border="0" alt="">
                                </div>
                                <div class="mdl-card__title">
                                    <h2 class="mdl-card__title-text">View Feedback</h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    Check students' performance
                                </div><br>       
                                <div class="mdl-card__actions mdl-card--border">
                                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="portfolio-page.html">
                                        Learn More
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

