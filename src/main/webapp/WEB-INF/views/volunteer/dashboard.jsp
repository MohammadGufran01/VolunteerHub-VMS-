<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Volunteer Dashboard</title>

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
        .dashboard-title {
            font-size: 28px;
            font-weight: 700;
            color: #2c3e50;
        }
		.main{
			display: flex;
			justify-content: center;
		}
        .card-custom {
            background: #fff;
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0px 3px 12px rgba(0,0,0,0.08);
            transition: 0.2s ease-in-out;
        }
        .card-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0px 6px 18px rgba(0,0,0,0.12);
        }
        .icon-large {
            font-size: 38px;
            color: #ccc;
            margin-bottom: 15px;
        }
        .section-title {
            font-weight: 600;
            color: #34495e;
        }
        .btn-view {
			background-color: #2563EB;
			color: white;
        }
    </style>

</head>
<body>

<div class="container py-4">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="dashboard-title"><i class="fa-solid fa-handshake-angle"></i> Volunteer Dashboard</h2>

        <a href="/logout" class="btn btn-danger">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

    <div class="row g-4 main">

        <!-- Upcoming Events -->
        <div class="col-md-4">
            <div class="card-custom text-center">
                <i class="fa-solid fa-calendar-days icon-large"></i>
                <h5 class="section-title">Upcoming Events</h5>
                <p>View all upcoming events and details.</p>
                <a href="/volunteer/upcomming" class="btn btn-view w-100">View Events</a>
            </div>
        </div>

        <!-- Invitations -->
        <div class="col-md-4">
            <div class="card-custom text-center">
                <i class="fa-solid fa-envelope-circle-check icon-large"></i>
                <h5 class="section-title">Invitations</h5>
                <p>Respond to event invitations sent by admins.</p>
                <a href="/volunteer/invitations" class="btn btn-view w-100">View Invitations</a>
            </div>
        </div>

        <!-- Profile -->
        <div class="col-md-4">
            <div class="card-custom text-center">
                <i class="fa-solid fa-user icon-large"></i>
                <h5 class="section-title">My Profile</h5>
                <p>Update your personal information.</p>
                <a href="/volunteer/profile" class="btn btn-view w-100">Edit Profile</a>
            </div>
        </div>
		
		<!-- accepted invitation -->
		<div class="col-md-4">
		    <div class="card-custom text-center">
		        <i class="fa-solid fa-user icon-large"></i>
		        <h5 class="section-title">Accepted Invitation</h5>
		        <p>See your accepted Invitation and Also Mark Attendence</p>
		        <a href="/volunteer/acceptedInvitation" class="btn btn-view w-100">See Here</a>
		    </div>
		</div>

        <!-- History -->
        <div class="col-md-4">
            <div class="card-custom text-center">
                <i class="fa-solid fa-clock-rotate-left icon-large"></i>
                <h5 class="section-title">Attendencey</h5>
                <p>Mark Your Attendence Here.</p>
                <a href="/volunteer/myAttendance" class="btn btn-view w-100">Click here</a>
            </div>
        </div>

    </div>
</div>

</body>
</html>
