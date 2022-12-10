<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>StudShop</title>
</head>
<body>
<div>
    <header>
        <sec:authorize access="isAuthenticated()" var="isAuth"/>
        <sec:authorize access="hasRole('ADMIN')" var="isAdmin"/>
        <ul>
            <li><a href="/">Home</a></li>
            <c:choose>
                <c:when test="${isAuth==true}">
                    <li><a href="/newpost">Make post</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/login">Make post</a></li>
                </c:otherwise>
            </c:choose>
            <c:if test="${isAdmin==true}">
                <li><a href="#">Administration</a></li>
            </c:if>
        </ul>
        <c:if test="${isAuth != true}">
            <li><a href="/login">Login</a></li>
            <li><a href="/registration">Sign-up</a></li>
        </c:if>
        <c:if test="${isAuth == true}">
            <li><a href="/${pageContext.request.userPrincipal.name}/profile">${pageContext.request.userPrincipal.name}</a></li>
            <li><a href="/logout">Logout</a></li>
        </c:if>
    </header><br>
</div>
<div>
    <c:forEach var="post" items="${postDetails}">
        <h3>${post.title}</h3>
        <img src="/images/${post.getId()}"><br>
        <h3>${post.description}</h3>
        <h3>${post.price}</h3>
        <h3>${post.dateOfCreate}</h3>
    </c:forEach>
    <c:forEach var="user" items="${postUser}">
        <h3>${user.name}</h3>
        <h3>${user.address}</h3>
        <h3>${user.phone}</h3>
    </c:forEach>
    <c:if test="${isAdmin==true}">
        <button onclick="document.location.href+='/delete'" value="Delete">Delete</button>
    </c:if>
</div>
</body>
</html>