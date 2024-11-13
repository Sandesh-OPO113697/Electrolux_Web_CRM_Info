<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

<%--<!DOCTYPE html>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <meta charset="UTF-8">
    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/LogIn.js"></script>
    <script src="lib/jquery-3.6.4.min.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.min.js"></script>
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.css" rel="stylesheet" />


    <style>
        .blue-button,
        .btn.btn-info {
            width: 100%;
            margin: 0 auto;
            background-color: #00a59e; /* Navy blue color */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            text-align: center;
        }

            .blue-button:hover,
            .btn.btn-info:hover {
                background-color: #00a59e;
            }
           
    </style>
</head>
<body>
    <link href="lib/bootstrap-5.3.2-dist/css/bootstrap.min.css" rel="stylesheet" />

    <section class="p-3 p-md-4 p-xl-5">
        <br />
        <div class="container">
            <div class="card border-dark-subtle shadow-xl" style="box-shadow: 0px 4px 8px rgba(0, 0, 0.5, 0.5);">
                <div class="row g-0">
                    <div class="col-12 col-md-6">
                        <script src="lib/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
                        <script src="lib/bootstrap-5.3.2-dist/js/bootstrap.min.js"></script>
                        <img class="img-fluid rounded-start w-100 h-100 object-fit-cover"  src="Images/callcenter.jpg">
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="card-body p-3 p-md-4 p-xl-5">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-5">
                                        <h3>Log in</h3>
                                    </div>
                                </div>
                            </div>
                            <form method="post" runat="server">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                                
                                <div class="row gy-3 gy-md-4 overflow-hidden">
                                    <div class="col-12">

                                        <label for="email" class="form-label">User Name <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtUserName" style="border:solid gray 1px;" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label for="password" id="lblPassword" runat="server" class="form-label"> <span class="text-danger">*</span></asp:Label>
                                        <asp:TextBox ID="txtPassword" style="border:solid gray 1px;" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <label for="password" ID="lblNewPassword" runat="server" class="form-label">New Password <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtNewPassword" style="border:solid gray 1px;" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="LabelErr" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" ForeColor="Red" Visible="true"></asp:Label>
                                    </div>
                                    <div class="col-12">

                                        <div class="col-12">
                                            <div class="d-grid">
                                              <asp:HyperLink ID="launchLink" runat="server"  CssClass="blue-button" onclick="return NavigateThenCheckEXE()">Launch</asp:HyperLink>

                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn-info" ValidationGroup="Login"
                                                    OnClick="lnkSubmit_ClickOn" Style="width: 100%; visibility:hidden;   margin: 0 auto;">Login</asp:LinkButton>

                                                <asp:LinkButton ID="ChangePassword" runat="server" CssClass="btn btn-info" ValidationGroup="Change"
                                                    OnClick="lblChangePassword" Style="width: 100%;   margin: 0 auto;">Change Password</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/LogIn.js"></script>
</body>
</html>--%>



<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/LogIn.js"></script>
    <script src="lib/jquery-3.6.4.min.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.min.js"></script>
    <script src="lib/bootstrap-5.3.2/dist/js/bootstrap.js"></script>
    <link href="lib/bootstrap-5.3.2/dist/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/login.css" rel="stylesheet">
    <link href="assets/css/login.css" rel="stylesheet">

    <script src="lib/jquery-3.6.4.min.js"></script>
    <script src="lib/LogIn.js"></script>
    <title>Login</title>
</head>
<body>
    <div class="auth-fluid">
        <!-- Auth fluid right content -->
        <div class="auth-fluid-right text-center d-flex align-items-center d-none d-md-block">
            <div class="auth-user-testimonial">
                <div class="auth-brand text-center text-lg-start">
                    <div class="auth-brand text-center d-flex flex-column">
                       <%-- <a href="index.html" class="logo logo-dark text-center">
                            <span class="logo-lg">
                                <img src="assets/img/mainLogo.png" alt="Logo" title="One Dialer Logo">
                            </span>
                        </a>--%>
                        <span class="logo-lg">
                                <img src="assets/img/mainLogo.png" alt="Logo" title="One Dialer Logo">
                            </span>
                        <img src="assets/img/login-main.jpg" alt="Logo" title="One Dialer Logo" class="img-fluid w-75 text-center mx-auto my-2">
                    </div>
                </div>
            </div>
            <!-- end auth-user-testimonial-->
        </div>

        <div class="auth-fluid-form-box">
            <div class="align-items-center d-flex h-100 justify-content-center">
                <div class="p-2 w-400">
                    <!-- title-->
                    <div class="text-center">

                        <img src="assets/img/mainLogowhite.png" class="d-md-none mx-auto w-50 p-2 mb-4">
                        <h1 class="mt-0 text-white">AGENT</h1>
                        <p class="mb-5 text-white welcome">Welcome Back!</p>
                    </div>
                    <!-- form -->
                    <form method="post" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                        <div class="row gy-3 gy-md-4 overflow-hidden">
                            <div class="col-12">

                                <asp:Label for="email"  ID="lblUsername" class="form-label" runat="server" style="color: white; visibility: hidden; font-size: 20px;">User Name <span class="text-danger">*</span></asp:Label>
                                <asp:TextBox ID="txtUserName" Style="border: solid gray 1px;visibility: hidden;" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <asp:Label for="password" ID="lblPassword" Style="color: white;visibility: hidden; font-size: 20px;" runat="server" class="form-label"> <span class="text-danger">*</span></asp:Label>
                                <asp:TextBox ID="txtPassword" Style="border: solid gray 1px;visibility: hidden;" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <label for="password" id="lblNewPassword" runat="server" class="form-label">New Password <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtNewPassword" Style="border: solid gray 1px;" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <asp:Label ID="LabelErr" Style="color: white; font-size: 20px;" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" Visible="true"></asp:Label>
                            </div>
                            <div class="text-center">
                                 <asp:HyperLink ID="launchSIP" runat="server"  Style="visibility: hidden;"  class="btn btn-primary grey-bg font-18" Width="50%" onclick="SIPURLLogin()"> SIP </asp:HyperLink>
                                <asp:HyperLink ID="launchLink" runat="server"  class="btn btn-primary grey-bg font-18" Width="50%"  onclick="return NavigateThenCheckEXE()"> CRM</asp:HyperLink>
                                <asp:LinkButton ID="lnkSubmit" runat="server" class="btn btn-primary grey-bg font-18" Width="50%" ValidationGroup="Login"
                                    OnClick="lnkSubmit_ClickOn" Style="visibility: hidden; margin: 0 auto;">Login</asp:LinkButton>

                                <asp:LinkButton ID="ChangePassword" class="btn btn-primary grey-bg font-18" runat="server" ValidationGroup="Change"
                                    OnClick="lblChangePassword">Change Password</asp:LinkButton>
                            </div>

                        </div>
                    </form>

                    <footer class="bottomstrip text-white text-center">
                    </footer>
                </div>

            </div>

        </div>

    </div>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
