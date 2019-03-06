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
    private int picID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }
    //<-----------------Begin Data Binding----------------->
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

    private void BindGridViewType(String t)
    {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            using (var cn = new System.Data.SqlClient.SqlConnection(GetConnectionString()))
            using (var cmd = new System.Data.SqlClient.SqlCommand())
            {
                cn.Open();
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select * From Buildings WHERE Type = @Type";
                cmd.Parameters.AddWithValue("@Type", t);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(dt);
            }

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

    private void BindGridViewSearch(string t)
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            using (var cn = new System.Data.SqlClient.SqlConnection(GetConnectionString()))
            using (var cmd = new System.Data.SqlClient.SqlCommand())
            {
                cn.Open();
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM buildings WHERE name LIKE %@t% OR address LIKE %@t% OR alias LIKE %@t%";
                cmd.Parameters.AddWithValue("@t", t);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(dt);
            }

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
            //throw new Exception(msg);
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
            string sqlStatement = "SELECT refLoc FROM Pictures WHERE buildId='" + buildID + "';";
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
    //<-----------------Begin Data Binding----------------->

    //<-----------------Button Click Events----------------->

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {

    }

    protected void ButtonTest_Click(object sender, EventArgs e)
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
        string typeText = "Government";
        BindGridViewType(typeText);
    }

    protected void MedButton_Click(object sender, EventArgs e)
    {
        string typeText = "Medical";
        BindGridViewType(typeText);
    }

    protected void BankButton_Click(object sender, EventArgs e)
    {
        string typeText = "Bank";
        BindGridViewType(typeText);
    }

    protected void PrivateButton_Click(object sender, EventArgs e)
    {
        string typeText = "Private";
        BindGridViewType(typeText);

    }
    protected void SchoolButton_Click(object sender, EventArgs e)
    {
        string typeText = "School";
        BindGridViewType(typeText);
    }
    //<-----------------Begin Data Binding----------------->

    private void BindGridViewBigPicture()
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            string sqlStatement = "SELECT refLoc FROM pictures WHERE picId='" + picID + "';";
            SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
            sqlDa.Fill(dt);

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

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //buildID = Convert.ToInt16(GridViewList.SelectedDataKey.Value);
        //BindGridViewGallery();
    }

    protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
    {
        string search = TextBoxSearch.Text;
        BindGridViewSearch(search);
        Image1.ImageUrl = filePath + "testPicture.jpg";
    }

    protected void GridViewGallery_SelectedIndexChanged(object sender, EventArgs e)
    {
        //filePath = GridViewGallery;
    }

    protected string GetUrlString(string type, string refLoc)
    {
        return filePath + type + "\\" + refLoc + ".jpg";
    }
}