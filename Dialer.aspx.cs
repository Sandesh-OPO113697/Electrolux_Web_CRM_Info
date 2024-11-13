using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dialer : System.Web.UI.Page
{
    string ResponceStatus = string.Empty;
    string data = string.Empty;
    public bool HoldStatus = false;
    public string IsError = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    protected void BrekDropdawon(object sender, EventArgs e)
    {
        string Break = BrekDropdawonList.SelectedItem.Text.ToString();
        string Responceqq = Socketprogramming("Test,Test");
        bool STATUSWaiting = Responceqq.Contains("WAITING");
        bool STATUSAfterCall = Responceqq.Contains("WRAPING");
        if (STATUSAfterCall == true)
        {
            string Responce = Socketprogramming("BreakAfterCall," + Break);
            if (Responce.Contains("BREAK"))
            {
                CallButton.Visible = false;
                DissConnectButton.Visible = false;
                GetNextButton.Visible = false;
                TransferButton.Visible = false;
                BreakButton.Visible = false;
                HoldButton1.Visible = false;
                ConforenceButton.Visible = false;
                MergeButton4.Visible = false;
                PartyButton.Visible = false;
                LogOutButton5.Visible = false;
            }
            ScriptManager.RegisterStartupScript(updatePanel1, updatePanel1.GetType(), "alert", "alert('Kindly Dispose the Call');", true);
        }
        if (STATUSWaiting == true)
        {
            string Responce = Socketprogramming("Break," + Break);
            if (Responce.Contains("BREAK"))
            {
                CallButton.Visible = false;
                DissConnectButton.Visible = false;
                GetNextButton.Visible = false;
                TransferButton.Visible = false;
                BreakButton.Visible = false;
                HoldButton1.Visible = false;
                ConforenceButton.Visible = false;
                MergeButton4.Visible = false;
                PartyButton.Visible = false;
                LogOutButton5.Visible = false;
            }
        }

        BrekDropdawonList.SelectedIndex = 0;
    }
    protected void HoldButton1_Click(object sender, EventArgs e)
    {
        if (HoldStatus == true)
        {
            string Responce = Socketprogramming("UnHold_Call,Test");
            HoldStatus = false;
        }
        if (HoldStatus == false)
        {
            string Responce = Socketprogramming("Hold_Call,Test");
            HoldStatus = true;
        }
    }

    protected void ReadyButton1_Click(object sender, EventArgs e)
    {
        string Responce = Socketprogramming("Ready,Test");
        if (Responce.Contains("EventAgentReady"))
        {
            CallButton.Visible = true;
            DissConnectButton.Visible = true;
            GetNextButton.Visible = true;
            TransferButton.Visible = true;
            BreakButton.Visible = true;
            HoldButton1.Visible = true;
            ConforenceButton.Visible = true;
            MergeButton4.Visible = true;
            PartyButton.Visible = true;
            LogOutButton5.Visible = true;
        }
    }
    protected void Break_Button(object sender, EventArgs e)
    {
        string Responceqq = Socketprogramming("Test,Test");
        bool STATUS = Responceqq.Contains("WAITING");
        if (STATUS == false)
        {
            ScriptManager.RegisterStartupScript(updatePanel1, updatePanel1.GetType(), "alert", "alert('Kindly Dispose the Call');", true);
        }
        else
        {
            string Responce = Socketprogramming("Break," + "Break");
            if (Responce.Contains("BREAK"))
            {
                CallButton.Visible = false;
                DissConnectButton.Visible = false;
                GetNextButton.Visible = false;
                TransferButton.Visible = false;
                BreakButton.Visible = false;
                HoldButton1.Visible = false;
                ConforenceButton.Visible = false;
                MergeButton4.Visible = false;
                PartyButton.Visible = false;
                LogOutButton5.Visible = false;
            }

        }
    }

    protected void LogOutButton1_Click(object sender, EventArgs e)
    {
        string Responceqq = Socketprogramming("Test,Test");
        bool STATUSWRAPING = Responceqq.Contains("WRAPING");
        bool STATUSWAITING = Responceqq.Contains("WAITING");
        if (STATUSWAITING == true)
        {
            string Responce = Socketprogramming("LogOutCRM,Test");
            Response.Redirect("Login.aspx");
        }
        else if (STATUSWRAPING == true)
        {
            string Responce = Socketprogramming("LogOutCRM,Test");
        }
        else
        {
            ScriptManager.RegisterStartupScript(updatePanel1, updatePanel1.GetType(), "alert", "alert('" + "Not Allowed while agent on call please dispose this record..." + "Agent On Call" + "');", true);
        }
    }
    protected void MergeConforence(object sender, EventArgs e)
    {
        string Responce = Socketprogramming("MergeConfo,Test");
        string script = "IsConfoVisibilty();";
        ScriptManager.RegisterStartupScript(this, GetType(), "IsConfoVisibilty", script, true);
    }
    protected void ConferenceDisConnect(object sender, EventArgs e)
    {
        string Responce = Socketprogramming("DissConforence,Test");
        string script = "ConforenceStatus();";
        ScriptManager.RegisterStartupScript(this, GetType(), "ConforenceStatus", script, true);
    }
    [WebMethod]
    public static string ConforenceCall(string userInput)
    {
        Dialer sm = new Dialer();
        string Responce = sm.Socketprogramming("Confirence," + userInput);
        return "Server received userInput: " + userInput;
    }
    protected void ConfrenceButton1_Click(object sender, EventArgs e)
    {
        string Responce = Socketprogramming("Test,Test");
        bool STATUS = Responce.Contains("TALKING");
        if (STATUS == true)
        {
            string script = "CallConforence();";
            ScriptManager.RegisterStartupScript(this, GetType(), "CallConforence", script, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(updatePanel1, updatePanel1.GetType(), "alert", "alert('" + "Kindly connect the Call first..." + "');", true);
        }
    }
    protected void CallButton_Click(object sender, EventArgs e)
    {
        string Phone_Number = TextPhoneNumber.Text.ToString();
        int PhoneNumberlength = Phone_Number.Length;
        if (Phone_Number != "" && PhoneNumberlength == 10)
        {
            string Responce = Socketprogramming("Call_Dile," + Phone_Number);
            string script = "ConforenceVisibility();";
            ScriptManager.RegisterStartupScript(this, GetType(), "ConforenceVisibility", script, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(updatePanel1, updatePanel1.GetType(), "alert", "alert('" + "Please Enter 10 Digit Number" + "');", true);
        }
    }
    [WebMethod]
    public static string DissconnectTheCall()
    {
        Dialer sm = new Dialer();
        string ResponceCalling = sm.Socketprogramming("Test,Test");
        if (ResponceCalling.Contains("TALKING"))
        {
            string Responce = sm.Socketprogramming("Call_HangUp,Test");

            return "Call Disconnected";
        }
        else if (ResponceCalling.Contains("DIALING"))
        {
            string Responce = sm.Socketprogramming("Call_HangUp,Test");

            return "Call Disconnected";
        }
        else
        {
            return "Kindly Connect The Call";
        }
    }

    protected void CallDissConnectButton_Click(object sender, EventArgs e)
    {
        string script = "IsCallOnStatus();";
        ScriptManager.RegisterStartupScript(this, GetType(), "IsCallOnStatus", script, true);
    }
    [WebMethod]
    public static string GetResponceFromClient()
    {
        Dialer sm = new Dialer();
        string Responce = sm.Socketprogramming("Test,Test");
        return Responce;
    }
    public string Socketprogramming(string operation)
    {
        string Recive = "";
        string hostName = Dns.GetHostName(); ;
        int serverPort = 49510;
        string clientIPAddress = "";
        clientIPAddress = GetUserIPAddress();
        try
        {
            TcpClient client = new TcpClient(clientIPAddress, serverPort);
            NetworkStream stream = client.GetStream();
            string message = operation;
            byte[] sendData = Encoding.ASCII.GetBytes(message);
            stream.Write(sendData, 0, sendData.Length);
            byte[] buffer = new byte[1024];
            int bytesRead = stream.Read(buffer, 0, buffer.Length);
            string receivedData = Encoding.ASCII.GetString(buffer, 0, bytesRead);
            data = receivedData;
            string[] ResultArry = data.Split(',');
            IsError = ResultArry[14] + "," + ResultArry[15];
            if (IsError.Contains("Error"))
            {
                Session["Error"] = IsError;
                Response.Redirect("Error.aspx", endResponse: true);
            }
            return data;
            string[] parts = data.Split(',');
            string Responce = parts[0].ToString();
            string TimerStatusCount = parts[1].ToString();
            client.Close();

        }
        catch (Exception e)
        {
            Console.WriteLine("Error: " + e.Message);
        }
        return data;
    }
    private string GetUserIPAddress()
    {
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
}