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
        //if (Session["newId"]!=null) Label1.Text = (Int32)Session["newId"] + "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //check if user exist in database and password is correct, then add bill and then add userbill
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        if (dv.Table.Rows.Count != 0)
        {
            Label2.Visible = false;
            if (Label1.Text == "0") SqlDataSource1.Insert();  //add bill if not exists yet
            SqlDataSource2.InsertCommand = ("INSERT INTO USER_BILL (bill_id,participant_id,is_paid) VALUES (" + Label1.Text + "," + dv.Table.Rows[0][0].ToString() + ",0)");
            SqlDataSource2.Insert();            //add userbill
            GridView1.DataBind();               //refresh grid table
        }
        else
        {
            Label2.Visible = true;
        }
    }
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label1.Text = e.Command.Parameters["@newId"].Value.ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Label1.Text != "0")
        {
            SqlDataSource2.Delete();        //delete userbills
            SqlDataSource1.Delete();        //delete bill
        }
        Page.Response.Redirect("~/Default.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect("~/Default.aspx");
    }
}