<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Accepted Invitations</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body style="background:#f4f6f9;">

<div class="container py-5">

    <div class="text-center mb-4">
        <h2 class="fw-bold text-success">Accepted Event Requests</h2>
        <p class="text-muted">Events you have successfully accepted</p>
    </div>

    <c:if test="${empty invitation}">
        <div class="alert alert-info text-center">
            You have not accepted any invitations yet.
        </div>
    </c:if>

    <div class="row">
        <c:forEach var="inv" items="${invitation}">
            <div class="col-md-6 col-lg-4 mb-4">

                <div class="card shadow-sm h-100 p-3 rounded-3">

                    <h5 class="fw-bold text-primary">${inv.title}</h5>
                    <hr>

                    <p><b>Date:</b> ${inv.date}</p>
                    <p><b>Location:</b> ${inv.location}</p>
                    <p class="text-muted">${inv.description}</p>

					<div class="mt-auto d-flex justify-content-between align-items-center">
					    <span class="badge bg-success">
					        ✔ Accepted
					    </span>

					    <button class="btn btn-sm btn-outline-primary"
					            onclick="markAttendance('${inv.id}')">
					        Mark Attendance
					    </button>
					</div>

                </div>

            </div>
        </c:forEach>
    </div>

</div>


<script>
function markAttendance(eventId){

    if(!navigator.geolocation){
        alert("GPS not supported");
        return;
    }

    navigator.geolocation.getCurrentPosition(function(pos){

        fetch("/volunteer/attendance/mark", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                eventId: eventId,
                latitude: pos.coords.latitude,
                longitude: pos.coords.longitude
            })
        })
        .then(res => res.text())
        .then(msg => alert(msg));

    }, function(){
        alert("Please allow location access");
    });
}
</script>




</body>
</html>
