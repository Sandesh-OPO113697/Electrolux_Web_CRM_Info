<%@ Page Language="C#" AutoEventWireup="true" CodeFile="APR.aspx.cs" Inherits="APR" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APR Dashboard</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/plugins.min.css" />
    <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f4f5f7;
            padding: 20px;
        }

        .dashboard {
            max-width: 1200px;
            margin: 0 auto;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 20px;
        }

            .dashboard-header h1 {
                font-size: 24px;
            }

        .select-period select {
            padding: 8px 12px;
            font-size: 14px;
        }

        .stats-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .stat-box {
            flex: 1;
            background-color: white;
            padding: 20px;
            margin: 0 10px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

            .stat-box h3 {
                font-size: 16px;
                margin-bottom: 10px;
            }

        .stat-value {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

            .stat-value span {
                font-size: 24px;
            }

        .small-number {
            background-color: #eee;
            padding: 5px 10px;
            border-radius: 50px;
            font-size: 12px;
        }

        .new-accounts span:first-child {
            color: green;
        }

        .total-expenses span:first-child {
            color: red;
        }

        .company-value span:first-child {
            color: orange;
        }

        .new-employees span:first-child {
            color: green;
        }

        .main-content {
            display: flex;
            justify-content: space-between;
        }

        .chart-box, .income-box {
            flex: 1;
            background-color: white;
            padding: 20px;
            margin: 0 10px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .income-box {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 350px; /* Adjust the height based on your preference */
        }

        .income-circle {
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            width: 150px;
            height: 150px;
            margin: 0 auto; /* Center horizontally */
        }

            .income-circle svg {
                position: absolute;
                top: 0;
                left: 0;
                transform: rotate(-90deg);
            }

                .income-circle svg circle {
                    fill: none;
                    stroke-width: 10;
                    stroke-linecap: round;
                }

                    .income-circle svg circle.background {
                        stroke: #f0f0f0;
                    }

                    .income-circle svg circle.progress {
                        stroke: #4caf50;
                        stroke-dasharray: 440;
                        stroke-dashoffset: calc(440 - (440 * 75) / 100); /* Change 75 to any percentage */
                    }

        .income-percentage {
            position: relative;
            font-size: 24px;
            font-weight: bold;
            color: #4caf50;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .spending-target {
            font-size: 14px;
            color: #999;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form runat="server">
          <div class="sidebar" data-background-color="dark" >
                        <div class="sidebar-logo">

                            <div class="logo-header" data-background-color="dark">
                                <asp:ImageButton ID="btnLogo" runat="server" ImageUrl="~/assets/img/mainLogowhite.png" OnClick="btnLogo_Click"  Height="50" CssClass="navbar-brand" />
                            </div>
                        </div>
                        <div class="sidebar-wrapper scrollbar scrollbar-inner" >
                            <div class="sidebar-content">
                                <ul class="nav nav-secondary">

                                    <li class="nav-section">
                                        <span class="sidebar-mini-icon">
                                            <i class="fa fa-ellipsis-h"></i>
                                        </span>
                                       

                                    </li>


                                    

                                    

                                </ul>


                            </div>

                        </div>

                    </div>
        <div class="dashboard" style="margin-left:300px;">
            <asp:HiddenField ID="hiddenAgentStats" runat="server" />

            <asp:HiddenField ID="TotalCallgDashBoard" runat="server" />
            <asp:HiddenField ID="TargetAchive" runat="server" />
            <div class="dashboard-header">
                <h1>APR Dashboard</h1>
                <div class="select-period" style="color: blue">
                    Displayed data is of -1 hour
                </div>
            </div>

            <div class="stats-container">
                <div class="stat-box new-accounts">
                    <h3>Toss Time</h3>
                    <div class="stat-value">
                        <span id="tossTime">--:--:--</span>

                    </div>
                </div>
                <div class="stat-box total-expenses">
                    <h3>AHT</h3>
                    <div class="stat-value">
                        <span id="aht">--:--:--</span>

                    </div>
                </div>
                <div class="stat-box company-value">
                    <h3>Wrap Time</h3>
                    <div class="stat-value">
                        <span id="wrapTime">--:--:--</span>

                    </div>
                </div>
                <div class="stat-box new-employees">
                    <h3>Total Calls</h3>
                    <div class="stat-value">
                        <span id="totalCalls">0</span>

                    </div>
                </div>
            </div>

            <div class="stats-container">
                <div class="stat-box new-accounts">
                    <h3>Inbound Talk-Time</h3>
                    <div class="stat-value">
                        <span id="inboundTalkTime">--:--:--</span>

                    </div>
                </div>
                <div class="stat-box total-expenses">
                    <h3>Outbound Talk-Time</h3>
                    <div class="stat-value">
                        <span id="outboundTalkTime">--:--:--</span>

                    </div>
                </div>
                <div class="stat-box company-value">
                    <h3>Total Calls</h3>
                    <div class="stat-value">
                        <span id="totalCallsAgain">0</span>

                    </div>
                </div>
                <div class="stat-box new-employees">
                    <h3>Hold Time</h3>
                    <div class="stat-value">
                        <span id="holdTime">--:--:--</span>

                    </div>
                </div>
            </div>

            <div class="main-content">
                <div class="chart-box">
                    <h3>Total Call Count</h3>
                    <canvas id="trafficChart"></canvas>
                </div>

                <div class="income-box" style="position: relative;">
                    <h3 style="position: absolute; top: 15px; left: 10px; font-size: 20px;">Daily Target Achieve</h3>
                    <div class="income-circle">
                        <svg width="150" height="150">
                            <circle class="background" cx="75" cy="75" r="70"></circle>
                            <circle class="progress" id="progressCircle" cx="75" cy="75" r="70"></circle>
                        </svg>
                        <div class="income-percentage">
                            <span id="TargetAchiveSpan" style="margin:5px;"></span>
                            <!-- ID for JavaScript access -->
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </form>
    <script src="package/dist/chart.umd.js"></script>
    <script src="package/dist/chart.js"></script>
   <%-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>--%>
    <script>
       

        function bindAgentStats(data) {
            // Bind the values from the stored procedure to the UI elements
            document.getElementById('tossTime').textContent = formatTime(data.TossTime); // Toss Time
            document.getElementById('aht').textContent = formatTime(data.AHT); // AHT
            document.getElementById('wrapTime').textContent = formatTime(data.WrapTime); // Wrap Time
            document.getElementById('totalCalls').textContent = data.TotalCalls; // Total Calls
            document.getElementById('inboundTalkTime').textContent = formatTime(data.InboundTalkTime); // Inbound Talk Time
            document.getElementById('outboundTalkTime').textContent = formatTime(data.OutboundTalkTime); // Outbound Talk Time
            document.getElementById('totalCallsAgain').textContent = data.TotalCalls; // Total Calls (for the second section)
            document.getElementById('holdTime').textContent = formatTime(data.HoldTime); // Hold Time
        }

        function formatTime(timeString) {
            // Check if the time string is in the format of "HH:mm:ss"
            if (timeString && timeString !== "00:00:00") {
                return timeString; // Return the formatted time
            }
            return "N/A"; // If time is "00:00:00", return "N/A"
        }
        const jsonStats = document.getElementById('<%= hiddenAgentStats.ClientID %>').value;
        const agentStats = JSON.parse(jsonStats);

        bindAgentStats(agentStats);
        const TotalCallLog = document.getElementById('<%=TotalCallgDashBoard.ClientID %>').value;
        const CallLog = JSON.parse(TotalCallLog);
        BindAPRDataToGraph(CallLog);


        function BindAPRDataToGraph(data) {
            //alert((data));
            // Extract dates and total calls from the CallLog data
            const dates = data.map(item => item.Date);
            const totalCalls = data.map(item => parseInt(item.Totalcalls)); // Convert Totalcalls to integers

            // Initialize the chart
            const ctx = document.getElementById('trafficChart').getContext('2d');
            const trafficChart = new Chart(ctx, {
                type: 'bar', // Bar chart type
                data: {
                    labels: dates, // Use dates as labels
                    datasets: [{
                        label: 'Total Calls', // Label for the dataset
                        data: totalCalls, // Use total calls as data
                        backgroundColor: '#007bff', // Bar color
                        borderWidth: 1 // Bar border width
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true, // Start y-axis at zero
                            title: {
                                display: true,
                                text: 'Total Calls' // Y-axis title
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Date' // X-axis title
                            }
                        }
                    },
                    responsive: true, // Make the chart responsive
                    plugins: {
                        legend: {
                            display: true // Show the legend
                        }
                    }
                }
            });
        }
    </script>
    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            // Get the value from the hidden field
            const TargetAchive = document.getElementById('<%=TargetAchive.ClientID %>').value;
        
            // Set the value in the span
            document.getElementById('TargetAchiveSpan').textContent = TargetAchive + '%'; // Display value with '%'
        
            // Calculate the stroke-dashoffset
            const progressCircle = document.getElementById('progressCircle');
            const radius = progressCircle.r.baseVal.value;
            const circumference = 2 * Math.PI * radius;

            // Set the stroke-dasharray and stroke-dashoffset
            progressCircle.style.strokeDasharray = circumference; // Set the full circumference
            const percentage = parseFloat(TargetAchive) / 100; // Convert to decimal
            const dashoffset = circumference - (percentage * circumference); // Calculate the offset
            progressCircle.style.strokeDashoffset = dashoffset; 
        });
    </script>
    <script src="lib/CRM.js"></script>
    <script src="assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <script src="assets/js/plugin/chart.js/chart.min.js"></script>
    <script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>
    <script src="assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="assets/js/plugin/datatables/datatables.min.js"></script>

    <script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>


    <script src="assets/js/kaiadmin.min.js"></script>
</body>
</html>
