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
        if (Session["User_Id"] != null)
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows.Count != 0)
            {
                loginLabel.Text = (string)dv.Table.Rows[0][0];
                imieLabel.Text = (string)dv.Table.Rows[0][1];
                nazwiskoLabel.Text = (string)dv.Table.Rows[0][2];
                //dataLabel.Text = DateTime.FromBinary(((long)dv.Table.Rows[0][3])).ToString(); //niemożliwe ze względu na nieprawidłowy projekt bazy danych (zły typ danych) (dodac potem do rejestracji)
                emailLabel.Text = (string)dv.Table.Rows[0][4];
            }
        }
        else Page.Response.Redirect("~/Account/Login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null) Page.Response.Redirect("~/Account/Management.aspx");
        else Page.Response.Redirect("~/Account/Login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null) Page.Response.Redirect("~/Account/ChangePassword.aspx");    //utworzyc
        else Page.Response.Redirect("~/Account/Login.aspx");      
    }
}