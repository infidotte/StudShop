<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
        <!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>StudShop</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"
               class="navbar-brand">StudShop</a>
        </div>
        <header>
            <sec:authorize access="isAuthenticated()" var="isAuth"/>
            <sec:authorize access="hasRole('ADMIN')" var="isAdmin"/>
            <div class="row">
                <div class="col-lg-10 col-md-10 col-sm-10">
                    <div class="nav navbar-nav">
                        <li><a href="/">Home</a></li>
                        <c:choose>
                            <c:when test="${isAuth==true}">
                                <li><a href="/post/newpost">Make post</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/login">Make post</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${isAdmin==true}">
                            <li><a href="/admin">Administration</a></li>
                        </c:if>
                    </div>
                </div>
                <div class="col-lg-1.5 col-md-1.5 col-sm-1.5">
                    <div class="nav navbar-nav text - left">
                        <c:if test="${isAuth != true}">
                            <table style="height: 50px;">
                                <tbody>
                                <tr>
                                    <td class="align-middle">
                                        <div class="btn-group " role="group" aria-label="Basic outlined example">
                                            <a href="/login" type="button" class="btn btn-info">Login</a>
                                            <a href="/registration" type="button" class="btn btn-info">Sign-up</a>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${isAuth == true}">
                            <table style="height: 50px;">
                                <tbody>
                                <tr>
                                    <td class="align-middle">
                                        <div class="btn-group " role="group" aria-label="Basic outlined example">
                                            <a type="button" class="btn btn-info" href="/${pageContext.request.userPrincipal.name}/profile">${pageContext.request.userPrincipal.name}</a>
                                            <a type="button" class="btn btn-info" href="/logout">Logout</a>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
            </div>
        </header>
        <br>
    </div>
</nav>
    <div>
        <c:forEach var="post" items="${posts}">
            <h3>${post.title}</h3>
            <img src="/images/${post.getId()}"><br>
            <a href="/post/${post.id}">Post info</a><br>
            <button onclick="location.href = '/post/${post.id}/delete'" value="Delete">Delete</button>

        </c:forEach>
    </div>
</body>
</html>