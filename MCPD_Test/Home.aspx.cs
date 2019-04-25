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
        Session["GalleryBuildId"] = null;

        if (!flag.Equals("Admin"))
        {
            ButtonMaintenance.Visible = false;
        }
        SetFocus(TextBoxUsername);
        if (!string.IsNullOrEmpty((String)Session["DisplayInvalid"]))
        {
            Label1.Text = "Please enter correct data.";
        }

        flag = (String)Session["Flag"];
        if (!Request.IsSecureConnection)
        {
            string url = "https:" + ConfigurationManager.AppSettings["SecureAppPath"] + "Home.aspx";
            Response.Redirect(url);
        }

        if (!string.IsNullOrEmpty((String)Session["Flag"]) && lblUserName.Visible == false)
        {
            lblUserName.Text = "Hello, " + Session["User"].ToString() + "!";
            lblUserName.Visible = true;
            ButtonLogout.Visible = true;
            ButtonDisplay.Visible = true;
            if (flag.Equals("Admin"))
            {
                ButtonMaintenance.Visible = true;
            }
            LabelUsername.Visible = false;
            TextBoxUsername.Visible = false;
            LabelPassword.Visible = false;
            TextBoxPassword.Visible = false;
            ButtonLogin.Visible = false;
            ButtonCreate.Visible = false;
            validateLogin.Enabled = false;
            validatePass.Enabled = false;

        }
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        User = TextBoxUsername.Text;
        Pass = TextBoxPassword.Text;
        SelectQuery();
        if (string.IsNullOrEmpty(flag) || flag.Length <= 0)
        {
            Session["DisplayInvalid"] = "true";
        }

        Response.Redirect("Home.aspx", false);
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
            Session["User"] = User;
            Session["DisplayInvalid"] = "";
        }
        Session["Flag"] = flag;
    }

    protected void ButtonCreate_Click(object sender, EventArgs e)
    {
        Server.Transfer("Registration.aspx");
    }

    protected void ButtonLogout_Click(object sender, EventArgs e)
    {
        Session["Flag"] = "";
        Session["User"] = "";
        Response.Redirect("Home.aspx", false);
    }

    protected void ButtonDisplay_Click(object sender, EventArgs e)
    {
        Response.Redirect("Display.aspx", false);
    }
}
