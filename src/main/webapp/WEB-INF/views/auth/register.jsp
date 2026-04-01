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

<div class="register-box">
    <h3 class="text-center mb-4">Create Account</h3>

    <!-- Success / Error Messages -->
    <c:if test="${not empty msg}">
        <div class="alert alert-info">${msg}</div>
    </c:if>

    <form action="/auth/saveUsers" method="post">

        <!-- NAME -->
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>

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

        <!-- PHONE -->
        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone" class="form-control" required>
        </div>

        <!-- CITY -->
        <div class="mb-3">
            <label class="form-label">City</label>
            <input type="text" name="city" class="form-control" required>
        </div>

        <!-- ROLE -->
        <div class="mb-3">
            <label class="form-label">Register As</label>
            <select name="role" class="form-select" required>
                <option value="">-- Select Role --</option>
                <option value="ORGANIZER">Event Organizer </option>
                <option value="VOLUNTEER">Volunteer</option>
            </select>
        </div>

        <!-- SUBMIT BUTTON -->
        <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-block">Register</button>
        </div>

        <p class="text-center mt-3">
            Already have an account? <a href="/login">Login Here</a>
        </p>

    </form>
</div>

</body>
</html>
