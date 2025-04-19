<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #666;
            padding: 8px 12px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        form {
            text-align: center;
            margin-top: 20px;
        }
        input[type="number"] {
            padding: 5px;
            width: 200px;
        }
        input[type="submit"] {
            padding: 6px 12px;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<h2>Transaction History</h2>

<!-- Form to enter Customer ID -->
<form action="/viewTransaction" method="post">
   
</form>

<!-- Table to display transactions -->
<table>
    <tr>
        <th>Customer Name</th>
        <th>Account ID</th>
        <th>Transaction Type</th>
        <th>Amount</th>
        <th>Date</th>
    </tr>

    <c:forEach var="transaction" items="${transactions}">
        <tr>
            <td>${transaction.cnm}</td>
            <td>${transaction.cid}</td>
            <td>
    <c:choose>
        <c:when test="${transaction.transactionType != null && transaction.transactionType == 'CREDIT'}">
            +${transaction.amount}
        </c:when>
        <c:when test="${transaction.transactionType != null && (transaction.transactionType == 'WITHDRAW' || transaction.transactionType == 'TRANSFER')}">
            -${transaction.amount}
        </c:when>
        <c:otherwise>
            ${transaction.transactionType}
        </c:otherwise>
    </c:choose>
</td>

            <td>${transaction.amount}</td>
            <td>${transaction.transactionDate}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
