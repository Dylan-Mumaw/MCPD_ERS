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
    string User = "";
    string Pass = "";
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
        User = TextBoxUsername.Text;
        Pass = TextBoxPassword.Text;
        SelectQuery();
        if (string.IsNullOrEmpty(flag) || flag.Length <= 0)
            //Response.Redirect("Home.aspx");
            Label1.Text = "Please enter correct data.";
        else if (flag.Length > 0) Response.Redirect("Display.aspx", false);
    }
    protected void SelectQuery()
    {
        flag = "";
        SqlConnection connection = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("role", connection)
        {
            CommandType = CommandType.StoredProcedure
        };
        cmd.Parameters.AddWithValue("@user", User);
        cmd.Parameters.AddWithValue("@pass", Pass);
        connection.Open();

        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {
            flag = reader["Role"].ToString();
        }
        Session["Flag"] = flag;
    }

    protected void ButtonCreate_Click(object sender, EventArgs e)
    {
        Server.Transfer("Registration.aspx");
    }
}
