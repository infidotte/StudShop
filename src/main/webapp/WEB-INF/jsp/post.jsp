<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Post</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley"
               class="navbar-brand">StudShop</a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <sec:authorize access="isAuthenticated()" var="isAuth"/>
        <sec:authorize access="hasRole('ADMIN')" var="isAdmin"/>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="/">Home</a></li>
                <c:choose>
                    <c:when test="${isAuth==true}">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/post/newpost">Make
                            post</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link active" href="/login">Make post</a></li>
                    </c:otherwise>
                </c:choose>
                <c:if test="${isAdmin==true}">
                    <li class="nav-item"><a class="nav-link active" href="#">Administration</a></li>
                </c:if>
            </ul>
            <c:if test="${isAuth != true}">
                <form class="d-flex">
                    <div class="btn-group " role="group" aria-label="Basic outlined example">
                        <a href="/login" type="button" class="btn btn-info">Login</a>
                        <a href="/registration" type="button" class="btn btn-info">Sign-up</a>
                    </div>
                </form>
            </c:if>
            <c:if test="${isAuth == true}">
                <form class="d-flex">
                    <div class="btn-group " role="group" aria-label="Basic outlined example">
                        <a type="button" class="btn btn-info"
                           href="/${pageContext.request.userPrincipal.name}/profile">${pageContext.request.userPrincipal.name}</a>
                        <a type="button" class="btn btn-info" href="/logout">Logout</a>
                    </div>
                </form>
            </c:if>
        </div>
    </div>
</nav>
<br>
<div class="container card" style="width: 100rem">
    <div class="row">
        <c:forEach var="post" items="${postDetails}">
        <div class="container card" style="height: 10% ; width: 100%">
            <h3 class="card-title text-center">${post.title}</h3>
        </div>
        <div class="container card" style="width: 33%">
            <img src="/images/${post.getId()}" class="card-img-top mx-auto" style="height: 25rem; width: 25rem"><br>
        </div>
        <div class="container card" style="width: 27.5rem">
            <h4 class="card-text">Price: ${post.price}$</h4>
            <div class="container card">
                <h4 class="card-text">${post.description}</h4>
            </div>
            <br>
            <h4 class="card-text">Date of creation: ${post.dateOfCreate}</h4>
            </c:forEach>
            <c:if test="${isAdmin==true}">
                <button class="btn btn-danger" onclick="document.location.href+='/delete'" value="Delete">Delete
                </button>
            </c:if>
        </div>
        <div class="container card" style="width: 27.5rem">
            <c:forEach var="user" items="${postUser}">
                <h3>User name: ${user.name}</h3>
                <h3>User address: ${user.address}</h3>
                <h3>User phone: ${user.phone}</h3>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>