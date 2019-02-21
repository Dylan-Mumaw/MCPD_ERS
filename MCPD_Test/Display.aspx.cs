using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Home : System.Web.UI.Page {
private string filePath = "~\\LocationPhotos\\";

    protected void Page_Load(object sender, EventArgs e) {

    }
    private string GetConnectionString() {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    private void BindGridViewAll() {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0) {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (System.Data.SqlClient.SqlException ex) {
            string msg = "Fetch Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally {
            connection.Close();
        }
    }
    private void BindGridViewSchools() {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE ALIAS='School';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0) {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (System.Data.SqlClient.SqlException ex) {
            string msg = "Fetch Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally {
            connection.Close();
        }
    }
    private void BindGridViewGovernment() {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE ALIAS='Government';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0) {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (System.Data.SqlClient.SqlException ex) {
            string msg = "Fetch Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally {
            connection.Close();
        }
    }
    private void BindGridViewAllMedical() {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE ALIAS='Medical';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0) {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (System.Data.SqlClient.SqlException ex) {
            string msg = "Fetch Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally {
            connection.Close();
        }
    }
    private void BindGridViewBanks() {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE ALIAS='Bank';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0) {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (System.Data.SqlClient.SqlException ex) {
            string msg = "Fetch Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally {
            connection.Close();
        }
    }
    private void BindGridViewSearch() {
        var search = TextBoxSearch.Text;
        var Alias = TextBoxSearch.Text;
        var Address = TextBoxSearch.Text;
        var Name = TextBoxSearch.Text;
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());
        
        try {
            connection.Open();
            string sqlStatement = "SELECT * FROM [Buildings] WHERE (([Alias] LIKE '%' "+ @Alias +" '%') OR ([Address] LIKE '%' "+ @Address +" '%') OR ([Name] LIKE '%' "+ @Name +" '%'))";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0) {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (System.Data.SqlClient.SqlException ex) {
            string msg = "Fetch Error:";
            msg += ex.Message;
            throw new Exception(msg);
        }
        finally {
            connection.Close();
        }
    }
    protected void ButtonTest_Click(object sender, EventArgs e) {
        BindGridViewAll();
    }

    protected void ListBoxTest_SelectedIndexChanged(object sender, EventArgs e) {

    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e) {

    }

    protected void GridViewPictures_SelectedIndexChanged(object sender, EventArgs e) {

    }

    protected void schoolButton_Click(object sender, EventArgs e) {
        BindGridViewSchools();
    }

    protected void govButton_Click(object sender, EventArgs e) {
        BindGridViewGovernment();
    }

    protected void medButton_Click(object sender, EventArgs e) {
        BindGridViewAllMedical();
    }

    protected void bankButton_Click(object sender, EventArgs e) {
        BindGridViewBanks();
    }

    protected void ButtonSearch_Click(object sender, EventArgs e) {
        
    }
}