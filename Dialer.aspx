<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dialer.aspx.cs" Inherits="Dialer" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>1 Point 1 | One Dialer</title>
    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/Dialer.js"></script>
    <link href="../assets/css/material-icons.css" rel="stylesheet">
    <link rel="shortcut icon" href="assets/img/favicon.ico">
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/animate.css">
    <link rel="stylesheet" href="../assets/css/bootstrap-multiselect.css">
    <link href="../assets/css/daterangepicker.min.css" rel="stylesheet">
    <link href="../assets/css/onedialer.css" rel="stylesheet">
    <link href="../assets/css/dashboard.css" rel="stylesheet">
    <link href="../assets/css/responsive.css" rel="stylesheet">
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/css/darkTheme.css" rel="stylesheet">
    <link href="../assets/css/agent.css" rel="stylesheet">
    <link href="../assets/css/agentdarkTheme.css" rel="stylesheet">
    <script src="lib/jquery-3.6.4.min.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.min.js"></script>
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.css" rel="stylesheet" />
</head>
<body class="">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <nav class="navbar navbar-expand-lg navbar-light bg-white">
                    <div class="container-fluid">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                 <asp:TextBox ID="TextPhoneNumber" runat="server" CssClass="form-control" Style="width: 300px; height: 40px; border: solid 1px; border-radius: 5px;" Placeholder="Enter Mobile Number"></asp:TextBox>


                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <div class="topBarContent w-100 d-flex align-items-center justify-content-end">

                                <div class="d-flex position-relative searchForm">
                                </div>
                                <div class="weekDayTimeMainDiv adjust_ltrt">
                                    <span class="weekDayText"><b id="weekDay"></b>, </span>
                                    <span class="dateText" id="date"></span>, 
   
                        <span class="yearText" id="year"></span>
                                </div>
                                <div class="timeMainDiv d-flex align-items-center adjust_ltrt">
                                    <span class="material-icons material-symbols-outlined">schedule</span>
                                    <span class="timeText ms-2" id="time"></span>
                                </div>
                                <div class="notificationMainDiv position-relative adjust_ltrt">
                                     <div class="notificationMainDiv position-relative adjust_ltrt">
                                                <div class="dropdown-container">
                                                    <!-- Image Button -->
                                                    <asp:ImageButton ID="BreakButton" Style="width: 30px;" runat="server" ImageUrl="~/Images/Break.png" title="Break" OnClientClick="toggleDropdown(); return false;" />

                                                    <!-- Dropdown Content (Initially hidden) -->
                                                    <div class="dropdown-content" style="display: none;" id="dropdownContent">
                                                        <asp:DropDownList ID="BrekDropdawonList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BrekDropdawon" onchange="hideDropdown();">
                                                            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                            <asp:ListItem Text="Tea" Value="Tea"></asp:ListItem>
                                                            <asp:ListItem Text="Lunch" Value="Lunch"></asp:ListItem>
                                                            <asp:ListItem Text="Training" Value="Training"></asp:ListItem>
                                                            <asp:ListItem Text="Quality" Value="Quality"></asp:ListItem>
                                                            <asp:ListItem Text="VatBreak" Value="VatBreak"></asp:ListItem>
                                                            <asp:ListItem Text="Bio Break" Value="Bio Break"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                </div>
                                <div id="darkcolorMode" class="darkModeMainDiv adjust_ltrt">
                                    <span class="material-icons material-symbols-outlined">dark_mode</span>
                                </div>
                                <div class="loginMainDiv position-relative">
                                    <span class="user-name me-2">
                                        <asp:Label runat="server" ID="lblAgentName"> </asp:Label></span>
                                    <img src="../assets/img/favicon.ico" alt="">
                                    <span class="dropdownArrow material-icons material-symbols-outlined" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">keyboard_arrow_down</span>
                                    <ul class="dropdown-menu dropdown-menu-start m-0 p-0" aria-labelledby="dropdownMenuButton1">

                                        <li>

                                            <asp:ImageButton ID="LogOutButton5" Style="width: 40px; height: 40px;" runat="server" ImageUrl="~/Images/LogOut.png" OnClick="LogOutButton1_Click" OnClientClick="return confirmLogOut();" title="LogOut" />


                                        </li>
                                        <li></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>



                <div class="container-fluid">
                    <div class="row">
                        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse white_bg" style="width: 60px;">
                            <div>
                                <img src="../assets/img/mainLogo.png" class="mainlogoicon hide" />
                                <img src="../assets/img/1point1-small-logo.png" class="mobileLogo" />
                            </div>
                            <br />
                            <div class="card bg-light col-md-3 col-lg-2 d-md-block" id="CTIPannel" style="width: auto; background-color: blue; margin: auto;">
                                <div class="position-sticky pt-9">

                                    <ul class="nav flex-column">
                                      <br />
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="CallButton" Style="width: 30px;" runat="server" ImageUrl="~/Images/phone-call.png" OnClick="CallButton_Click" title="Dial" />
                                        </li>
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="DissConnectButton" Style="width: 30px;" runat="server" ImageUrl="~/Images/dissconnect.png" OnClientClick="return confirmDisconnect();" OnClick="CallDissConnectButton_Click" title="DissConnect" />
                                        </li>
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="HoldButton1" Style="width: 30px;" runat="server" ImageUrl="~/Images/HoldNewsm.png" OnClick="HoldButton1_Click" title="Hold Call" />
                                        </li>
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="GetNextButton" Style="width: 30px;" runat="server" ImageUrl="~/Images/next.png" title="Get Next" />
                                        </li>
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="TransferButton" Style="width: 30px;" runat="server" ImageUrl="~/Images/transfer_new (2).png" title="Transfer Call" />
                                        </li>
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="ReadyButton" Style="width: 30px;" runat="server" ImageUrl="~/Images/Ready11.png" OnClick="ReadyButton1_Click" title="Ready" />
                                        </li>

                                        <li>
                                           
                                        </li>
                                        
                                        <li class="nav-item ">
                                            <asp:ImageButton ID="ConforenceButton" Style="display: none; width: 30px;" runat="server" ImageUrl="~/Images/Conforence.png" OnClick="ConfrenceButton1_Click" title="Conforence Call" />
                                        </li>
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="PartyButton" Style="display: none; width: 30px;" runat="server" ImageUrl="~/Images/phone.png" OnClick="ConferenceDisConnect" title="Party Delete" />
                                        </li>
                                        <li class="nav-item mx-auto">
                                            <asp:ImageButton ID="MergeButton4" Style="display: none; width: 30px;" runat="server" ImageUrl="~/Images/Merge3.png" OnClick="MergeConforence" title="Merge" />
                                        </li>




                                    </ul>
                                </div>
                            </div>
                            <div class="position-fixed bottom-0 end-0 p-3 Statuscontent" style="z-index: 11; top: 110px; left: 1274px; display: none; width: 250px">
                                <button type="button" class="btn btn-secondary btn-sm Spantoast rounded-circle" data-bs-dismiss="Sapn-toast-body"><span class="material-icons material-symbols-outlined">close</span></button>
                                <div id="SpanStatus" class="Span_toast" role="alert" aria-live="assertive" aria-atomic="true" style="display: none; padding: 15px;">
                                    <div class="card" style="background-color: #DEE0E5; border: none;">
                                        <div class="card-body">
                                            <div class="column">
                                                <div class="styled-div">
                                                    PhoneNumber     
                                                </div>
                                                <div class="styled-div">
                                                    Current Status 
                                                </div>
                                            </div>
                                            <div class="column">
                                                <div class="styled-div">
                                                    Agent Name 
                                                </div>
                                                <div class="styled-div">
                                                    Event Satus 
                    <asp:Label runat="server" ID="lblEventStatus"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="column">
                                                <div class="styled-div">
                                                    Campaign 
                    <asp:Label runat="server" ID="lblCampaign"> </asp:Label>
                                                </div>
                                                <div class="styled-div">
                                                    MyCode 
                    <asp:Label ID="MyCode" runat="server"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="column">
                                                <div class="styled-div">
                                                    Campaign Mode  
                    <asp:Label runat="server" ID="lblCampaignMode"> </asp:Label>
                                                </div>
                                                <div class="styled-div">
                                                    Batch ID  
                    <asp:Label runat="server" ID="lblbatchId"> </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </nav>
                        <main class="mainSection" id="mainSection" style="padding-left: 90px; margin-top: -65px;">
                  <div class="row">
                     <div class="d-flex align-items-center">
                                <p class="me-auto status-text">
                                    <strong class="text-secondary">AGENT STATUS: </strong>
                                    <span class="text-primary px-2 mainsectext">
                                        <asp:Label runat="server" ID="Label1"> </asp:Label>
                                    </span>
                                </p>
    
                                <span class="text-primary px-2 mainsectext">
                                    <asp:Label runat="server" ID="lblPhoneNumber"></asp:Label>
                                </span>
    
                                <span class="text-primary px-2 mainsectext">
                                    <asp:Label runat="server" ID="lblCurrentStatus" Text="Current Status"></asp:Label> <!-- Optional: Add text -->
                                </span>
    
                                <button type="button" class="primaryBg d-flex align-items-center text-uppercase text-white status_bg mx-2 p-2 rounded" id="StatusSpan" style="border: 2px solid white;">
                                    <span class="material-icons material-symbols-outlined me-2">circle</span> Status
                                </button>
                            </div>

                     <div class="main-content mt-2 bgmaintheme">
                        <!-- Tab-->
                        <div class="nav nav-tabs mb-2" id="nav-tab" role="tablist">
                          <iframe src="http://localhost:55075/Info_OUT.aspx" width="100%" height="400" frameborder="0"></iframe>
                        </div>
                        <d
                     </div>
                  </div>
            
            </main>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/highcharts.js"></script>
    <script src="../assets/js/highcharts-accessibility.js"></script>
    <script src="../assets/js/datatables.min.js"></script>
    <script src="../assets/js/datatables-fixedcolumns.min.js"></script>
    <script src="../assets/js/fixedcolumns-datatables.min.js"></script>
    <script src="../assets/js/moment.min.js"></script>
    <script src="../assets/js/daterangepicker.min.js"></script>
    <script src="../assets/js/bootstrap-multiselect.js"></script>
    <script src="../assets/js/agent.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {


            $('input[name="startdatetime"]').daterangepicker({
                timePicker: true,
                singleDatePicker: true,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'DD/MM/YYYY hh:mm A'
                }
            });

            $('input[name="enddatetime"]').daterangepicker({
                timePicker: true,
                singleDatePicker: true,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'DD/MM/YYYY hh:mm A'
                }
            });

            // Multiselect Dropdown Initialize JS code
            $('.multiselect').multiselect({
                includeSelectAllOption: true,
                enableFiltering: true,
            });

        });
