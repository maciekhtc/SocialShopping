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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null)
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows.Count != 0)
            {
                SqlDataSource1.Update();
                Page.Response.Redirect("~/Account/Profile.aspx");
            }
            else passwordNotValid.Visible = true;
        }
        else Page.Response.Redirect("~/Account/Login.aspx"); 
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null) Page.Response.Redirect("~/Account/Profile.aspx");
        else Page.Response.Redirect("~/Account/Login.aspx");
    }
}