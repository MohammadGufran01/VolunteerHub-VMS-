<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Volunteer Dashboard</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
        }

        .dashboard {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-top: 100px;
        }

        .card {
            width: 220px;
            height: 130px;
            background: white;
            border-radius: 12px;
            text-align: center;
            padding-top: 25px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        .card h2 {
            margin: 0;
            font-size: 40px;
        }

        .card p {
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .agree { color: green; }
        .disagree { color: red; }
        .pending { color: orange; }
    </style>
</head>

<body>

<div class="dashboard">

    <div class="card">
        <h2 class="agree">${agreedCount}</h2>
        <p>AGREED</p>
    </div>

    <div class="card">
        <h2 class="disagree">${disagreedCount}</h2>
        <p>DISAGREED</p>
    </div>

    <div class="card">
        <h2 class="pending">${pendingCount}</h2>
        <p>PENDING</p>
    </div>

</div>

</body>
</html>
