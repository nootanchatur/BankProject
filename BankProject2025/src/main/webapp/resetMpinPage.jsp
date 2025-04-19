<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Reset MPIN</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 100px auto;
            background: #fff;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #444;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 10px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Reset Your MPIN</h2>
        <form action="/resetMpin" method="post">
            <label>Customer ID:</label>
            <input type="text" name="cid" required value="${cid}"/>

            <label>Old MPIN:</label>
            <input type="password" name="pass" required />

            <label>Confirm MPIN:</label>
            <input type="password" name="confirmMpin" required />

            <button type="submit">Reset MPIN</button>
        </form>

        <c:if test="${not empty error}">
            <div class="message error">${error}</div>
        </c:if>

        <c:if test="${not empty message}">
            <div class="message success">${message}</div>
        </c:if>
    </div>
</body>
</html>
