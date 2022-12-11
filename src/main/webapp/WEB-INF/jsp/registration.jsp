<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
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
            <a href="/"
               class="navbar-brand">StudShop</a>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<div class="container card text-center" style="width: 25rem;">
    <form:form class="navbar-form navbar-center" method="post" modelAttribute="userForm">
        <div class="card-body">
            <form method="POST" action="/login" class="center">
                <h2 class="h3 mb-3 fw-normal">Registration</h2>
                <div class="form-floating">
                    <form:input type="text" path="username" placeholder="Username" autofocus="true" class="form-control" id="Name"></form:input>
                    <label for="Name">Name</label>
                    <form:errors path="username"></form:errors>
                        ${usernameError}
                </div>
                <div class="form-floating">
                    <form:input type="password" path="password" placeholder="Password" class="form-control" id="Password"></form:input>
                    <label for="Password">Password</label>
                </div>
                <div class="form-floating">
                    <form:input type="password" path="passwordConfirm" placeholder="Confirm your password" class="form-control" id="Repeat Password"></form:input>
                    <label for="Repeat Password">Repeat Password</label>
                    <form:errors path="password"></form:errors>
                        ${passwordError}
                </div>
                <br>
                <div class="container">
                    <button type="submit" class="btn btn-success">Sign-up</button>
                </div>
            </form>
        </div>
    </form:form>
</div>
</body>
</html>