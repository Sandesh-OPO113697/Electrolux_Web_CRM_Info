using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
         string Error = Session["Error"].ToString();
        string [] ErrorrArry=Error.Split(',');
        ErrorMassge.InnerText = ErrorrArry[1];
        }
        catch(Exception ex)
        {
            if (ex.Message== "Index was outside the bounds of the array.")
            {
                ErrorMassge.InnerText = "Session Not Cath IN CTI Page";
            }
            else
            {
                ErrorMassge.InnerText = ex.Message;

            }
           
        }
       
    }
}