using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;


public partial class APR : System.Web.UI.Page
{
    string connectionString = "Data Source=192.168.0.48; Initial Catalog=Tenant01_Stat; Uid=stat; Password=$t@T#1433"; // Replace with your connection string
    string storedProcedure = "SP_GetLive_AgentStat_APR_UAT";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string empId = Session["Empcode"].ToString();


                if (string.IsNullOrEmpty(empId))
                {
                    empId = ""; // Default value
                }
                if (empId != null)
                {
                    string OPOID = empId;
                    BindAgentStats(OPOID);
                    GetTotalCallLogAPR(OPOID);
                    GetAchivePercentage(OPOID);
                }
            }
            catch(Exception ec)
            {

            }
            
            
        }
    }
    protected void btnLogo_Click(object sender, ImageClickEventArgs e)
    {
        // Redirect to the home page or perform any action
        Response.Redirect("~/CRM.aspx");
    }
    public void GetAchivePercentage( string OPO)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(storedProcedure, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OPOID", OPO);
                cmd.Parameters.AddWithValue("@Operation", "TargetAchived");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string TargentAchive = dt.Rows[0]["TargetAchivedOnCalls"].ToString();
                    TargetAchive.Value = TargentAchive;
                }
            }
        }
    }
    public void GetTotalCallLogAPR(string EmpID)
    {
        
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(storedProcedure, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OPOID", EmpID);
                cmd.Parameters.AddWithValue("@Operation", "DaywiseCalls");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    var statsList = new List<object>();

                    // Loop through all rows in the DataTable
                    foreach (DataRow row in dt.Rows)
                    {
                        var stats = new
                        {
                            Date = row["Date"].ToString(),
                            Totalcalls = row["Totalcalls"].ToString()
                        };
                        // Add the object to the list
                        statsList.Add(stats);
                    }

                    string jsonStats = JsonConvert.SerializeObject(statsList);
                    TotalCallgDashBoard.Value = jsonStats;
                }
            }
        }
    }

    private void BindAgentStats(string OPOID)
    {
       
        
        // Pass the agent id

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(storedProcedure, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OPOID", OPOID);
                cmd.Parameters.AddWithValue("@Operation", "APR");
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    var stats = new
                    {
                        TossTime = dt.Rows[0]["Toss"].ToString(),
                        AHT = dt.Rows[0]["AHT"].ToString(),
                        WrapTime = dt.Rows[0]["Wrap"].ToString(),
                        TotalCalls = dt.Rows[0]["Totalcalls"].ToString(),
                        InboundTalkTime = dt.Rows[0]["Inbound_Talk"].ToString(),
                        OutboundTalkTime = dt.Rows[0]["Outbound_Talk"].ToString(),
                        HoldTime = dt.Rows[0]["Hold"].ToString()
                    };
                    string jsonStats = JsonConvert.SerializeObject(stats);
                    hiddenAgentStats.Value = jsonStats;
                }
            }
        }
    }
}