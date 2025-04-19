<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(to right, #e0f7fa, #80deea);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }

        form {
            background-color: #fff;
            padding: 30px 25px;
            border-radius: 12px;
            max-width: 500px;
            margin: 0 auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
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
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        @media (max-width: 600px) {
            form {
                padding: 20px;
            }

            h1 {
                font-size: 22px;
            }
        }
    </style>

    <script>
        function calculateAge() {
            const dobInput = document.querySelector('input[name="bod"]');
            const ageInput = document.querySelector('input[name="age"]');

            const dob = new Date(dobInput.value);
            const today = new Date();

            if (!isNaN(dob.getTime())) {
                let age = today.getFullYear() - dob.getFullYear();
                const monthDiff = today.getMonth() - dob.getMonth();
                const dayDiff = today.getDate() - dob.getDate();

                if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
                    age--;
                }

                ageInput.value = age;
            } else {
                ageInput.value = '';
            }
        }
    </script>
</head>
<body>

<h1>Customer Registration Form</h1>

<form action="/regData" method="post">

    <label>Customer ID:</label>
    <input type="text" name="cid" required pattern="\d+" title="Only numbers are allowed.">
    
    <label>Customer Full Name:</label>
    <input type="text" name="cnm" required pattern="[A-Za-z ]+" title="Only letters and spaces are allowed.">
    
    <label>Password:</label>
    <input type="password" name="pass" required 
        pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}" 
        title="Password must be at least 6 characters with uppercase, lowercase, number, and special character.">

    <label>Aadhar Number:</label>
    <input type="text" name="cAdharNo" required maxlength="12" pattern="\d{12}" title="Aadhar number must be 12 digits.">

    <label>PanCard Number:</label>
    <input type="text" name="cPanNo" pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" title="Enter a valid PAN (e.g., ABCDE1234F)">

    <label>Date of Birth (DOB):</label>
    <input type="date" name="bod" required onchange="calculateAge()">

    <label>Age:</label>
    <input type="text" name="age" required readonly>

    <label>Mobile Number:</label>
    <input type="text" name="mob" required maxlength="10" pattern="\d{10}" title="Mobile number must be 10 digits.">

    <label>Email ID:</label>
    <input type="email" name="email" required>

    <label>Account Type:</label>
    <select name="accType" required>
        <option value="1">Saving Account</option>
        <option value="2">Current Account</option>
    </select>

    <input type="submit" value="SAVE">
</form>

</body>
</html>
