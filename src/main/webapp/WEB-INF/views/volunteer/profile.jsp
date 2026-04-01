<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Volunteer Profile</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: #f5f6fa;
        }
        .profile-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .avatar {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            border: 4px solid #007bff;
            object-fit: cover;
        }
        .section-title {
            border-left: 4px solid #007bff;
            padding-left: 10px;
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 15px;
        }
        .activity-card {
            background: #fff;
            border-radius: 10px;
            padding: 15px;
            border-left: 4px solid #007bff;
        }
    </style>
</head>

<body>

<div class="container py-5">

    <div class="row justify-content-center">
        <div class="col-lg-7">

            <!-- ===== PROFILE HEADER ===== -->
            <div class="profile-card text-center mb-4">
              

                <h2 class="fw-bold">${user.name}</h2>
                <p class="text-muted mb-2">Volunteer</p>

                <div class="d-flex justify-content-center gap-4 mt-3">
                    <div>
                        <i class="fa-solid fa-envelope text-primary"></i>
                        <p class="m-0">${user.email}</p>
                    </div>
                    <div>
                        <i class="fa-solid fa-phone text-primary"></i>
                        <p class="m-0">${user.phone}</p>
                    </div>
                </div>
            </div>

            <!-- ===== PERSONAL INFORMATION ===== -->
            <div class="profile-card mb-4">
                <div class="section-title">Personal Information</div>
                
                <div class="row">
                    <div class="col-6 mb-3">
                        <strong>City:</strong>
                        <p>${user.city}</p>
                    </div>
      
                </div>
            </div>

        </div>
    </div>
</div>

<!-- FontAwesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/js/all.min.js"></script>

</body>
</html>
