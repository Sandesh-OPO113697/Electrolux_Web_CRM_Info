<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CRM.aspx.cs" Inherits="CRM" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>CTI</title>
    <meta
        content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
        name="viewport" />
    <link rel="icon"
        href="assets/img/1point1-small-logo.png"
        type="image/x-icon" />

    <!-- Fonts and icons -->
    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/CRM.js"></script>
    <script src="assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: { families: ["Public Sans:300,400,500,600,700"] },
            custom: {
                families: [
                  "Font Awesome 5 Solid",
                  "Font Awesome 5 Regular",
                  "Font Awesome 5 Brands",
                  "simple-line-icons",
                ],
                urls: ["assets/css/fonts.min.css"],
            },
            active: function () {
                sessionStorage.fonts = true;
            },
        });

    </script>

    <style>
        .marquee-wrapper {
            width: 100%;
            overflow: hidden;
            background-color: #f4f5f7; /* Background color */
            color: black; /* Text color */
            padding: 10px 0; /* Padding for visual spacing */
            height: 53px;
            font-family: Arial, sans-serif; /* Font style */
            font-size: 16px; /* Font size */
            position: relative; /* Position for absolute child elements */
        }

        .marquee-content {
            display: inline-block;
            white-space: nowrap;
            padding-left: 100%; /* Start the text off the screen */
            animation: marquee 80s linear infinite; /* Adjust timing for desired speed */
        }

        .icon-button {
            background-color: transparent; /* or your desired color */
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 24px; /* Adjust size */
        }

            .icon-button i {
                color: #4CAF50; /* Change to green for dial button */
            }

        #DissConnectButton i {
            color: red; /* Change to red for disconnect button */
        }

        .icon-button:hover {
            opacity: 0.8; /* Add some hover effect */
        }


        @keyframes marquee {
            0% {
                transform: translateX(100%); /* Start from right */
            }

            100% {
                transform: translateX(-100%); /* Move to left */
            }
        }
    </style>


    <!-- CSS Files -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/plugins.min.css" />
    <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />

