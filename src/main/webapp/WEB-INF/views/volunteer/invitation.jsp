<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Your Invitations</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>
<div class="container py-4">

    <h2>Event Invitations</h2>
	
	<!-- ✅ FIXED VARIABLE NAME -->
	   <c:if test="${empty invitation}">
	       <div class="alert alert-info text-center">
	           No invitations available.
	       </div>
	   </c:if>

    <c:forEach var="inv" items="${invitation}">
        <div class="card p-3 mb-3">

            <h4 class="text-primary">${inv.title}</h4>
            <p><b>Date:</b> ${inv.date}</p>
            <p><b>Location:</b> ${inv.location}</p>
            <p><b>Description:</b> ${inv.description}</p>

            <c:choose>
                <c:when test="${inv.status == 'Yes'}">
					<div style="display:flex;width:250px;justify-content:space-between;">
						<div class="text-success fw-bold">
						    ✔ Accepted
						</div>
						<div>
							<button class="btn btn-success" name="response" value="No">
								Mark Present
							</button>
						</div>
					</div>
					
					
					
                </c:when>

                <c:when test="${inv.status == 'No'}">
                    <span class="text-danger fw-bold">
                        ✖ Rejected
                    </span>
                </c:when>
				
				
				
				

                <c:otherwise>
					<form action="/volunteer/respond" method="post" class="d-flex gap-2">

					    <input type="hidden" name="token" value="${inv.token}" />

					    <button class="btn btn-success" name="response" value="Yes">
					        Accept
					    </button>

					    <button class="btn btn-danger" name="response" value="No">
					        Reject
					    </button>
						

					</form>
                </c:otherwise>
            </c:choose>

        </div>
    </c:forEach>

</div>
</body>
</html>