</script>
    <script>
        // Function to format numbers to two digits
        function formatNumber(num) {
            return num < 10 ? '0' + num : num;
        }

        // Get current date and time
        const now = new Date();
        const weekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        const weekDay = weekDays[now.getDay()];
        const date = formatNumber(now.getDate());
        const month = formatNumber(now.getMonth() + 1); // Months are 0-indexed
        const year = now.getFullYear();
        const hours = formatNumber(now.getHours());
        const minutes = formatNumber(now.getMinutes());
        const seconds = formatNumber(now.getSeconds());

        // Update HTML content
        document.getElementById('weekDay').textContent = weekDay;
        document.getElementById('date').textContent = month + ' ' + date;
        document.getElementById('year').textContent = year;
        document.getElementById('time').textContent = hours + ' : ' + minutes + ' : ' + seconds;


        $('#StatusSpan,.Spantoast').click(function () {
            $('.Statuscontent').toggle();
            $('#SpanStatus').toggle();
        });

</script>
    <script type="text/javascript">
        function toggleDropdown() {
            var dropdown = document.getElementById("dropdownContent");
            if (dropdown.style.display === "none") {
                dropdown.style.display = "block";
            } else {
                dropdown.style.display = "none";
            }
        }

        function hideDropdown() {
            var dropdown = document.getElementById("dropdownContent");
            dropdown.style.display = "none"; // Hide the dropdown after selection
        }
</script>
</body>
</html>
