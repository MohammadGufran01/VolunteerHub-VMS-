<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Attendance History</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Poppins', sans-serif;
        }

        .history-card {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            padding: 25px;
        }

        .page-title {
            font-weight: 600;
            color: #2c3e50;
        }

        .badge-present {
            background: #2ecc71;
        }

        .badge-absent {
            background: #e74c3c;
        }
    </style>
</head>

<body>

<div class="container mt-5">

    <div class="text-center mb-4">
        <h3 class="page-title">My Attendance History</h3>
        <p class="text-muted">Track your event-wise attendance</p>
    </div>

    <div class="history-card">

        <table class="table table-bordered table-hover align-middle text-center">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Event Name</th>
                    <th>Date</th>
                    <th>Location</th>
                    <th>Status</th>
                    <th>Marked Time</th>
					<th>Download Certificate</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="att" items="${myAttendance}">
                    <tr>
                        <td>${status.count}</td>
                        <td>${att.event.title}</td>
                        <td>${att.event.date}</td>
                        <td>${att.event.location}</td>

                        <td>
                            <c:if test="${att.present == 'true'}">
                                <span class="badge badge-present">Present</span>
                            </c:if>
                            <c:if test="${att.present == 'false'}">
                                <span class="badge badge-absent">Absent</span>
                            </c:if>
                        </td>
						
						<td>${att.markedAt}</td>
						
						<td>
						    <c:if test="${att.present == 'true'}">
						        <a href="/volunteer/certificateDetails/${att.id}">download</a>
						    </c:if>
						    <c:if test="${att.present == 'false'}">
						        <span class="badge badge-absent">BNT</span>
						    </c:if>
						</td>
						
						


                    </tr>
                </c:forEach>

                <c:if test="${empty myAttendance}">
                    <tr>
                        <td colspan="6" class="text-muted">No attendance records found</td>
                    </tr>
                </c:if>

            </tbody>
        </table>

    </div>

</div>

</body>
</html>
