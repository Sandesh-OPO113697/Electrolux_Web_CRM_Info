<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timmer.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>
<html>
<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="custom.css" rel="stylesheet">

      <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="lib/jquery-3.6.4.min.js"></script>
    <link href="lib/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">

    <script src="lib/bootstrap-5.3.2/js/bootstrap.min.js"></script>

    <link href="custom.css" rel="stylesheet">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <link href="lib/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="lib/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>

    <link href="custom.css" rel="stylesheet">
   <%--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
    <style>
       #progressContainer {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 300px; /* Adjust the width as needed */
            text-align: center;
        }

        #progressBar {
            width: 100%;
            height: 50px;
            background-color: #f8f9fa; /* Bootstrap background color */
            border: 1px solid #dee2e6; /* Bootstrap border color */
            border-radius: 5px;
        }

        #progressBarFill {
            height: 100%;
            width: 0;
            background-color: #28a745; /* Bootstrap success color */
            border-radius: 5px;
        }

        #loadingText {
            margin-top: 10px;
        }
         body {
           background-color: #303030; /* Set your desired darker background color */
            color: #ffffff; /* Set your desired background color */
        }
         #logo {
            text-align: center;
            padding-top: 10px;
            padding-bottom:50px; /* Adjust top padding as needed */
        }
    </style>
     <script>
         $(document).ready(function () {
             $("body").css("background-color", "black");
         });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div id="logo">
        <img src="./Images/nagalogo.png" style="width: 150px; height: 60px;margin-top:220px" alt="Image 1">
    </div>
        <br />
   <div id="progressContainer">
       
  
       <br />
        <div class="progress" id="progressBar">
            <div class="progress-bar" role="progressbar" id="progressBarFill" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <div style="display:none" id="TimerStart1010"></div>
        <div id="loadingText" style="display:none" class="d-none">Loading...</div>
    </div>
    </div>
    </form>
     <link href="custom.css" rel="stylesheet">

      <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="lib/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">

    <script src="lib/bootstrap-5.3.2/js/bootstrap.min.js"></script>

    <link href="custom.css" rel="stylesheet">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <link href="lib/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="lib/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>

    <link href="custom.css" rel="stylesheet">

      <script src="lib/jquery-3.6.4.min.js"></script>
     <link href="custom.css" rel="stylesheet">

      <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="lib/jquery-3.6.4.min.js"></script>
    <link href="lib/bootstrap-5.3.2/css/bootstrap.min.css" rel="stylesheet">

    <script src="lib/bootstrap-5.3.2/js/bootstrap.min.js"></script>

    <link href="custom.css" rel="stylesheet">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <link href="lib/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="lib/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>

    <link href="custom.css" rel="stylesheet">
    <script>
        var secondsRemaining = 10;
        var progressContainer = document.getElementById('progressContainer');
        var progressBar = document.getElementById('progressBarFill');
        var loadingText = document.getElementById('loadingText');
        var timerElement = document.getElementById('TimerStart1010');

        function updateTimer() {
            if (secondsRemaining >= 0) {
                timerElement.innerText = secondsRemaining;


                var progress = (10 - secondsRemaining) / 10 * 100;
                progressBar.style.width = progress + '%';
                progressBar.innerText = Math.round(progress) + '%';

                secondsRemaining--;

                if (secondsRemaining >= 0) {
                    setTimeout(updateTimer, 1000);
                } else {
 
                    timerElement.style.visibility = 'hidden';
 
                    progressBar.style.width = '0%';
                    progressBar.innerText = '';

                    progressContainer.style.visibility = 'hidden';

                    loadingText.classList.remove('d-none');

                  
                    setTimeout(function () {
                        window.location.href = 'CRM.aspx';
                    }, 2000);
                }
            }
        }
        updateTimer();
    </script>
</body>
</html>
