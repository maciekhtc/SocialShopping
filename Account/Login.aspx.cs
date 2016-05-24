using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)        //logowanie
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count!=0)
        {
            Session["User_Id"] = (Int64)dv.Table.Rows[0][0]+"";
            Session["User_Username"] = (string)dv.Table.Rows[0][1];
            Page.Response.Redirect("~/Default.aspx");
        }
        else
        {
            Label2.Visible = true;
        }
    }
}