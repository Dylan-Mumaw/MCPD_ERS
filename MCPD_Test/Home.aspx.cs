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
        if (result.Length == 0)
            //Response.Redirect("Home.aspx");
            Label1.Text = "Please enter correct data.";
        else if (result.Length > 0) Response.Redirect("Display.aspx");
    }
    protected void SelectQuery()
    {
        string UserName = TextBoxUsername.Text;
        string Password = TextBoxPassword.Text;

        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("SELECT userName FROM logins WHERE userName ='" + UserName + "' AND password ='" + Password + "';", connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    result += reader["userName"].ToString();
                }
            }
            catch(System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}