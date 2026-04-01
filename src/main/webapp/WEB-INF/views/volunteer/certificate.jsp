<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Certificate</title>

    <style>
        body {
            font-family: "Georgia", serif;
            background: #eef2f7;
            padding: 30px;
        }

        .certificate {
            width: 950px;
            margin: auto;
            background: #ffffff;
            border: 12px solid #1e3a8a;
            padding: 50px;
            position: relative;
        }

        /* Header */
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .logo {
            width: 120px;
        }

        .title-box {
            text-align: center;
            flex: 1;
        }

        .title {
            font-size: 44px;
            font-weight: bold;
            color: #1e3a8a;
            letter-spacing: 1px;
        }

        .subtitle {
            font-size: 18px;
            color: #555;
            margin-top: 8px;
        }

        /* Main content */
        .content {
            text-align: center;
            margin-top: 40px;
            font-size: 20px;
            color: #333;
            line-height: 1.7;
        }

        .name {
            font-size: 32px;
            font-weight: bold;
            color: #000;
            margin: 25px 0;
            text-transform: uppercase;
        }

        .event {
            font-weight: bold;
            color: #1e3a8a;
        }

        /* Info section */
        .info {
            margin-top: 40px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px 40px;
            font-size: 16px;
            color: #444;
        }

        .info span {
            font-weight: bold;
            color: #000;
        }

        /* Footer */
        .footer {
            margin-top: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .date, .sign {
            font-size: 16px;
            color: #333;
            text-align: center;
        }

        .signature {
            margin-top: 10px;
            border-top: 2px solid #000;
            width: 220px;
        }

        .city {
            margin-top: 30px;
            text-align: center;
            font-size: 16px;
            color: #555;
        }

        .certificate-id {
            position: absolute;
            bottom: 18px;
            right: 25px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>

<body>

<div class="certificate">

    <!-- Header -->
    <div class="header">
        <img src="${pageContext.request.contextPath}/image/volunteerHubLogo.png"
             alt="Organization Logo"
             class="logo">

        <div class="title-box">
            <div class="title">Certificate of Completion</div>
            <div class="subtitle">This certificate is proudly presented to</div>
        </div>
    </div>

    <!-- Volunteer Name -->
    <div class="name">${certificateDetail.volunteerName}</div>

    <!-- Main Content -->
    <div class="content">
        For successfully completing the event  
        <span class="event">"${certificateDetail.eventName}"</span>
        held on <b>${certificateDetail.completionDate}</b>.
    </div>

    <!-- Additional Details -->
    <div class="info">
        <div><span>Event Location:</span> ${certificateDetail.eventLocatioin}</div>
        <div><span>City:</span> ${certificateDetail.city}</div>

        <div><span>Event Description:</span> ${certificateDetail.eventDiscription}</div>
        <div><span>Volunteer Email:</span> ${certificateDetail.volunteerEmail}</div>

        <div><span>Phone:</span> ${certificateDetail.phone}</div>
        <div><span>Completion Date:</span> ${certificateDetail.completionDate}</div>
    </div>

    <!-- City line -->
    <div class="city">
        Issued at ${certificateDetail.city} on ${certificateDetail.completionDate}
    </div>

    <!-- Footer -->
    <div class="footer">
        <div class="date">
            Date<br>
            <b>${certificateDetail.completionDate}</b>
        </div>

        <div class="sign">
            Authorized Signature
            <div class="signature"></div>
        </div>
    </div>

    <!-- Certificate ID -->
    <div class="certificate-id">
        Certificate ID: ${certificateDetail.certificateId}
    </div>

</div>

</body>
</html>
