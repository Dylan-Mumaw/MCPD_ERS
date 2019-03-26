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
    string result = "";
    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        SelectQuery();
        Label1.Text = result;
        if (result.Length < 0)
            //Response.Redirect("Home.aspx");
            Label1.Text = "Please enter correct data.";
        if (result.Length > 0) Server.Transfer("Display.aspx", false);
    }
    protected void SelectQuery()
    {
        string UserName = TextBoxUsername.Text;
        string Password = TextBoxPassword.Text;
        DBMaster dbm = new DBMaster();
        SqlDataReader reader = dbm.getReader("SELECT userName FROM logins WHERE userName ='" + UserName + "' AND password ='" + Password + "';");

        while (reader.Read())
        {
            result += reader["userName"].ToString();
        }
    }

    protected void ButtonCreate_Click(object sender, EventArgs e)
    {
        Server.Transfer("Registration.aspx");
    }
}
