<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Event</title>

    <!-- Google Fonts -->
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

        .event-box {
            width: 650px;
            margin: 50px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.12);
        }

        .section-title {
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: 500;
        }

        .btn-submit {
            background: #1a202c;
            color: white;
            padding: 10px;
            border-radius: 8px;
            border: none;
            width: 100%;
            font-size: 16px;
        }

        .btn-submit:hover {
            background: #2d3748;
        }
    </style>

</head>
<body>

<div class="event-box">

    <h3 class="section-title"><i class="fa-solid fa-calendar-plus"></i> Update Event</h3>

    <!-- Success message -->
    <c:if test="${not empty msg}">
        <div class="alert alert-info">${msg}</div>
    </c:if>

    <form action="/admin/events/update/${event.id}" method="post">

		
		<!-- id -->
		<div class="mb-3">
		     label>Event Title</label>
		     <input type="hidden" value="${event.id}" name="id" class="form-control" placeholder="" required>
		  </div>
        <!-- Title -->
        <div class="mb-3">
            <label>Event Title</label>
            <input type="text" value="${event.title}" name="title" class="form-control" placeholder="Blood Donation Drive" required>
        </div>
		

        <!-- Description -->
        <div class="mb-3">
            <label>Description</label>
            <textarea  name="description" rows="4" class="form-control" placeholder="Describe the purpose and details..." required>
				${event.description}
			</textarea>
        </div>

        <!-- Date -->
        <div class="mb-3">
            <label>Event Date</label>
            <input type="date" value="${event.date}" name="date" class="form-control" required>
        </div>

        <!-- Location -->
        <div class="mb-3">
            <label>Location</label>
            <input type="text" value="${event.location}" name="location" class="form-control" placeholder="Mumbai, Pune, Delhi..." required>
        </div>

        <!-- Required Volunteers -->
        <div class="mb-3">
            <label>Required Volunteers</label>
            <input type="number" value="${event.requiredVolunteers}" name="requiredVolunteers" class="form-control" min="1" required>
        </div>
		
		<input type="number" step="any" value="${event.latitude}" name="latitude" class="form-control">
		<input type="number" step="any" value="${event.longitude}" name="longitude" class="form-control">

		<input type="hidden" name="approvedVolunteers" value="${event.approvedVolunteers}">

        <!-- Submit Button -->
        <button type="submit" class="btn-submit">
            <i class="fa-solid fa-paper-plane"></i> Update Event
        </button>
    </form>

</div>

</body>
</html>


