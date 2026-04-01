<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Volunteer Management – Home</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg-light: #F5F7FA;
            --primary: #3B82F6;
            --text-dark: #111827;
            --text-grey: #6B7280;
        }

        body {
            background: var(--bg-light);
            font-family: 'Inter', sans-serif;
        }

        /* NAVBAR */
        .navbar {
            background: white;
            padding: 15px 0;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 500;
        }

        .nav-link:hover {
            color: var(--primary) !important;
        }

        .hero {
            padding: 90px 20px;
            text-align: center;
        }

        .hero h1 {
            font-size: 45px;
            font-weight: 700;
            color: var(--text-dark);
        }

        .hero p {
            color: var(--text-grey);
            font-size: 18px;
            margin: 15px 0 25px;
        }

        .btn-main {
            background: var(--primary);
            color: white;
            padding: 12px 32px;
            border-radius: 8px;
            font-size: 17px;
            font-weight: 600;
            text-decoration: none;
        }

        .btn-main:hover {
            background: #2563EB;
            color: white;
        }

        /* FEATURES */
        .feature-box {
            text-align: center;
            padding: 25px;
            border-radius: 12px;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06);
            transition: 0.2s;
        }

        .feature-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 14px rgba(0,0,0,0.12);
        }

        .feature-icon {
            font-size: 45px;
            color: var(--primary);
            margin-bottom: 15px;
        }

        /* FOOTER */
        footer {
            margin-top: 80px;
            padding: 25px;
            background: white;
            text-align: center;
            color: var(--text-grey);
            border-top: 1px solid #e5e7eb;
        }
		
		/* Modal Fade + Slide Animation */
		.modal.fade .modal-dialog {
		    transform: translateY(-30px);
		    opacity: 0;
		    transition: all 0.35s ease;
		}

		.modal.show .modal-dialog {
		    transform: translateY(0);
		    opacity: 1;
		}
		.modal-backdrop.show {
		    opacity: 0.4 !important;
		    transition: opacity 0.3s ease-in-out;
		}
		
		.modal-content {
		    border-radius: 12px;
		    transform: scale(0.95);
		    transition: transform 0.3s ease;
		}

		.modal.show .modal-content {
		    transform: scale(1);
		}

		
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand fw-bold fs-4" href="#">
            <i class="fa-solid fa-hand-holding-heart"></i> VolunteerHub
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse text-end" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/home">Home</a></li>
				<c:choose>
				    <c:when test="${not empty user}">
				   		<c:choose>
							<c:when test="${user.role=='ADMIN'}">
								<li class="nav-item">
								    <a class="nav-link" href="/admin/dashboard">dashboard</a>
							   </li>
							</c:when>
							<c:when test="${user.role=='VOLUNTEER'}">
								<li class="nav-item">
								    <a class="nav-link" href="/volunteer/dashboard">dashboard</a>
							   </li>
							</c:when>
						</c:choose>
				    </c:when>

				    <c:otherwise>
				        <li class="nav-item">
				            <a class="nav-link" href="/login">Login</a>
				        </li>
				    </c:otherwise>
				</c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- HERO SECTION -->
<section class="hero">
    <img src="${pageContext.request.contextPath}/image/image1.avif" class="img-fluid mb-4"
         style="max-width: 650px; border-radius: 12px;">
    <!-- YOU WILL REPLACE ABOVE IMAGE LATER -->

    <h1>Join Hands To Make a Difference</h1>
    <p>Connect volunteers with meaningful events. Manage activities with a single, powerful dashboard.</p>

    <a href="/volunteer/dashboard" class="btn-main">Become a Volunteer</a>
</section>

<!-- FEATURES -->
<div class="container mt-5">
    <div class="row g-4">

        <div class="col-md-4">
            <div class="feature-box">
                <i class="fa-solid fa-calendar-check feature-icon"></i>
                <h5 class="fw-bold">Manage Events</h5>
                <p>Create and organize public service events easily.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="feature-box">
                <i class="fa-solid fa-users feature-icon"></i>
                <h5 class="fw-bold">Volunteer Connect</h5>
                <p>Match volunteers to activities that need them most.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="feature-box">
                <i class="fa-solid fa-chart-line feature-icon"></i>
                <h5 class="fw-bold">Smart Reports</h5>
                <p>Track participation, events, and growth trends.</p>
            </div>
        </div>

    </div>
</div>

<!-- FOOTER -->
<footer>
    © 2025 VolunteerHub. All Rights Reserved.
</footer>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">Login</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Body will load login.jsp here -->
      <div class="modal-body" id="loginModalBody">
        Loading...
      </div>

    </div>
  </div>
</div>

<script>

</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>
