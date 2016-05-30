using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Id"] == null) Page.Response.Redirect("~/Account/Login.aspx");
        if (Request.QueryString["bill"] == null) Page.Response.Redirect("~/Bills.aspx");
        
        long bill = long.Parse(Request.QueryString["bill"]);
        Label1.Text = bill + "";
    }
}