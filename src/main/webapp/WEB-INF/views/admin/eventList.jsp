<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Event List</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }
        .page-title {
            font-weight: 700;
            color: #333;
        }
        .table thead {
            background: #0d6efd;
            color: #fff;
        }
        .table tbody tr:hover {
            background: #eef4ff;
        }
        .action-btn {
            border-radius: 6px;
            padding: 6px 12px;
        }
        .card-custom {
            border-radius: 16px;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0px 3px 12px rgba(0,0,0,0.08);
        }
    </style>
</head>

<body>

<div class="container py-4">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="page-title"><i class="fa-solid fa-list"></i> Event List</h2>
        <a href="/admin/eventForm" class="btn btn-primary">
            <i class="fa-solid fa-plus"></i> Add Event
        </a>
    </div>

    <div class="card-custom">

        <!-- Table -->
        <div class="table-responsive">
            <table class="table table-bordered align-middle">
                <thead class="text-center">
                    <tr>
                        <th>ID</th>
                        <th>Event Name</th>
                        <th>Date</th>
                        <th>Location</th>
                        <th>Required Volunteers</th>
                        <th>Created By</th>
                        <th width="180px">Actions</th>
                    </tr>
                </thead>

                <tbody>
                <!-- Loop dynamic events -->
                <c:forEach var="event" items="${events}">
                    <tr class="text-center">
                        <td>${event.id}</td>
                        <td>${event.title}</td>
                        <td>${event.date}</td>
                        <td>${event.location}</td>
                        <td>
                            <span class="badge bg-success">${event.requiredVolunteers}</span>
                        </td>
                        <td>${event.user.id}</td>

                        <td>
                            <a href="/admin/agreeDisagreeCount/${event.id}" 
                               class="btn btn-info btn-sm action-btn">
                                <i class="fa-solid fa-eye"></i>
                            </a>

                            <a href="/admin/events/edit/${event.id}" 
                               class="btn btn-warning btn-sm action-btn">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </a>

                            <a href="/admin/events/delete/${event.id}" 
                               class="btn btn-danger btn-sm action-btn"
                               onclick="return confirm('Are you sure you want to delete this event?')">
                                <i class="fa-solid fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                <!-- If no events -->
                <c:if test="${empty events}">
                    <tr>
                        <td colspan="7" class="text-center text-muted py-3">
                            <i class="fa-solid fa-circle-exclamation"></i> No events found.
                        </td>
                    </tr>
                </c:if>

                </tbody>
            </table>
        </div>

    </div>
</div>

</body>
</html>
