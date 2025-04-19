<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Transaction Successful</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
            margin: 80px auto;
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            text-align: center;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }

        .highlight {
            font-size: 22px;
            color: #27ae60;
            font-weight: bold;
        }

        .btn {
            margin-top: 25px;
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .info-block {
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>✅ Withdrawal Successful</h2>

    <p><strong>Account ID:</strong> ${account.cid}</p>
    <div class="info-block">
        <p><strong>Withdrawn Amount:</strong> ₹ ${withdrawnAmount}</p>
        <p><strong>Transaction Time:</strong> ${transactionTime}</p>
    </div>
    
        <button type="submit" class="btn">Back to Options</button>
    </form>
</div>
</body>
</html>
