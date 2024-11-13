<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Page</title>
    <style>
        /* General reset for padding and margin */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
            position: relative;
            width: auto; /* Make the card width auto to adjust to content */
            max-width: 90%; /* Limit the card width to 90% of the viewport for larger messages */
            min-width: 300px; /* Set a minimum width for the card */
        }

        h1 {
            font-size: 1.5rem;
            color: #e74c3c;
            margin-bottom: 20px;
            word-wrap: break-word; /* Ensure long words break and wrap to new lines */
        }

        p {
            color: #555;
            font-size: 1rem;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h1 id="ErrorMassge" runat="server">Error!</h1>
            <p>You got this error message. Please try again.</p>
            <button type="button" class="btn" onclick="window.location.href='login.aspx';">Go Back</button>
        </div>
    </form>
</body>
</html>