</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="MarqueMassage" runat="server" />
                <div class="wrapper">

                    <div class="sidebar" data-background-color="dark" id="sidebar">
                        <div class="sidebar-logo">

                            <div class="logo-header" data-background-color="dark">
                                <asp:ImageButton ID="btnLogo" runat="server" src="assets/img/mainLogowhite.png" Style="margin-left: 30px;" OnClick="btnLogo_Click" Height="50" CssClass="navbar-brand" />
                            </div>
                        </div>
                        <div class="sidebar-wrapper scrollbar scrollbar-inner">
                            <div class="sidebar-content">
                                <ul class="nav nav-secondary">

                                    <li class="nav-section">
                                        <span class="sidebar-mini-icon">
                                            <i class="fa fa-ellipsis-h"></i>
                                        </span>
                                        <h4 class="text-section"></h4>

                                    </li>


                                    <li class="nav-item">
                                        <a data-bs-toggle="collapse" href="#base">
                                            <i class="fas fa-layer-group"></i>
                                            <p>Break</p>
                                            <span class="caret"></span>
                                        </a>
                                        <div class="collapse" id="base">
                                            <ul class="nav nav-collapse">
                                                <li>
                                                    <asp:DropDownList
                                                        ID="BrekDropdawonList"
                                                        CssClass="form-control"
                                                        runat="server"
                                                        AutoPostBack="True"
                                                        OnSelectedIndexChanged="BrekDropdawon"
                                                        Style="background-color: #24294a; color: white; border: 1px solid #ffffff; padding: 8px; width: 200px; margin-left: 50px; border-radius: 4px; font-size: 16px;">
                                                    </asp:DropDownList>
                                                </li>
                                                <li></li>
                                            </ul>
                                        </div>
                                    </li>

                                    <li class="nav-item">
                                        <a data-bs-toggle="collapse" href="#DialerCollapse">
                                            <i class="fas fa-th-list"></i>
                                            <p>Conference / Merge </p>
                                            <span class="caret"></span>
                                        </a>

                                        <!-- The div that will collapse -->
                                        <div class="collapse" id="DialerCollapse">
                                            <ul class="nav nav-collapse ">
                                                <li class="text-center d-flex justify-content-center align-items-center">

                                                    <asp:Button ID="ConforenceButton" Style="display: none; width: 90%; margin-bottom: 7px;" class="btn btn-light" runat="server" OnClick="ConfrenceButton1_Click" Text="conference" />

                                                </li>
                                                <li class="text-center d-flex justify-content-center align-items-center">

                                                    <asp:Button ID="MergeButton4" Style="display: none; width: 90%; margin-bottom: 7px;" class="btn btn-light" runat="server" Text="Merge" OnClick="MergeConforence" />

                                                </li>
                                                <li class="text-center d-flex justify-content-center align-items-center">

                                                    <asp:Button ID="PartyButton" Style="display: none; width: 90%; margin-bottom: 7px;" class="btn btn-light" runat="server" Text="Remove Conforence" OnClick="ConferenceDisConnect" />

                                                </li>
                                            </ul>
                                        </div>
                                    </li>


                                    <li class="nav-item">
                                        <a data-bs-toggle="collapse" href="#TransferCollapse">
                                            <i class="fas fa-exchange-alt"></i>
                                            <p>Transfer / Get Next</p>
                                            <span class="caret"></span>
                                        </a>


                                        <div class="collapse" id="TransferCollapse">
                                            <ul class="nav nav-collapse ">
                                                <li class="text-center d-flex justify-content-center align-items-center">

                                                    <asp:Button ID="GetNextButton" class="btn btn-light d-block my-2" runat="server" Text="Get Next" />

                                                </li>
                                                <li class="text-center d-flex justify-content-center align-items-center">

                                                    <asp:Button ID="TransferButton" class="btn btn-light d-block my-2" runat="server" Text="Transfer Call" />

                                                </li>
                                            </ul>
                                        </div>
                                    </li>



                                    <li class="nav-item">
                                        <a data-bs-toggle="collapse" href="#ReadyCollapse">
                                            <i class="fas fa-check-circle"></i>
                                            <p>Ready</p>
                                            <span class="caret"></span>
                                        </a>


                                        <div class="collapse" id="ReadyCollapse">
                                            <ul class="nav nav-collapse d-flex justify-content-center align-items-center">
                                                <li>
                                                    <asp:Button ID="ReadyButton" class="btn btn-light" Text="Ready" runat="server" OnClick="ReadyButton1_Click" />
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                    <li class="nav-item">
                                        <a data-bs-toggle="collapse" href="#HoldCollapse">
                                            <i class="fas fa-pause"></i>
                                            <p>Hold / UnHold</p>
                                            <span class="caret"></span>
                                        </a>


                                        <div class="collapse" id="HoldCollapse">
                                            <ul class="nav nav-collapse d-flex justify-content-center align-items-center">
                                                <li>
                                                    <asp:Button ID="HoldButton1" class="btn btn-light" runat="server" Text="Hold" OnClick="HoldButton1_Click" />
                                                </li>
                                            </ul>
                                        </div>
                                    </li>

                                    <li class="nav-item">
                                        <a data-bs-toggle="collapse" href="#forms">
                                            <i class="fas fa-pen-square"></i>
                                            <p>Forms</p>
                                            <span class="caret"></span>
                                        </a>
                                        <div class="collapse" id="forms">
                                            <ul class="nav nav-collapse">
                                                <li>
                                                    <a href="forms/forms.html">
                                                        <span class="sub-item">Scripts</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>



                                    <li class="nav-item">
                                        <a data-bs-toggle="collapse" href="#charts">
                                            <i class="far fa-chart-bar"></i>
                                            <p>APR</p>
                                            <span class="caret"></span>
                                        </a>
                                        <div class="collapse" id="charts">
                                            <ul class="nav nav-collapse">
                                                <li>
                                                    <a href="APR.aspx">
                                                        <span class="sub-item">APR Report</span>
                                                    </a>
                                                </li>

                                            </ul>
                                        </div>
                                    </li>

                                </ul>


                            </div>

                        </div>

                    </div>


                    <div class="main-panel">
                        <div class="main-header">
                            <div class="main-header-logo">
                                <!-- Logo Header -->
                                <div class="logo-header" data-background-color="dark">
                                    <a href="index.html" class="logo">
                                        <img src="assets/img/mainLogowhite.png"
                                            alt="navbar brand"
                                            class="navbar-brand"
                                            height="50" />
                                    </a>

                                </div>

                            </div>

                            <nav class="navbar navbar-header navbar-header-transparent navbar-expand-lg  border-bottom " style="background-color: #f4f5f7;">
                                <div class="container-fluid">
                                    <nav class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <button type="submit" class="btn btn-search pe-1">
                                                    <i class="fa fa-mobile-alt search-icon"></i>
                                                </button>
                                            </div>

                                            <asp:TextBox ID="TextPhoneNumber" runat="server" class="form-control" Placeholder="Enter Mobile Number" aria-label="Search"></asp:TextBox>
                                        </div>

                                        
                                        <asp:LinkButton ID="CallButton" runat="server" class="icon-button" Text="Dial" OnClick="CallButton_Click" style="margin-left:30px;"  ToolTip="Dial">  <i class="fas fa-phone"></i></asp:LinkButton>

                                        
                        
                                        <asp:LinkButton ID="DissConnectButton"  class="icon-button" Text="DissConnect" runat="server" OnClientClick="return confirmDisconnect();" OnClick="CallDissConnectButton_Click"  ToolTip="Diss-Connect"><i class="fas fa-phone-slash"></i></asp:LinkButton>


                                        
                                    </nav>
                                    <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                                        <li class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none">
                                            <a class="nav-link dropdown-toggle"
                                                data-bs-toggle="dropdown"
                                                href="#"
                                                role="button"
                                                aria-expanded="false"
                                                aria-haspopup="true">
                                                <i class="fa fa-search"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-search animated fadeIn">
                                            </ul>
                                        </li>

                                        <li class="nav-item topbar-icon dropdown hidden-caret">
                                            <a class="nav-link dropdown-toggle"
                                                href="#"
                                                id="notifDropdown"
                                                role="button"
                                                data-bs-toggle="dropdown"
                                                aria-haspopup="true"
                                                aria-expanded="false">
                                                <i class="fa fa-bell"></i>
                                                <span class="notification">4</span>
                                            </a>
                                            <ul class="dropdown-menu notif-box animated fadeIn"
                                                aria-labelledby="notifDropdown">
                                                <li>
                                                    <div class="dropdown-title">
                                                        Agent CTI Other Information
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="notif-scroll scrollbar-outer">
                                                        <div class="notif-center">

                                                            <a href="#">
                                                                <div class="notif-icon notif-primary">
                                                                    <i class="fa fa-compass"></i>
                                                                </div>
                                                                <div class="notif-content">
                                                                    <span class="block">
                                                                        <label style="font-weight: 600">Campaign : </label>
                                                                    </span>
                                                                    <span class="time">
                                                                        <asp:Label runat="server" ID="lblCampaign"> </asp:Label></span>
                                                                </div>
                                                            </a>
                                                            <a href="#">
                                                                <div class="notif-icon notif-primary">
                                                                    <i class="fa fa-arrows-alt"></i>
                                                                </div>
                                                                <div class="notif-content">
                                                                    <span class="block">
                                                                        <label style="font-weight: 600">Campaign Mode : </label>
                                                                    </span>
                                                                    <span class="time">
                                                                        <asp:Label runat="server" ID="lblCampaignMode"> </asp:Label></span>
                                                                </div>
                                                            </a>


                                                            <a href="#">
                                                                <div class="notif-icon notif-primary">
                                                                    <i class="fa fa-code"></i>
                                                                </div>
                                                                <div class="notif-content">
                                                                    <span class="block">
                                                                        <label style="font-weight: 600">Mycode : </label>
                                                                    </span>
                                                                    <span class="time">
                                                                        <asp:Label ID="MyCode" runat="server"> </asp:Label></span>
                                                                </div>
                                                            </a>
                                                            <a href="#">
                                                                <div class="notif-icon notif-primary">
                                                                    <i class="fa fa-th-list"></i>
                                                                </div>
                                                                <div class="notif-content">
                                                                    <span class="block">
                                                                        <label style="font-weight: 600">BatchID : </label>
                                                                    </span>
                                                                    <span class="time">
                                                                        <asp:Label runat="server" ID="lblbatchId"> </asp:Label></span>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </li>

                                            </ul>
                                        </li>

                                        <li class="nav-item topbar-user dropdown hidden-caret">
                                            <a class="dropdown-toggle profile-pic"
                                                data-bs-toggle="dropdown"
                                                href="#"
                                                aria-expanded="false">
                                                <div class="avatar-sm">

                                                    <i class="fas fa-user" style="font-size: 24px; color: #495057; margin-top: 6px;"></i>
                                                </div>
                                                <span class="profile-username" style="color: white">

                                                    <span class="fw-bold" style="color: black;">
                                                        <asp:Label runat="server" ID="UserName"> </asp:Label></span>
                                                </span>
                                            </a>


                                            <ul class="dropdown-menu dropdown-user animated fadeIn">
                                                <div class="dropdown-user-scroll scrollbar-outer">
                                                    <li>
                                                        <div class="user-box">
                                                            <div class="avatar-lg">
                                                                <img src="assets/img/user.png"
                                                                    alt="image profile"
                                                                    class="avatar-img rounded-circle" />

                                                            </div>
                                                            <div class="u-text">

                                                                <p class="text-muted">Have a good day ahead.</p>
                                                                <asp:Button ID="LogOutButton5" runat="server" Style="width: 90px; height: 40px; font-size: 16px; margin-left: 20px; cursor: pointer;" CssClass="btn btn-info" Text="Log Out" OnClick="LogOutButton1_Click" OnClientClick="return confirmLogOut();" />
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="d-flex">

                                                        <div class="dropdown-divider" style="justify-content: center; align-content: center;"></div>


                                                    </li>
                                                </div>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                            <!-- End Navbar -->
                        </div>

                        <div class="container">
                            <div style="height: 540px;">
                                <iframe  id="dynamicIframe" style="height: 100%; width: 100%;"></iframe>
                            </div>
                            <div class="marquee-wrapper">
                                <div class="marquee-content">
                                    <span style="padding-left: 50px;"></span>
                                    <span id="MarkPannel"></span>
                                    <!-- Repeated text for seamless effect -->
                                    <span id="MarkPannel1"></span>
                                </div>
                            </div>
                        </div>




                        <footer class="footer" style="background-color: #f4f5f7;">

                            <div class="container-fluid d-flex justify-content-between">
                                <div class="notif-content">
                                    <i class="fa fa-phone"></i>&nbsp;&nbsp;&nbsp;<span class="block"><label style="font-weight: 600">Phone Number : </label>
                                    </span>
                                    <span class="time">
                                        <asp:Label runat="server" ID="lblPhoneNumber"></asp:Label></span>
                                </div>
                                <div class="notif-content">
                                    <i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp;<span class="block"><label style="font-weight: 600">Agent Name : </label>
                                    </span>
                                    <span class="time">
                                        <asp:Label runat="server" ID="lblAgentName"> </asp:Label></span>
                                </div>


                                <div class="notif-content">
                                    <i class="fa fa-info-circle">&nbsp;&nbsp;&nbsp;</i><span class="block"><label style="font-weight: 600">Current Status : </label>
                                    </span>
                                    <span class="time">
                                        <asp:Label runat="server" ID="lblCurrentStatus"> </asp:Label></span>
                                </div>


                                <div class="notif-content">
                                    <i class="fa fa-info-circle">&nbsp;&nbsp;&nbsp;</i><span class="block"><label style="font-weight: 600">Event Status : </label>
                                    </span>
                                    <span class="time">
                                        <asp:Label runat="server" ID="lblEventStatus"> </asp:Label></span>
                                </div>

                            </div>
                        </footer>
                    </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <!--   Core JS Files   -->
    <script src="lib/jquery-3.6.4.min.js"></script>
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
    <script src="lib/CRM.js"></script>

    <script>
        const TargetAchive = document.getElementById('<%=MarqueMassage.ClientID %>').value;

        // Set the value in the span
        document.getElementById('MarkPannel1').textContent = TargetAchive;
        //document.getElementById('MarkPannel').textContent = TargetAchive;
    </script>

</body>
</html>
