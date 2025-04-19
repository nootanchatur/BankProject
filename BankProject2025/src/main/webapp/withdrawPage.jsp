<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw Money</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <!-- Card -->
            <div class="card shadow-lg rounded">
                <div class="card-header bg-primary text-white text-center">
                    <h4>Withdraw Funds</h4>
                </div>

                <div class="card-body">

                    <!-- Success/Failure Message -->
                    <c:if test="${not empty message}">
                        <div class="alert alert-info text-center">${message}</div>
                    </c:if>

                    <!-- Withdrawal Form -->
                    <form action="/withdraw" method="post">
    <input type="hidden" name="cid" value="${a.cid}" />

    <!-- 🔥 Add these -->
    <input type="hidden" name="transactionType" value="WITHDRAW" />
    <input type="hidden" name="transactionDate" value="<%= java.time.LocalDate.now() %>" />

    <div class="mb-3">
        <label for="amount" class="form-label">Amount to Withdraw</label>
        <input type="number" id="amount" name="amount" step="0.01" min="0.01"
               class="form-control" placeholder="Enter amount" required />
    </div>

    <div class="mb-3 d-flex justify-content-between">
        <button type="submit" class="btn btn-success">Withdraw</button>
    </div>
</form>

                </div>

                
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle (optional for interactions) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<div class="text-center mt-4">
</div>
        
</body>
</html>
