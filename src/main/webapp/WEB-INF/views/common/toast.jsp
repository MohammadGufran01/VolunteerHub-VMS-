<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.toast-container {
  position: fixed;
  top: 20px;
  right: 20px;
  min-width: 300px;
  padding: 16px 20px;
  border-radius: 10px;
  color: #fff;
  font-size: 15px;
  z-index: 9999;
  box-shadow: 0 10px 25px rgba(0,0,0,0.25);
  animation: slideIn 0.4s ease;
  overflow: hidden;
}

.toast-container.info { background: #2563eb; }
.toast-container.error { background: #dc2626; }
.toast-container.success { background: #16a34a; }

.toast-message { display: block; padding-right: 10px; }

.toast-progress {
  position: absolute;
  bottom: 0;
  left: 0;
  height: 4px;
  width: 100%;
  background: rgba(255,255,255,0.9);
  animation: shrink linear;
}

@keyframes slideIn {
  from { transform: translateX(120%); opacity: 0; }
  to { transform: translateX(0); opacity: 1; }
}

@keyframes shrink {
  from { width: 100%; }
  to { width: 0%; }
}

.toast-container.hide {
  animation: fadeOut 0.4s ease forwards;
}

@keyframes fadeOut {
  to { opacity: 0; transform: translateX(120%); }
}
</style>

<c:if test="${not empty toastMsg}">
<div id="customToast"
     class="toast-container ${toastType}"
     data-duration="4000">
    <span class="toast-message">${toastMsg}</span>
    <div class="toast-progress"></div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {

    const toast = document.getElementById("customToast");
    if (!toast) return;

    const duration = toast.getAttribute("data-duration") || 4000;
    const progress = toast.querySelector(".toast-progress");

    progress.style.animationDuration = duration + "ms";

    setTimeout(() => toast.classList.add("hide"), duration);
    setTimeout(() => toast.remove(), duration + 500);
});
</script>
</c:if>
