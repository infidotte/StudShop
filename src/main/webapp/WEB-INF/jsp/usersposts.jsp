<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
        <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>UsersPosts</title>
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
<div class="container">
    <div class="row">
        <c:forEach var="post" items="${posts}">
            <div class="col-4">
                <div class="card">
                    <img src="/images/${post.getId()}" alt="A cat" class="card-img-top img-fluid img-thumbnail" style="width: 25rem ; height: 25rem">
                    <div class="card-body">
                        <h5 class="card-title">${post.title}</h5>
                        <p class="card-text">${post.price}$</p>
                        <a class=" card-text btn btn-info" href="/post/${post.id}">Post info</a>
                        <button class="btn btn-danger" onclick="location.href = '/post/${post.id}/delete'" value="Delete">Delete</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<br>
</body>
</html>