<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for a Loan</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #007bff;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            max-width: 500px;
            margin: 0 auto;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s ease;
        }

        input:focus, select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            margin-top: 20px;
            color: green;
        }

        @media (max-width: 600px) {
            form {
                padding: 20px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<h2>Apply for a Loan</h2>

<form action="/apply-loan" method="post">
    <label for="cid">Customer ID:</label>
    <input type="text" name="cid" value="${cid}" required />

    <label for="loanType">Loan Type:</label>
    <select name="loanType" required>
        <option value="Home">Home</option>
        <option value="Personal">Personal</option>
        <option value="Education">Education</option>
        <option value="Car">Car</option>
    </select>

    <label for="amount">Loan Amount:</label>
    <input type="number" name="amount" required step="0.01" min="1000" placeholder="Enter loan amount"/>

    <label for="termInMonths">Term (in months):</label>
    <input type="number" name="termInMonths" required min="1" placeholder="Enter number of months"/>

    <input type="submit" value="Apply Loan" />
</form>

<c:if test="${not empty message}">
    <div class="message">
        <p>${message}</p>
    </div>
</c:if>

</body>
</html>
