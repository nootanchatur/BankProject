<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Balance</title>
    <!-- ✅ Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4 rounded-4">
        <h2 class="text-center mb-4 text-primary">Hello Customer!</h2>

        <!-- ✅ Balance display -->
        <c:if test="${not empty b}">
            <div class="alert alert-success text-center fs-4">
                Your Balance: <strong>${b}</strong>
            </div>
        </c:if>

       </div>
</div>

<!-- ✅ Bootstrap JS (Optional, for advanced components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
