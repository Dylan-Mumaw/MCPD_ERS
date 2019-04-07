using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Script.Serialization;

public partial class Display : System.Web.UI.Page
{
    private int buildID = 0;
    private int picID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("SELECT type FROM Types", connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            try
            {
                while (reader.Read())
                {
                    string currentType = reader["type"].ToString();

                    Button currentButton = new Button
                    {
                        ID = "btn" + currentType,
                        Text = currentType,
                        CssClass = "button",
                        UseSubmitBehavior = false
                    };

                    currentButton.Click += (se, args) => { BindGridViewType(currentType); };

                    ButtonContainer.Controls.Add(currentButton);
                }

                Button searchAllButton = new Button
                {
                    ID = "btnSelectAll",
                    Text = "Select All",
                    CssClass = "button",
                    UseSubmitBehavior = false
                };

                searchAllButton.Click += (se, args) => { SearchAll(); };

                ButtonContainer.Controls.Add(searchAllButton);
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
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridViewCurrentContact.Rows)
        {
            DropDownList contactsDdl = (DropDownList)row.FindControl("ddlContactName");
            Label contactNumLabel = (Label)row.FindControl("lblContactNumber");
            Label contactTitleLabel = (Label)row.FindControl("lblContactTitle");

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("SELECT [ContactNumber] FROM [Contacts] WHERE ([ContactId] = " + contactsDdl.SelectedValue + ")", connection);
                SqlCommand cmdTwo = new SqlCommand("SELECT [Title] FROM [Contacts] WHERE ([ContactId] = " + contactsDdl.SelectedValue + ")", connection);
                try
                {
                    connection.Open();
                    contactNumLabel.Text = cmd.ExecuteScalar().ToString();
                    contactTitleLabel.Text = cmdTwo.ExecuteScalar().ToString();
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
        }
    }

    //Retrieves image selected from photo gallery
    //Sizes selected image appropriately
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
                        bigImageZoom.Attributes["Style"] = String.Format("overflow:hidden;width:200%;");
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

    //<-----------------GET CONNECTION STRING----------------->
    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    //<-----------------BEGIN DATA BINDING----------------->

    public void BindPage()
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Buildings ORDER BY Type", connection);
        da.Fill(dt);
        GridViewBuildingList.DataSource = dt;
        GridViewBuildingList.DataBind();
    }
    protected void GridViewBuildingList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewBuildingList.PageIndex = e.NewPageIndex;
        BindPage();
    }

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
                    GridViewBuildingList.DataSource = dt;
                    GridViewBuildingList.DataBind();
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
                GridViewBuildingList.DataSource = dt;
                GridViewBuildingList.DataBind();
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


    private void BindGridViewCurrentContact()
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
                cmd.CommandText = "SELECT contactId, name, address, fullname, contactnumber, title FROM Buildings INNER JOIN Contacts ON Buildings.Id = " +
                                  "Contacts.buildID WHERE Buildings.Id = " + buildID + ";";

                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                GridViewCurrentContact.DataSource = dt;
                GridViewCurrentContact.DataBind();

                if (GridViewCurrentContact.Rows.Count > 1)
                {
                    for (int i = 1; i < GridViewCurrentContact.Rows.Count; i++)
                    {
                        GridViewCurrentContact.Rows[i].Visible = false;
                    }
                }
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

    //<-----------------END DATA BINDING----------------->

    protected void SetBigImageUrl()
    {
        SqlConnection connection = new SqlConnection(GetConnectionString());
        //using (var cn = new System.Data.SqlClient.SqlConnection(GetConnectionString()))
        //using (var cmd = new System.Data.SqlClient.SqlCommand())

        try
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("getRefLoc", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@picId", picID);
            //cmd.Connection = cn;
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "SELECT [refLoc] FROM [Pictures] WHERE ([picId] = @picId)";
            //cmd.Parameters.AddWithValue("@picId", picID);

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                bigImage.ImageUrl = reader[0].ToString();

                System.Drawing.Bitmap b = new System.Drawing.Bitmap(Server.MapPath(reader[0].ToString()));
                int naturalWidth = b.Width;
                int naturalHeight = b.Height;
                b.Dispose();

                double ratio = bigImage.Width.Value / naturalWidth;
                int scaledHeight = (int)(naturalHeight * ratio);

                bigImageZoom.Attributes["Style"] = String.Format("overflow:hidden;width:520px;height:{0}px;", scaledHeight + 4);
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
    //<-----------------BEGIN BUTTON CLICK EVENTS----------------->

    protected void SearchAll()
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
                GridViewBuildingList.DataSource = dt;
                GridViewBuildingList.DataBind();
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

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {

    }

    //<-----------------END BUTTON CLICK EVENTS----------------->

    //<-----------------BEGIN SELECTED INDEX CHANGED----------------->
    protected void GridViewBuildingList_SelectedIndexChanged(object sender, EventArgs e)
    {
        buildID = Convert.ToInt16(GridViewBuildingList.SelectedDataKey.Value);
        BindGridViewGallery();
        bigImageZoom.Attributes["style"] = "width:0px;height:0px;display:none;";
        BindGridViewCurrentContact();
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
        //SizeDiv();
        SetBigImageUrl();
    }
    //<-----------------END SELECTED INDEX CHANGED----------------->

    protected void GridViewCurrentContact_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView rowView = (DataRowView)e.Row.DataItem;
            if (rowView != null)
            {
                int id = (int)rowView["ContactId"];

                DropDownList contactsDdl = (DropDownList)e.Row.FindControl("ddlContactName");

                DataTable dt = new DataTable();
                SqlConnection connection = new SqlConnection(GetConnectionString());

                try
                {
                    connection.Open();
                    string sqlStatement = "SELECT [ContactId], [FullName], [ContactNumber], [Title] FROM Buildings INNER JOIN Contacts ON Buildings.Id = " + "Contacts.buildID WHERE Buildings.Id = " + buildID + ";";
                    SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection);
                    SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
                    sqlDa.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        contactsDdl.DataSource = dt;
                        contactsDdl.DataBind();
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    string msg = "Fetch Error: ";
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

    [System.Web.Services.WebMethod]
    public static List<string> GetPossibleResults()
    {
        List<string> possibleResults = new List<String>();

        string strGetNames = "SELECT DISTINCT Name FROM Buildings";
        string strGetAliases = "SELECT DISTINCT Alias FROM Buildings";
        string strGetAddresses = "SELECT DISTINCT Address FROM Buildings";
        string strGetTypes = "SELECT Type FROM Types";

        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            SqlCommand GetNames = new SqlCommand(strGetNames, connection);
            SqlCommand GetAliases = new SqlCommand(strGetAliases, connection);
            SqlCommand GetAddresses = new SqlCommand(strGetAddresses, connection);
            SqlCommand GetTypes = new SqlCommand(strGetTypes, connection);

            connection.Open();
            SqlDataReader reader = GetNames.ExecuteReader();

            try
            {
                while(reader.Read())
                {
                    possibleResults.Add(reader[0].ToString());
                }

                reader.Close();
                reader = GetAliases.ExecuteReader();

                while (reader.Read())
                {
                    possibleResults.Add(reader[0].ToString());
                }

                reader.Close();
                reader = GetAddresses.ExecuteReader();

                while (reader.Read())
                {
                    possibleResults.Add(reader[0].ToString());
                }

                reader.Close();
                reader = GetTypes.ExecuteReader();

                while (reader.Read())
                {
                    possibleResults.Add(reader[0].ToString());
                }

                reader.Close();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error: ";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                connection.Close();
            }
        }
            return possibleResults;
    }
}