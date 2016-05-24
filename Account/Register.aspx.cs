using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Membership.OpenAuth;
using System.Data;

public partial class Account_Register : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count == 0)
        {
            /*SqlDataSource1.InsertCommand = "INSERT INTO USERS (nickname,password,first_name,last_name,email) VALUES ('" +
                loginTextBox.Text + "','" + password1TextBox.Text + "','" + imieTextBox.Text + "','" +
                nazwiskoTextBox.Text + "','" + emailTextBox.Text+ "')";*/
            SqlDataSource1.Insert();
            Page.Response.Redirect("~/Account/Login.aspx");
        }
        else
        {
            loginNotValid.Visible = true;
        }
    }
}