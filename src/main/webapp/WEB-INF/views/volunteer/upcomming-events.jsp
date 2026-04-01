<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upcoming Events</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }
        .event-card {
            background: #fff;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0px 3px 12px rgba(0,0,0,0.08);
            margin-bottom: 20px;
        }
        .event-title {
            font-size: 22px;
            font-weight: 700;
            color: #0d6efd;
        }
        .event-info {
            font-size: 15px;
            color: #555;
        }
        .no-events {
            text-align: center;
            padding: 40px;
            color: #777;
        }
    </style>
</head>

<body>

<div class="container py-4">
    <h2 class="mb-4">
        <i class="fa-solid fa-calendar-days"></i> Upcoming Events
    </h2>

    <!-- No Events -->
    <c:if test="${empty upcomming}">
        <div class="no-events">
            <h4>No upcoming events.</h4>
            <p>Please check later.</p>
        </div>
    </c:if>

    <!-- Event Cards -->
    <c:forEach var="e" items="${upcomming}">
        <div class="event-card">
            <h3 class="event-title">${e.title}</h3>
            <p class="event-info"><b>Date:</b> ${e.date}</p>
            <p class="event-info"><b>Location:</b> ${e.location}</p>
            <p class="event-info"><b>Description:</b> ${e.description}</p>
        </div>
    </c:forEach>

</div>

</body>
</html>
