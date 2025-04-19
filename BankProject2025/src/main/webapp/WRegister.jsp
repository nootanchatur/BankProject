<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Saving Account - Options and Rules</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 40px;
    }
    h1 {
        color: #007bff;
    }
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    ul {
        line-height: 1.8;
    }
    button {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        margin-top: 20px;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Saving Account Opening Portal</h1>
        
        <h3> Options Available:</h3>
        <ul>
            <li>Minimum Balance Requirement: ₹1,000</li>
            <li>Interest Rate: 3.5% per annum</li>
            <li>Online and Offline Account Management</li>
            <li>Free Debit Card and Net Banking</li>
        </ul>
        
        <h3> Rules and Regulations:</h3>
        <ul>
            <li>Applicant must be 18 years or above.</li>
            <li>Valid Aadhaar and PAN Card required.</li>
            <li>Address Proof and Passport-size photo needed.</li>
            <li>Initial deposit of ₹1,000 is mandatory.</li>
        </ul>

        <form action="reg" >
            <button type="submit">Proceed to Open Saving Account</button>
        </form>
    </div>
</body>
</html>
