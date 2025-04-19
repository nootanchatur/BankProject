<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Confirm Payment</title></head>
<body>
    <h3>Pay to UPI: ${payeeUpiId}</h3>
    <form action="confirmTransfer" method="post">
        <input type="hidden" name="payeeUpiId" value="${payeeUpiId}" />
        <label>Enter Amount:</label>
        <input type="number" name="amount" required />
        <button type="submit">Send</button>
    </form>
    <c:if test="${not empty error}">
        <p style="color:red;">${error}</p>
    </c:if>
</body>
</html>
