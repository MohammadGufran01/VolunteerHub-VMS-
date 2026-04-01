<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- SweetAlert CDN (include once) -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<c:if test="${not empty msg}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Message',
            text: '<c:out value="${msg}"/>',
            confirmButtonColor: '#28a745'
        });
    </script>
</c:if>

<c:if test="${not empty error}">
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '<c:out value="${error}"/>',
            confirmButtonColor: '#dc3545'
        });
    </script>
</c:if>
