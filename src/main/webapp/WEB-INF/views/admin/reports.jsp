<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reports & Analytics</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body { background: #f7f8fa; }
        .card-box {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .stat-number {
            font-size: 2rem;
            font-weight: bold;
        }
        .chart-card {
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
    </style>
</head>

<body>

<div class="container py-4">

    <h2 class="fw-bold mb-4">Reports & Analytics</h2>

    <!-- Summary Cards -->
    <div class="row g-3">

        <div class="col-md-3">
            <div class="card-box text-center">
                <h6>Total Events</h6>
                <div class="stat-number">${totalEvents}</div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box text-center">
                <h6>Total Volunteers</h6>
                <div class="stat-number">${totalVolunteers}</div>
            </div>
        </div>

       
    </div>

    <!-- Charts -->
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center">Overall Volunteer Responses</h5>
                <canvas id="responseChart"></canvas>
            </div>
        </div>

        <div class="col-md-6">
            <div class="chart-card">
                <h5 class="text-center">Event-wise Volunteer Count</h5>
                <canvas id="eventChart"></canvas>
            </div>
        </div>
    </div>

</div>

<script>
// Pie chart for responses
new Chart(document.getElementById("responseChart"), {
    type: "pie",
    data: {
        labels: ["Agreed", "Disagreed", "Pending"],
        datasets: [{
            data: [${agreedCount}, ${disagreedCount}, ${pendingCount}]
        }]
    }
});

// Bar chart for event participation
new Chart(document.getElementById("eventChart"), {
    type: "bar",
    data: {
        labels: [
            <c:forEach var="e" items="${eventWiseCount}">
                "${e[0]}", 
            </c:forEach>
        ],
        datasets: [{
            label: "Volunteers",
            data: [
                <c:forEach var="e" items="${eventWiseCount}">
                    ${e[1]}, 
                </c:forEach>
            ]
        }]
    }
});
</script>

</body>
</html>
