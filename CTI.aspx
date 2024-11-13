<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CTI.aspx.cs" Inherits="CTI" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/CTI.js"></script>
    <script src="lib/jquery-3.6.4.min.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.min.js"></script>
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.css" rel="stylesheet" />


    <style>
        .navbar-scroll .nav-link,
        .navbar-scroll .navbar-toggler-icon,
        .navbar-scroll .navbar-brand {
            color: #262626;
        }


        .navbar-scroll {
            background-color: #FFC017;
        }

            .navbar-scrolled .nav-link,
            .navbar-scrolled .navbar-toggler-icon,
            .navbar-scroll .navbar-brand {
                color: #262626;
            }

        .navbar-scrolled {
            background-color: #000000;
        }

        .navbar.navbar-scroll.navbar-scrolled {
            padding-top: auto;
            padding-bottom: auto;
        }

        .navbar-brand {
            font-size: unset;
            height: 3.5rem;
        }

        .Icon {
            width: 40px;
            height: 40px;
        }



        .nav-item {
            width: 80%;
        }

        .navbar-custom {
            background-color: #EBEBEB !important;
        }

        .row {
            display: flex;
        }


        .column {
            flex: 25%;
            padding: 10px;
        }

        .styled-div {
            font-family: 'Times New Roman', Times, serif;
            /*font-style: oblique;
            font-weight: bold;*/
            color: #1C2BB7;
        }

        .column div {
            padding: 3px;
            text-align: center;
        }

        .dropdown-container {
            display: inline-block;
            position: relative;
            margin: 10px;
            font-family: Arial, sans-serif;
        }

        .Icon {
            border: none;
            cursor: pointer;
            outline: none;
        }

        .dropdown-container {
            display: inline-block;
            position: relative;
            margin: 10px;
            font-family: 'Times New Roman', Times, serif;
        }

        .Icon {
            border: none;
            cursor: pointer;
            outline: none;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
            z-index: 1;
            border-radius: 5px;
            font-family: 'Times New Roman', Times, serif;
        }

        .dropdown-container:hover .dropdown-content {
            display: block;
        }

        .dropdown-content .aspNetDisabled {
            background-color: #e9e9e9;
            color: #999;
        }

            .dropdown-content .aspNetDisabled:hover {
                background-color: #e9e9e9;
                color: #999;
                cursor: not-allowed;
            }

            .dropdown-content .aspNetDisabled::placeholder {
                color: #999;
            }

            .dropdown-content .aspNetDisabled::selection {
                background: transparent;
            }

      

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <nav class="navbar navbar-expand-lg navbar-custom fixed-top">
                        <div class="container" style="height: 60px;">
                            <a class="navbar-brand" href="#"><i class="fab fa-linkedin fa-2x"></i></a>
                            <asp:TextBox ID="TextPhoneNumber" runat="server" CssClass="form-control" Style="width: 300px;" Placeholder="Enter Mobile Number" aria-label="Search"></asp:TextBox>
                            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                                aria-label="Toggle navigation">
                                <i class="fas fa-bars"></i>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ms-auto mb-6 xl-lg-0 navbar-nav-big" style="padding-top: 5px; width: 40%;">
                                    <li class="nav-item">
                                        <asp:ImageButton ID="CallButton" class="Icon" runat="server" ImageUrl="~/Images/phone-call.png" OnClick="CallButton_Click" title="Dial" />
                                    </li>
                                    <li class="nav-item">
                                        <asp:ImageButton ID="DissConnectButton" class="Icon" runat="server" ImageUrl="~/Images/dissconnect.png" OnClientClick="return confirmDisconnect();" OnClick="CallDissConnectButton_Click" title="DissConnect" />
                                    </li>
                                    <li class="nav-item">
                                        <asp:ImageButton ID="GetNextButton" class="Icon" runat="server" ImageUrl="~/Images/next.png" title="Get Next" />
                                    </li>
                                    <li class="nav-item">
                                        <asp:ImageButton ID="TransferButton" class="Icon" runat="server" ImageUrl="~/Images/transfer.png" title="Transfer Call" />
                                    </li>
                                    <li class="nav-item">
                                        <asp:ImageButton ID="ReadyButton" class="Icon" runat="server" ImageUrl="~/Images/Ready11.png" OnClick="ReadyButton1_Click" title="Ready" />
                                    </li>
                                    <li class="nav-item">
                                        <%--<asp:ImageButton ID="BreakButton" class="Icon" runat="server" ImageUrl="~/Images/Break.png" OnClick="Break_Button" title="Break" />--%>
                                        <div class="dropdown-container">
                                            <asp:ImageButton ID="BreakButton" class="Icon" runat="server" ImageUrl="~/Images/Break.png" title="Break" />
                                            <div class="dropdown-content">
                                                <asp:DropDownList ID="BrekDropdawonList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BrekDropdawon">
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

                                    </li>

                                </ul>
                                <ul class="navbar-nav  mb-6 xl-lg-0 navbar-nav-big" style="padding-top: 5px; width: 40%;">
                                    <li class="nav-item">
                                        <asp:ImageButton ID="HoldButton1" class="Icon" runat="server" ImageUrl="~/Images/Hold.png" OnClick="HoldButton1_Click" title="Hold Call" />
                                    </li>
                                    <li class="nav-item">
                                        <asp:ImageButton ID="ConforenceButton" Style="display: none;" class="Icon" runat="server" ImageUrl="~/Images/Conforence.png" OnClick="ConfrenceButton1_Click" title="Conforence Call" />
                                    </li>
                                    <li class="nav-item">
                                        <asp:ImageButton ID="PartyButton" Style="display: none;" class="Icon" runat="server" ImageUrl="~/Images/phone.png" OnClick="ConferenceDisConnect" title="Party Delete" />
                                    </li>
                                    <li class="nav-item">
                                        <asp:ImageButton ID="MergeButton4" Style="display: none;" class="Icon" runat="server" ImageUrl="~/Images/Merge3.png" OnClick="MergeConforence" title="Merge" />
                                    </li>


                                    <li class="nav-item">
                                        <asp:ImageButton ID="LogOutButton5" Style="width: 40px; height: 40px;" runat="server" ImageUrl="~/Images/LogOut.png" OnClick="LogOutButton1_Click" OnClientClick="return confirmLogOut();" title="LogOut" />
                                    </li>
                                   
                                    <li class="nav-item">
                                        <asp:ImageButton ID="ImageButton7" class="Icon" runat="server" ImageUrl="~/Images/Candidate.png" />
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </nav>
                </div>


                <div class="row" style="padding-top: 60px; background-color: #EBEBEB">
                    <div class="column">
                        <div class="styled-div">
                            PhoneNumber     
                    <asp:Label runat="server" ID="lblPhoneNumber"></asp:Label>
                        </div>
                        <div class="styled-div">
                            Current Status 
                    <asp:Label runat="server" ID="lblCurrentStatus"> </asp:Label>
                        </div>
                    </div>
                    <div class="column">
                        <div class="styled-div">
                            Agent Name 
                    <asp:Label runat="server" ID="lblAgentName"> </asp:Label>
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
                <iframe id="dynamicIframe" runat="server" style="height: 800px; width: 100%;"></iframe>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/CTI.js"></script>

</body>
</html>
