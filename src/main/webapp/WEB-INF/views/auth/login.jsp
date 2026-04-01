<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Volunteer Management - Registration</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background: #f4f6f9;
        }
        .register-box {
            margin: 60px auto;
            width: 450px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #c0c0c0;
        }
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/pop-up.jsp" />

<div class="register-box">
    <h3 class="text-center mb-4">Login Account</h3>
    <form action="/auth/loginUsers" method="post">

        <!-- EMAIL -->
        <div class="mb-3">
            <label class="form-label">Email (Username)</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <!-- PASSWORD -->
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>

        <!-- SUBMIT BUTTON -->
        <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-block">login</button>
        </div>

        <p class="text-center mt-3">
            Already have an account? <a href="/register">Register Here</a>
        </p>

    </form>
</div>

</body>
</html>
