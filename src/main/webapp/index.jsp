<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="./css/index.css" rel="stylesheet" type="text/css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="icon" type="image/x-icon" href="./images/icon.ico"/>
</head>
<body class="text-center bg-dark">
<main class="form-signin w-100 m-auto">
    <form action="login" method="post">
        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="Jean King" name="username">
            <label for="floatingInput">User name</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
            <label for="floatingPassword">Password</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
    </form>

    <c:if test="${notLogin != null}">
        <div class="alert alert-danger mt-2" role="alert">
            <p>Please login first !!</p>
        </div>
    </c:if>

    <c:if test="${invalidPassword != null}">
        <div class="alert alert-danger mt-2" role="alert">
            <p>Your password is invalid.</p>
        </div>
    </c:if>

    <c:if test="${invalidUsername != null}">
        <div class="alert alert-danger mt-2" role="alert">
            <p>Your username is not found.</p>
        </div>
    </c:if>

    <c:if test="${emptyInput != null}">
        <div class="alert alert-danger mt-2" role="alert">
            <p>Your username or password field can't be empty.</p>
        </div>
    </c:if>
</main>
</body>
</html>
