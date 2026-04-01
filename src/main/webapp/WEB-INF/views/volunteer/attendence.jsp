<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Mark Attendance</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background: #eef2f7;
    }
    .card {
        margin-top: 70px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }
    .btn-attendance {
        font-size: 22px;
        padding: 20px;
        width: 100%;
        border-radius: 10px;
    }
</style>

</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card p-4 text-center">

                <h4 class="mb-3 text-primary">Volunteer Attendance</h4>

                <p class="fw-bold">${event.eventName}</p>
                <p>${event.eventDate}</p>

                <p class="mb-4">
                    <span class="text-secondary">Volunteer:</span> 
                    <strong>${sessionScope.user.name}</strong>
                </p>

                <!-- Present Form -->
                <form action="/volunteer/submit-attendance" method="post">
                    <input type="hidden" name="eventId" value="${event.id}">
                    <input type="hidden" name="volunteerId" value="${sessionScope.user.id}">
                    <input type="hidden" name="status" value="PRESENT">

                    <button class="btn btn-success btn-attendance mb-3">
                        ✅ PRESENT
                    </button>
                </form>

                <!-- Absent Form -->
                <form action="/volunteer/submit-attendance" method="post">
                    <input type="hidden" name="eventId" value="${event.id}">
                    <input type="hidden" name="volunteerId" value="${sessionScope.user.id}">
                    <input type="hidden" name="status" value="ABSENT">

                    <button class="btn btn-danger btn-attendance">
                        ❌ ABSENT
                    </button>
                </form>

                <c:if test="${not empty success}">
                    <div class="alert alert-success mt-3">${success}</div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3">${error}</div>
                </c:if>

            </div>
        </div>
    </div>
</div>


`
<script>
function markAttendance(){
    navigator.geolocation.getCurrentPosition(
        function(pos){
            fetch("/attendance/mark", {
                method: "POST",
                headers: {"Content-Type":"application/json"},
                body: JSON.stringify({
                    eventId: ${event.id},
                    latitude: pos.coords.latitude,
                    longitude: pos.coords.longitude
                })
            })
            .then(res => res.text())
            .then(msg => alert(msg));
        },
        function(){
            alert("Please allow location access");
        }
    );
}
</script>

</body>
</html>
