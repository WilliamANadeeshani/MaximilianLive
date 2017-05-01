<%@page import="entity.Mcq"%>
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
        <script>
            $(document).ready(function () {
                $('select').material_select();
            });

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
                var question = document.getElementById('question').value;
                var a = document.getElementById('a').value;
                var b = document.getElementById('b').value;
                var c = document.getElementById('c').value;
                var d = document.getElementById('d').value;
                var ans = document.getElementById('ans').value;
                var mcqId = document.getElementById('mcqId').value;
                var url = "UpdateMcq?question=" + question + "&a=" + a + "&b=" + b + "&c=" + c + "&d=" + d + "&ans=" + ans + "&mcqId=" + mcqId;
                var request = createXMLHttpRequest();
                request.open("GET", url, true);
                request.send(null);
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            document.getElementById("update").style.visibility = "hidden";
                            document.getElementById("question").disabled = true;
                            document.getElementById("a").disabled = true;
                            document.getElementById("b").disabled = true;
                            document.getElementById("c").disabled = true;
                            document.getElementById("d").disabled = true;
                            document.getElementById("ans").disabled = true;
                            alert("Successfully update your question");
                        }
                    }
                };
            }
            function visibleUpdateButton() {
                document.getElementById("update").style.visibility = "visible";
                document.getElementById("ans").disabled = false;
            }
        </script>
    </head>

    <body class="indigo darken-1">
        <%
            Mcq mcq = (Mcq) session.getAttribute("mcq");
            if (mcq != null) {
                String questionP = mcq.getQuestion();
                String aP = mcq.getAns_a();
                String bP = mcq.getAns_b();
                String cP = mcq.getAns_c();
                String dP = mcq.getAns_d();
                String idP =String.valueOf(mcq.getMcqId());
                pageContext.setAttribute("questionP", questionP);
                pageContext.setAttribute("aP", aP);
                pageContext.setAttribute("bP", bP);
                pageContext.setAttribute("cP", cP);
                pageContext.setAttribute("dP", dP);
                pageContext.setAttribute("idP", idP);
            }

        %>
        <main>
            <nav class=" indigo darken-2" role="navigation">
                <div class="nav-wrapper container">
                    <a id="logo-container" href="#" class="brand-logo">Your Questions</a>
                    <ul class="right hide-on-med-and-down">
                        <li><a href="jsp/speaker/mcqDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/mcq.jsp">MCQ</a></li>
                    </ul>
                    <ul id="nav-mobile" class="side-nav">
                        <li><a href="jsp/speaker/mcqDashBoard.jsp">Dash Board</a></li>
                        <li><a href="jsp/home/about.jsp">About</a></li>
                        <li><a href="jsp/speaker/mcq.jsp">MCQ</a></li>
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
                                <span class="card-title">MCQ</span>
                            </div>
                            <div class="card-content">
                                <p>
                                <div class="row">
                                    <div class="input-field row">
                                        <div class="col s10">
                                            <i class="material-icons prefix">language</i>
                                            <input path="password" disabled  id="question" type="text" class="validate" required name="question" value= "${pageScope.questionP}"/>
                                            <label for="icon_prefix" class="active">Question</label>
                                        </div>
                                        <div class="col s2">
                                            <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('question').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                        </div>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">question_answer</i>
                                        <input disabled path="password"  id="a" type="text" class="validate" required name="a" value="${pageScope.aP}"/>
                                        <label for="icon_prefix" class="active">Ans a:</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('a').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">question_answer</i>
                                        <input disabled path="password"  id="b" type="text" class="validate" required name="b" value="${pageScope.bP}"/>
                                        <label for="icon_prefix" class="active">Ans b:</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('b').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">question_answer</i>
                                        <input disabled path="password"  id="c" type="text" class="validate" required name="c" value="${pageScope.cP}"/>
                                        <label for="icon_prefix" class="active">Ans c:</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('c').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <div class="col s10">
                                        <i class="material-icons prefix">question_answer</i>
                                        <input disabled path="password"  id="d" type="text" class="validate" required name="d" value="${pageScope.dP}"/>
                                        <label for="icon_prefix" class="active">Ans d:</label>
                                    </div>
                                    <div class="col s2">
                                        <a class="btn-floating btn-large waves-effect waves-light waves-purple" onclick="document.getElementById('d').disabled = false; visibleUpdateButton();"><i class="material-icons">mode_edit</i></a>
                                    </div>
                                </div>

                                <div class="input-field row">
                                    <select disabled class="browser-default" name="ans_correct" id="ans">
                                        <option disabled selected >Choose your correct answer</option>
                                        <option value="a">Answer a</option>
                                        <option value="b">Answer b</option>
                                        <option value="c">Answer c</option>
                                        <option value="d">Answer d</option>
                                    </select>
                                </div>
                                <input id="mcqId" style="visibility: hidden" value="${pageScope.idP}" />
                                <div class="card-action center-align">
                                    <button id="update" onclick="sendRequest();" class="btn waves-effect waves-purple" type="submit" name="action" style="visibility: hidden">Submit
                                    </button>
                                </div>
                                </form>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script> 
</body>
</html>


