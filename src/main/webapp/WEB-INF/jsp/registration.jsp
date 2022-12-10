<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>

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
            <a href="/"
               class="navbar-brand">StudShop</a>
        </div>
        <br>
    </div>
</nav>
<div class="navbar-collapse collapse">
    <form class="navbar-form navbar-center">
    <form:form method="post" modelAttribute="userForm">
        <h2>Registration</h2>
        <div class="form-group">
            <ul class="list-group">
                <li class="list-group-item">
                    <form:input type="text" path="username" placeholder="Username" autofocus="true" class="form-control"></form:input>
                    <form:errors path="username"></form:errors>
                        ${usernameError}
                </li>
                <li class="list-group-item">
                    <form:input type="password" path="password" placeholder="Password" class="form-control"></form:input>
                </li>
                <li class="list-group-item">
                    <form:input type="password" path="passwordConfirm" placeholder="Confirm your password" class="form-control"></form:input>
                    <form:errors path="password"></form:errors>
                        ${passwordError}
                </li>
            </ul>
            </ul>
        </div>
        <br>
        <button type="submit" class="btn btn-success">Sign-up</button>
    </form:form>
    </form>
</div>
</body>
</html>