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
        if (Request.QueryString["bill"] == null) Page.Response.Redirect("~/Bills.aspx");
        DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        owner.Text = (string)dv.Table.Rows[0][0];
        price.Text = (dv.Table.Rows[0][1] + "").Substring(0, (dv.Table.Rows[0][1] + "").Length - 2);
        timestamp.Text = ((DateTime)dv.Table.Rows[0][2]).ToString();
        description.Text = (string)dv.Table.Rows[0][3];
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null & Request.QueryString["bill"] != null)
        {
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (dv.Table.Rows.Count != 0)
            {
                userNotOwner.Visible = false;
                SqlDataSource1.UpdateCommand = "UPDATE USER_BILL SET is_paid = 1 WHERE (bill_id = " + long.Parse(Request.QueryString["bill"]) + ") AND (participant_id = (SELECT id_user FROM USERS WHERE (nickname = '" + GridView1.SelectedRow.Cells[0].Text + "')))";
                SqlDataSource1.Update();
                GridView1.DataBind();
            }
            else userNotOwner.Visible = true;
        }
    }
}