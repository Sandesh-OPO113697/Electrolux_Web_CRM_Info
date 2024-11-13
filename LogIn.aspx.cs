using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogIn : System.Web.UI.Page
{
    [DllImport("ADVAPI32.dll", EntryPoint =
   "LogonUserW", SetLastError = true, CharSet = CharSet.Auto)]
    public static extern bool LogonUser(string lpszUsername,
   string lpszDomain, string lpszPassword, int dwLogonType,
   int dwLogonProvider, ref IntPtr phToken);
    public string IsError = "";
    public static string EmpCode=string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblNewPassword.Visible = false;
            txtNewPassword.Visible = false;
            ChangePassword.Visible = false;
            lblPassword.Text = "Password";
            try
            {
                string Responce = Socketprogramming("KillEXE,KillEXE,KillEXE");
                if (Responce == "Exe Has Been Killed")
                {
                    LabelErr.Text = "Exe Has Been Killed";
                    lnkSubmit.Visible = true;
                    launchLink.Visible = true;
                }
                else
                {
                    LabelErr.Text = "Exe Is Not Running";
                       
                }
            }
            catch (Exception ex)
            {
                LabelErr.Text = ex.Message;
               
            }

        }
    }

    protected void lblChangePassword(object sender, EventArgs e)
    {
        if (txtUserName.Text.Trim() == "")
        {
            LabelErr.Text = "Please Enter OPO ID...";
            return;
        }
        if (txtPassword.Text.Trim() == "")
        {
           LabelErr.Text="Please enter Old password...";
            return;
        }

        if (txtPassword.Text.Trim() == "" || txtNewPassword.Text.Trim() == "")
        {
            LabelErr.Text="Please enter New and Confirm password...";
            return;
        }
       bool ChangePasswordStatus= changeDomainPassword();
        if(ChangePasswordStatus==true)
        {
            lblNewPassword.Visible = false;
            txtNewPassword.Visible = false;
            ChangePassword.Visible = false;
            lnkSubmit.Visible = true;
            launchLink.Visible = true;
            lblPassword.Text = "Password";
            LabelErr.Text = "Password Update SucessFylly....!";
        }

       
    }
    [WebMethod]
    public static string CheckExe()
    {
        LogIn sm = new LogIn();
        string Responce = sm.Socketprogramming("CheckECE,CheckECE,CheckECE");
        return Responce;
    }
    [WebMethod]
    public static string CheckSIPExe()
    {
        LogIn sm = new LogIn();
        string Responce = sm.Socketprogramming("CheckSIP,CheckSIP,CheckSIP");
       
        return Responce;
    }

    private string GetUserIPAddress()
    {
        //string ipAddress = string.Empty;

        //// Check for a proxy or client IP address
        //if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        //{
        //    ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        //}
        //else if (Request.UserHostAddress.Length != 0)
        //{
        //    ipAddress = Request.UserHostAddress;
        //}

        //return ipAddress;
        string ipAddress = string.Empty;

        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            ipAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
        {
            ipAddress = HttpContext.Current.Request.UserHostAddress;
        }

        return ipAddress;
    }

    public string Socketprogramming(string operation)
    {
        IsError = "";
        string Recive = "";
        string hostName = Dns.GetHostName();
        IPAddress[] ipAddresses = Dns.GetHostAddresses(hostName);
        string clientIPAddress = "";
        clientIPAddress = GetUserIPAddress();

        //int serverPort = 55383;
        int serverPort = 49510;
        try
        {
            TcpClient client = new TcpClient(clientIPAddress, serverPort);
            //TcpClient client = new TcpClient();
            //client.Connect(IPAddress.Parse(Ip), PORT_1);
            NetworkStream stream = client.GetStream();
            string message = operation;
            byte[] sendData = Encoding.ASCII.GetBytes(message);
            stream.Write(sendData, 0, sendData.Length);
            byte[] buffer = new byte[1024];
            int bytesRead = stream.Read(buffer, 0, buffer.Length);
            string receivedData = Encoding.ASCII.GetString(buffer, 0, bytesRead);
            Recive = receivedData.ToString();
            if (Recive.Contains("Error"))
              {
                 IsError= Recive;
                 Session["Error"] = IsError;
              }
            if (Recive == "True")
            {
                return "Agent Is Already logged In";
            }
            else if (Recive == "false")
            {
                return "Agent Is Not logged In";
            }
            else
            {
                return Recive;
            }
            client.Close();

        }
        catch (Exception e)
        {
            Console.WriteLine("Error: " + e.Message);
        }
        return "";

    }
    public static string GetDomainName(string usernameDomain)
    {
        if (string.IsNullOrEmpty(usernameDomain))
        {
            throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
        }
        if (usernameDomain.Contains("\\"))
        {
            int index = usernameDomain.IndexOf("\\");
            return usernameDomain.Substring(0, index);
        }
        else if (usernameDomain.Contains("@"))
        {
            int index = usernameDomain.IndexOf("@");
            return usernameDomain.Substring(index + 1);
        }
        else
        {
            return "";
        }
    }
    public static string GetUsername(string usernameDomain)
    {
        if (string.IsNullOrEmpty(usernameDomain))
        {
            throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
        }
        if (usernameDomain.Contains("\\"))
        {
            int index = usernameDomain.IndexOf("\\");
            return usernameDomain.Substring(index + 1);
        }
        else if (usernameDomain.Contains("@"))
        {
            int index = usernameDomain.IndexOf("@");
            return usernameDomain.Substring(0, index);
        }
        else
        {
            return usernameDomain;
        }
    }
    protected bool changeDomainPassword()
    {
        string domainName = GetDomainName(txtUserName.Text); // Extract domain name 
        string userName = GetUsername(txtUserName.Text).Trim();  // Extract user name 
        string DOMAIN = "";
        IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();
        string domainNameName = properties.DomainName;

        DOMAIN = domainNameName;
        IntPtr token = IntPtr.Zero;
        PrincipalContext ctx = new PrincipalContext(ContextType.Domain, DOMAIN);
        UserPrincipal user = UserPrincipal.FindByIdentity(ctx, userName);
        if (user == null)
        {
            LabelErr.Text = "Username doesn't exist";
            return false;
        }

        try
        {
            user.ChangePassword(txtPassword.Text, txtNewPassword.Text);
            return true;
        }
        catch (Exception ex)
        {
            LabelErr.Text = ex.Message;
            return false;
        }


    }
    protected void lnkSubmit_ClickOn(object sender, EventArgs e)
    {
        
        try
        {
            Session["Empcode"] = txtUserName.Text.ToString();
            Session["_UserName"] = txtUserName.Text;

            if (txtUserName.Text == "" || txtPassword.Text == "")
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Alert", "alert('Please Enter UserName & Password!!');", true);
                LabelErr.Text = "Please Enter UserName & Password!!";
                LabelErr.Visible = true;
            }

            if (txtUserName.Text != "" && txtPassword.Text != "")
            {
                Session["EMPID"] = txtUserName.Text;
                Session["PASS"] = txtUserName.Text;
                byte[] clearBytes = Encoding.Unicode.GetBytes(txtPassword.Text);
                string encyptpawd = Convert.ToBase64String(clearBytes);
                byte[] cipherBytes = Convert.FromBase64String(encyptpawd);
                string realpwd = Encoding.Default.GetString(cipherBytes);
                string mm = realpwd.Replace("\0", "");
                string domainName = GetDomainName(txtUserName.Text); // Extract domain name 
                string userName = GetUsername(txtUserName.Text);  // Extract user name               
                string DOMAIN = "";
                IPGlobalProperties properties = IPGlobalProperties.GetIPGlobalProperties();
                string domainNameName = properties.DomainName;

                DOMAIN = domainNameName;
                PrincipalContext ctx = new PrincipalContext(ContextType.Domain, DOMAIN);
                UserPrincipal user = UserPrincipal.FindByIdentity(ctx, userName.Trim());
                IntPtr token = IntPtr.Zero;
                bool isValid = ctx.ValidateCredentials(userName, txtPassword.Text);
                user.Enabled = false;
                if (isValid == false)
                {
                    LabelErr.Text = "Username and password not match";
                    return;
                }
                else
                {
                    DateTime dt = (DateTime)user.LastPasswordSet;
                    dt = dt.AddMinutes(330);
                    System.TimeSpan diffResult = Convert.ToDateTime(dt.AddDays(45).ToShortDateString()).Subtract(Convert.ToDateTime(DateTime.Now.ToShortDateString()));
                    if (diffResult.Days <= 0)
                    {

                        LabelErr.Text = "Your password is expired!!! Please reset the password!!!";
                        lblNewPassword.Visible = true;
                        txtNewPassword.Visible = true;
                        ChangePassword.Visible = true;
                        launchLink.Visible = false;
                        lnkSubmit.Visible = false;
                        lblPassword.Text = "Old Password";
                        return;

                    }
                }
                if (user != null)
                {
                    bool result = LogonUser(userName.Trim(), DOMAIN, txtPassword.Text, 2, 0, ref token);

                    if (result == true)
                    {
                        string senddataToServer = "Log_In," + txtUserName.Text + "," + txtPassword.Text;
                        string ResponceMassage = Socketprogramming(senddataToServer);
                        if (IsError.Contains("Error"))
                        {
                            Response.Redirect("Error.aspx");
                        }
                        if (ResponceMassage != "Agent Is Not logged In")
                        {
                            Response.Redirect("Timmer.aspx");
                        }
                        else
                        {
                            LabelErr.Text = "Kindly Enter Correct Credentials";
                        }
                    }
                    else
                    {
                        LabelErr.Text = "Kindly Enter Correct Credentials";
                    }
                }
                else
                {
                    LabelErr.Text = "Kindly Enter Correct Credentials";
                }
            }
        }
        catch (Exception ex)
        {
            LabelErr.Text = ex.Message;

        }

    }
}