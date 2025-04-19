<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Successful</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            width: 380px;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            background-color: white;
            text-align: center;
        }

        .circle {
            background-color: #28a745;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin: 0 auto 20px;
        }

        .amount {
            font-size: 22px;
            font-weight: bold;
            color: #000;
        }

        .info-text {
            font-size: 16px;
            color: #555;
        }

        .divider {
            margin: 20px 0;
            border-top: 1px dashed #ccc;
        }
    </style>
</head>
<body>

<div class="card">
    <h4 class="mb-3">Transaction Successful!</h4>

    <div class="circle"></div>

    <div class="info-text mb-2">
        ${cnm}
    </div>

    <div class="amount mb-2">
        Amount : ₹${amount}
    </div>

    

    
    <div class="divider"></div>
<div class="info-text mt-2">
        <b>Transaction date  :</b> ₹${dateTime}
    </div>
</html>
