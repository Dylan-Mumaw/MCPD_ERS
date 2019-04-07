using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : Page
{
    string flag = "";

    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        flag = (String)Session["Flag"];
        if (!Request.IsSecureConnection)
        {
            string url = "https:" + ConfigurationManager.AppSettings["SecureAppPath"] + "Home.aspx";
            Response.Redirect(url);
        }
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        SelectQuery();
        if (string.IsNullOrEmpty(flag) || flag.Length <= 0)
            //Response.Redirect("Home.aspx");
            Label1.Text = "Please enter correct data.";
        else if (flag.Length > 0) Server.Transfer("Display.aspx", false);
        
    }
    protected void SelectQuery()
    {
        string UserName = TextBoxUsername.Text;
        string Password = TextBoxPassword.Text;
        DBMaster dbm = new DBMaster();
        SqlDataReader reader = dbm.getReader("SELECT role FROM logins WHERE userName ='" + UserName + "' COLLATE Latin1_General_CS_AS AND password ='" + Password + "' COLLATE Latin1_General_CS_AS;");

        while (reader.Read())
        {
            flag += reader["role"].ToString();
        }
        Session["Flag"] = flag;
    }

    protected void ButtonCreate_Click(object sender, EventArgs e)
    {
        Server.Transfer("Registration.aspx");
    }
}
