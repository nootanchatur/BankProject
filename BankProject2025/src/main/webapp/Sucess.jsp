<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Customers Data</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        padding: 20px;
    }
    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ddd;
    }
    th {
        background-color: #4CAF50;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
</style>
</head>
<body>

<h1>All Customers Data</h1>

<table>
<tr>
    <th>CID</th>
    <th>Name</th>
    <th>UserName</th>
    <th>Aadhar Number</th>
    <th>PanCard Number</th>
    <th>Birth Date</th>
    <th>Age</th>
    <th>Mobile No</th>
    <th>Account Type</th>
    <th>Email</th>
    <th>Balance</th>
</tr>

<c:forEach items="${data}" var="ctu">
<tr>
    <td>${ctu.cid}</td>
    <td>${ctu.cnm}</td>
    <td>${ctu.pass}</td>
    <td>${ctu.cAdharNo}</td>
    <td>${ctu.cPanNo}</td>
    <td>${ctu.bod}</td>
    <td>${ctu.age}</td>
    <td>${ctu.mob}</td>
    <td>
        <c:choose>
            <c:when test="${ctu.accType == '1' || ctu.accType == 'SA'}">Saving Account</c:when>
            <c:when test="${ctu.accType == '2' || ctu.accType == 'CA'}">Current Account</c:when>
            <c:otherwise>Unknown</c:otherwise>
        </c:choose>
    </td>
    <td>${ctu.email}</td>
    <td>${ctu.balance}</td>
</tr>
</c:forEach>
</table>

</body>
</html>
