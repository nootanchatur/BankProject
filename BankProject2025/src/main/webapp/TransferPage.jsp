<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transfer Money</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .transfer-form-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .transfer-form-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px 0;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .message {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<div class="transfer-form-container">
    <h2>Transfer Money</h2>

    <form:form action="${pageContext.request.contextPath}/transfer" method="post" modelAttribute="transferRequest">
        <table>
            <tr>
                <td>From Account:</td>
                <td><form:input path="fromAccount" placeholder="Sender's account number" /></td>
            </tr>
            <tr>
                <td>To Account:</td>
                <td><form:input path="toAccount" placeholder="Receiver's account number" /></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td><form:input path="amount" placeholder="Amount to transfer" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Transfer" />
                </td>
            </tr>
        </table>
    </form:form>

    <c:if test="${not empty successMessage}">
        <p class="message success">${successMessage}</p>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <p class="message error">${errorMessage}</p>
    </c:if>
</div>

</body>
</html>
