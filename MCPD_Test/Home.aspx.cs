using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    private void BindGridView()
    {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM LOCATION";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (System.Data.SqlClient.SqlException ex)
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
    protected void ButtonTest_Click(object sender, EventArgs e)
    {
        BindGridView();
    }

    protected void ListBoxTest_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void GridViewPictures_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}