<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bank Transactions</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 40px;
    }
    .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        width: 400px;
    }
    h1 {
        color: #007bff;
    }
    label {
        font-weight: bold;
    }
    input, select, button {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    button {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }
    button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Welcome, ${a.cid}</h1>
        <h3>Your Account list: ${a.accType}</h3>
        <h3>Balance: ${a.balance}</h3>

        <h2>Enter Amount to Credit</h2>
      

<form action="/credit" method="post">
  <label for="cid">Account ID:</label>
  <input type="text" name="cid" value="${a.cid}" required>
<input type="hidden" name="cnm" value="${a.cnm != null ? a.cnm : ''}" />

  <label for="amount">Enter Amount:</label>
  <input type="number" name="amount" min="1" required>

  <label for="transactionDate">Transaction Date:</label>
     <input type="date" name="transactionDate" value="<%= java.time.LocalDate.now() %>" required>

  <!-- 🔥 Essential: send the type -->
  <input type="hidden" name="transactionType" value="credit">

  <button type="submit">Submit</button>
</form>


        <script>
            var customerId = "${a.cid}";
            console.log("CID:", customerId);
        </script>
<h2>Choose Transaction Option</h2>



<form action="withdraw" method="post">
    <input type="hidden" name="cid" value="${a.cid != null ? a.cid : 0}" />
    <input type="hidden" name="transactionType" value="WITHDRAW" />
    <button type="submit">Withdraw</button>
</form>

<!-- Check Balance -->
<form action="checkBalance" method="post">
    <input type="hidden" name="cid" value="${a.cid != null ? a.cid : 0}" />
    <button type="submit">Check Balance</button>
</form>


<!-- Transfer -->
<form action="transfer" method="post">
    <input type="hidden" name="cid" value="${a.cid != null ? a.cid : 0}" />
    <button type="submit">Transfer</button>
</form>

<!-- View Transaction History -->
<form action="viewTransaction" method="post">
    <input type="hidden" name="cid" value="${a.cid != null ? a.cid : 0}" />
    <button type="submit">View Transaction History</button>
</form>

    </div>
</body>
</html>
