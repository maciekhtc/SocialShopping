using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Id"] == null) Page.Response.Redirect("~/Account/Login.aspx");
        if (Request.QueryString["nickname"] == null) Page.Response.Redirect("~/Default.aspx");
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        nickLabel.Text = (string)dv.Table.Rows[0][0];
        imieLabel.Text = (string)dv.Table.Rows[0][1];
        nazwiskoLabel.Text = (string)dv.Table.Rows[0][2];
        //joinDateLabel.Text = ((DateTime)dv.Table.Rows[0][4]).ToString();
        emailLabel.Text = (string)dv.Table.Rows[0][4];
        emailHyperlink.NavigateUrl = "mailto:" + emailLabel.Text;
    }
}