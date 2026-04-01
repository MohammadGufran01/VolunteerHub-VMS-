<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background: #f5f7fa;
            font-family: "Poppins", sans-serif;
        }

        .page-title {
            font-weight: 600;
            text-align: center;
            margin-top: 30px;
            margin-bottom: 30px;
            color: #1a202c;
        }

        .card-custom {
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.2s ease;
            height: 100%;
        }

        .card-custom:hover {
            transform: translateY(-4px);
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.15);
        }

        .icon-large {
            font-size: 45px;
            color: #0077b6;
            margin-bottom: 15px;
        }

        .btn-dashboard {
            background: #1a202c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 15px;
            margin-top: 10px;
        }

        .btn-dashboard:hover {
            background: #2d3748;
        }
    </style>

</head>
<body>

<h2 class="page-title">Admin Dashboard</h2>

<div class="container">
    <div class="row g-4">

        <!-- Create Event -->
        <div class="col-md-4">
            <div class="card-custom">
                <i class="fa-solid fa-calendar-plus icon-large"></i>
                <h5>Create New Event</h5>
                <p>Add new events for volunteers.</p>
                <a href="/admin/eventForm" class="btn-dashboard">Open</a>
            </div>
        </div>


        <!-- Manage / Assign Volunteers -->
        <div class="col-md-4">
            <div class="card-custom">
                <i class="fa-solid fa-users-gear icon-large"></i>
                <h5>Assign Volunteers</h5>
                <p>Assign volunteers to events.</p>
                <a href="/admin/events/assign" class="btn-dashboard">Open</a>
            </div>
        </div>

        <!-- View All Events -->
        <div class="col-md-4">
            <div class="card-custom">
                <i class="fa-solid fa-list-check icon-large"></i>
                <h5>All Events</h5>
                <p>View all events & registered volunteers.</p>
                <a href="/admin/allEvents" class="btn-dashboard">Open</a>
            </div>
        </div>

        <!-- Reports -->
        <div class="col-md-4">
            <div class="card-custom">
                <i class="fa-solid fa-chart-line icon-large"></i>
                <h5>Reports & Analytics</h5>
                <p>View event and volunteer statistics.</p>
                <a href="/admin/reports" class="btn-dashboard">Open</a>
            </div>
        </div>

    </div>
</div>

</body>
</html>
