
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h1>Users</h1>
    <h1>${message}</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>email</th>
        </tr>
        <tr>

            <c:forEach items="${speakers}" var="user">
                <td><c:out value="${user.username}"/></td>
                <td><c:out value="${user.password}"/></td>
                <td><c:out value="${user.email}"/></td>

            </c:forEach>
        </tr>
    </table>
</html>
