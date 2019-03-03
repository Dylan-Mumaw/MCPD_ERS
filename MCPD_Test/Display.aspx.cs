


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
    private string filePath = "~\\LocationPhotos\\";
    private string search;
    private int buildID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    private void BindGridViewAll()
    {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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

    private void BindGridViewSchools()
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE TYPE = 'Government';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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
    /*private void BindGridViewGovernment()
    {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE TYPE = 'Government';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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
    }*/
    private void BindGridViewAllMedical()
    {


    }
    private void BindGridViewBanks()
    {


    }
    private void BindGridViewSearch()
    {
        search = TextBoxSearch.Text;
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM buildings WHERE name LIKE '%" + search + "%' OR address LIKE '%" + search + "%' OR alias LIKE '%" + search + "%'";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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
    private void BindGridViewGallery()
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT refLoc FROM pictures WHERE buildId='" + buildID + "';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewGallery.DataSource = dt;
                GridViewGallery.DataBind();
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
        //BindGridViewAll();
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings;";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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

    protected void GovButton_Click(object sender, EventArgs e)
    {
        //BindGridViewGovernment();
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE TYPE = 'Government';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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

    protected void MedButton_Click(object sender, EventArgs e)
    {
        //BindGridViewAllMedical();
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE TYPE = 'Medical';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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

    protected void BankButton_Click(object sender, EventArgs e)
    {
        //BindGridViewBanks();
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE TYPE = 'Bank';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //buildID = Convert.ToInt16(GridViewList.SelectedDataKey.Value);
        //BindGridViewGallery();
    }

    protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
    {
        BindGridViewSearch();
        Image1.ImageUrl = filePath + "testPicture.jpg";
    }

    protected void PrivateButton_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE TYPE = 'Private';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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

    protected void schoolButton_Click(object sender, EventArgs e)
    {
        //BindGridViewSchools();
        /*DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT * FROM Buildings WHERE TYPE = 'School';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

            Image1.ImageUrl = filePath + "testPicture.jpg";

            if (dt.Rows.Count > 0)
            {
                GridViewList.DataSource = dt;
                GridViewList.DataBind();
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
        }*/
    }

    protected void SchoolButton_Click(object sender, EventArgs e)
    {

    }
}