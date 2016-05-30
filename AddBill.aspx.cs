﻿using System;
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
        if (Session["newId"]!=null) Label1.Text = (Int32)Session["newId"] + "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
    }
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Session["newId"] = e.Command.Parameters["@newId"].Value;
    }
}