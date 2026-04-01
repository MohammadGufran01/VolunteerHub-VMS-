<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assign Volunteers</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Icons -->
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }
        .page-title {
            font-weight: 700;
            color: #333;
        }
        .card-custom {
            background: #fff;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0px 3px 12px rgba(0,0,0,0.08);
        }
        .table thead {
            background: #0d6efd;
            color: white;
        }
        .table tbody tr:hover {
            background: #eef4ff;
        }
        .btn-assign {
            background: #0d6efd;
            color: white;
            font-weight: 600;
        }
    </style>
</head>

<body>

<div class="container py-4">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="page-title">
            <i class="fa-solid fa-users-gear"></i> Assign Volunteers to Events
        </h2>

        <a href="/admin/dashboard" class="btn btn-secondary">
            <i class="fa-solid fa-arrow-left"></i> Back
        </a>
    </div>

    <!-- Assignment Card -->
    <div class="card-custom">

        <!-- Success / Error Messages -->
        <c:if test="${not empty msg}">
            <div class="alert alert-info">${msg}</div>
        </c:if>

		<form action="/admin/assign-volunteers" method="post">


            <!-- SELECT EVENT -->
            <div class="mb-4">
                <label class="form-label fw-bold">Select Event:</label>
                <select name="eventId" class="form-select" required>
                    <option value="">-- Choose Event --</option>

                    <c:forEach var="event" items="${events}">
                        <option value="${event.id}">
                            ${event.title} ( ${event.location} - ${event.date} )
                        </option>
                    </c:forEach>

                </select>
            </div>

            <!-- Volunteers Table -->
            <div class="table-responsive mb-3">
                <table class="table table-bordered align-middle">
                    <thead class="text-center">
                    <tr>
                        <th>Select</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>City</th>
                        <th>Phone</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="v" items="${volunteers}">
                        <tr class="text-center">
                            <td>
                                <input type="checkbox" name="volunteerIds" value="${v.id}">
                            </td>
                            <td>${v.name}</td>
                            <td>${v.email}</td>
                            <td>${v.city}</td>
                            <td>${v.phone}</td>
                        </tr>
                    </c:forEach>

                    <!-- If no volunteers -->
                    <c:if test="${empty volunteers}">
                        <tr>
                            <td colspan="5" class="text-center text-muted py-3">
                                <i class="fa-solid fa-circle-exclamation"></i> No volunteers found.
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <!-- Submit Button -->
            <div class="d-grid">
                <button type="submit" class="btn btn-assign">
                    <i class="fa-solid fa-check"></i> Assign Selected Volunteers
                </button>
            </div>

        </form>

    </div>
</div>

</body>
</html>
