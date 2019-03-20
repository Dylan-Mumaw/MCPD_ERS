using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Display : System.Web.UI.Page
{
    private int buildID = 0;
    private int picID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    BindPage();
        //}
    }

    public void BindPage()
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Buildings ORDER BY Type", connection);
        da.Fill(dt);
        GridViewList.DataSource = dt;
        GridViewList.DataBind();
    }
    protected void GridViewList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewList.PageIndex = e.NewPageIndex;
        BindPage();
    }


    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    //<-----------------Begin Data Binding----------------->
    private void BindGridViewType(String t)
    {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());
        using (var cn = new System.Data.SqlClient.SqlConnection(GetConnectionString()))
        using (var cmd = new System.Data.SqlClient.SqlCommand())

            try
            {
                {
                    cn.Open();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "Select * From Buildings WHERE Type = @Type ORDER BY Type";
                    cmd.Parameters.AddWithValue("@Type", t);
                    SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                    sqlDa.Fill(dt);
                }
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
                cmd.CommandText = "Select * FROM Buildings WHERE Name LIKE '%'+@text+'%' OR Alias LIKE '%'+@text+'%' OR Type LIKE '%'+@text+'%' or Address LIKE '%'+@text+'%' ORDER BY Type";
                cmd.Parameters.AddWithValue("@text", t);

                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(dt);
            }

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

            if (dt.Rows.Count > 0)
            {
                //GridViewGallery.DataSource = dt;
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

    private void BindGridViewBigPicture()
    {

    }

    protected void SizeDiv()
    {
        SqlConnection connection = new SqlConnection(GetConnectionString());
        using (var cn = new System.Data.SqlClient.SqlConnection(GetConnectionString()))
        using (var cmd = new System.Data.SqlClient.SqlCommand())

            try
            {
                {
                    cn.Open();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT [refLoc] FROM [Pictures] WHERE ([picId] = @picId)";
                    cmd.Parameters.AddWithValue("@picId", picID);

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        System.Drawing.Bitmap b = new System.Drawing.Bitmap(Server.MapPath(reader[0].ToString()));
                        int naturalWidth = b.Width;
                        int naturalHeight = b.Height;
                        b.Dispose();

                        //int adjustedDivWidth = naturalWidth + 20;
                        //int adjustedDivHeight = naturalHeight + 30;

                        //bigImageZoom.Attributes["Style"] = String.Format("overflow:hidden;width:{0}px;height:{1}px;", adjustedDivWidth, adjustedDivHeight);
                        bigImageZoom.Attributes["Style"] = String.Format("overflow:hidden;width:520px;");
                    }
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

    //<-----------------END Data Binding-------------------->


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
            string sqlStatement = "SELECT * FROM Buildings ORDER BY TYPE ASC";
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
    //<-----------------End Button Click----------------->

    //<-----------------Begin SelectedIndexChanged----------------->
    protected void GridViewList_SelectedIndexChanged(object sender, EventArgs e)
    {
        buildID = Convert.ToInt16(GridViewList.SelectedDataKey.Value);
        BindGridViewGallery();
        bigImageZoom.Attributes["style"] = "width:0px;height:0px;display:none;";
    }

    protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
    {
        string search = TextBoxSearch.Text;
        BindGridViewSearch(search);
        bigImageZoom.Attributes["style"] = "width:0px;height:0px;display:none;";
    }

    protected void GridViewGallery_SelectedIndexChanged(object sender, EventArgs e)
    {
        picID = (int)GridViewGallery.SelectedDataKey.Value;
        //BindGridViewBigPicture();
        SizeDiv();
    }

    protected void GridViewBigPicture_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    //<-----------------End SelectedIndexChanged----------------->
}