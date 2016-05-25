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
            if (dv.Table.Rows[0][0] != null)
            {
                if (imieTextBox.Text.Length == 0)      //zabezpieczenie przed ponownym wczytaniem wartości do wypelnionego pola
                {                               //metoda PageLoad wykonuje sie takze przy przechodzeniu z tej strony na inną? m$. 2h
                    imieTextBox.Text = (string)dv.Table.Rows[0][0];
                    nazwiskoTextBox.Text = (string)dv.Table.Rows[0][1];
                    emailTextBox.Text = (string)dv.Table.Rows[0][2];
                }
            }
        }
        else Page.Response.Redirect("~/Account/Login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null) Page.Response.Redirect("~/Account/Profile.aspx");
        else Page.Response.Redirect("~/Account/Login.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //SqlDataSource1.UpdateCommand = "UPDATE [USERS] SET [first_name] = '" + TextBox1.Text + "',[last_name] = '" + TextBox2.Text + "',[email] = '" + TextBox3.Text + "' WHERE [id_user]=" + (Int64.Parse((string)Session["User_Id"]));
        if (Session["User_Id"] != null)
        {
            SqlDataSource1.Update();
            Page.Response.Redirect("~/Account/Profile.aspx");
        }
        else Page.Response.Redirect("~/Account/Login.aspx"); 
    }
}