<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IDBI Bank Registration</title>
<style>
    body {
        background-color: #f0f8ff;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .logo img {
        width: 150px;
        margin-bottom: 20px;
    }
    h2 {
        color: #007bff;
        margin-bottom: 20px;
    }
    form {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        width: 300px;
    }
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="checkbox"] {
        margin-right: 10px;
    }
    button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 12px;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }
    button:hover {
        background-color: #0056b3;
    }
    p {
        text-align: center;
        margin-top: 20px;
    }
    .mobile-app-banner img {
        width: 300px;
        margin-top: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="logo">
        </div>
        <h2>PassBook_Registration</h2>
        <form action="/passbook" method="Post">
            <label>Enter Customer ID:</label>
            <input type="text" name="cid" placeholder="Enter Customer ID" required>
            
            <label>Enter Mobile Number:</label>
<input type="text" name="mob" placeholder="IN +91 - Mobile Number" required>
            
            <label>
                <input type="checkbox" required> I accept the <a href="#">Terms and Conditions</a>
            </label>
            
            <button type="submit">REGISTER</button>
        </form>
        
    </div>
</body>
</html>
