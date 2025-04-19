<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Registration Successful</title>
    <style>
        body {
            background-color: #eaf6ff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .success-container {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .success-container h2 {
            color: #28a745;
            margin-bottom: 15px;
        }

        .success-container p {
            font-size: 16px;
            color: #333;
        }

        .success-container a {
            display: inline-block;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 6px;
        }

        .success-container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h2>✅ Registration Successful!</h2>
        <p>Thank you for registering. You can now proceed to log in.</p>
    </div>
</body>
</html>
