<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Loan Applications</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 16px;
        }

        td {
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        @media (max-width: 768px) {
            table {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }
        }

        .no-records {
            text-align: center;
            color: #888;
            font-size: 18px;
        }

    </style>
</head>
<body>

<h2>Your Loan Applications</h2>

<c:if test="${not empty loans}">
    <table>
        <tr>
            <th>Loan Type</th>
            <th>Amount</th>
            <th>Term (months)</th>
            <th>Status</th>
            <th>Application Date</th>
        </tr>
        <c:forEach var="loan" items="${loans}">
            <tr>
                <td>${loan.loanType}</td>
                <td>${loan.amount}</td>
                <td>${loan.termInMonths}</td>
                <td>${loan.status}</td>
                <td>${loan.transactionDate}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${empty loans}">
    <p class="no-records">No loan applications found.</p>
</c:if>

</body>
</html>
