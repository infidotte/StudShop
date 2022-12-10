<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
</head>
<body>
    <div>
        <form:form method="post" modelAttribute="userForm">
            <h2>Registration</h2>
            <div>
                <form:input type="text" path="username" placeholder="Username"
                autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
                ${usernameError}
            </div>
            <div>
                <form:input type="password" path="password" placeholder="Password"></form:input>
            </div>
            <div>
                <form:input type="password" path="passwordConfirm" placeholder="Confirm your password"></form:input>
                <form:errors path="password"></form:errors>
                ${passwordError}
            </div>
            <button type="submit">Sign-up</button>
        </form:form>
        <a href="/">Home</a>
    </div>
</body>
</html>