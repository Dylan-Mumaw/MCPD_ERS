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
    String flag;
    //List<MyImages> Images = newList<MyImages>();

    protected void Page_Load(object sender, EventArgs e)
    {
        flag = (String)Session["Flag"];
        if (string.IsNullOrEmpty(flag))
        {
            string url = "https:" + ConfigurationManager.AppSettings["SecureAppPath"] + "Home.aspx";
            Response.Redirect(url);
        }
        
        if(Session["GalleryBuildId"] != null)
        {
            buildID = Convert.ToInt32(Session["GalleryBuildId"]);
        }
        
        if (buildID > 0)
        {
            PopulateGallery();
        }

        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("getType", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
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
                TextBoxSearch.Attributes.Add("onkeydown", "return handleEnter('" + searchButton.ClientID + "', event)");
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
                SqlCommand cmd = new SqlCommand("ContactNumber", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@contactid", contactsDdl.SelectedValue);
                SqlCommand cmdTwo = new SqlCommand("ContactTitle", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmdTwo.Parameters.AddWithValue("@contactid", contactsDdl.SelectedValue);
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
        SqlDataAdapter da = new SqlDataAdapter("building", connection);
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
        
        bigImageZoom.Dispose();
        GridViewCurrentContact.DataSource = null;
        GridViewCurrentContact.DataBind();
        GalleryContainer.Controls.Clear();
        Session["GalleryBuildId"] = null;
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());
        try
        {
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("BuildingType", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Type", t);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                GridViewBuildingList.DataSource = dt;
                GridViewBuildingList.DataBind();
                lblNoResults.Visible = false;
            }
            else
            {
                lblNoResults.Visible = true;
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
        GridViewCurrentContact.DataSource = null;
        GridViewCurrentContact.DataBind();
        GalleryContainer.Controls.Clear();
        Session["GalleryBuildId"] = null;
        DataTable recordsMatchedAllWords = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();

            string[] searchedWords = t.Split(' ');

            if (searchedWords[0] == "")
            {
                DataTable recordsMatched = new DataTable();

                SqlCommand cmd = new SqlCommand("GridSearchSimple", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@text", t);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(recordsMatched);

                GridViewBuildingList.DataSource = recordsMatched;
                GridViewBuildingList.DataBind();

                if (recordsMatched.Rows.Count == 0)
                {
                    lblNoResults.Visible = true;
                }
                else
                {
                    lblNoResults.Visible = false;
                }
            }
            else
            {
                foreach (string word in searchedWords)
                {
                    DataTable recordsMatchedThisWord = new DataTable();

                    SqlCommand cmd = new SqlCommand("GridSearch", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@text", word);

                    SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

                    sqlDa.Fill(recordsMatchedThisWord);

                    if (recordsMatchedAllWords.Rows.Count == 0)
                    {
                        recordsMatchedAllWords = recordsMatchedThisWord;
                    }
                    else
                    {
                        foreach (DataRow matchedRow in recordsMatchedThisWord.Rows)
                        {
                            for (int x = 0; x < recordsMatchedAllWords.Rows.Count; x++)
                            {
                                if (Convert.ToInt32(matchedRow[0]) == Convert.ToInt32(recordsMatchedAllWords.Rows[x][0]))
                                {
                                    recordsMatchedAllWords.Rows[x]["Matches"] = Convert.ToInt32(recordsMatchedAllWords.Rows[x]["Matches"]) + Convert.ToInt32(matchedRow["Matches"]);
                                    break;
                                }
                                else if (x + 1 == recordsMatchedAllWords.Rows.Count)
                                {
                                    DataRow newRow = recordsMatchedAllWords.NewRow();
                                    newRow[0] = matchedRow[0];
                                    newRow[1] = matchedRow[1];
                                    newRow[2] = matchedRow[2];
                                    newRow[3] = matchedRow[3];
                                    newRow[4] = matchedRow[4];
                                    newRow[5] = matchedRow[5];
                                    recordsMatchedAllWords.Rows.Add(newRow);
                                    break;
                                }
                            }
                        }
                    }
                }

                /*
                SqlCommand cmd = new SqlCommand("GridSearch", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@text", t);

                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

                sqlDa.Fill(dt);
                */

                recordsMatchedAllWords.DefaultView.Sort = "Matches DESC";

                GridViewBuildingList.DataSource = recordsMatchedAllWords;
                GridViewBuildingList.DataBind();

                if (recordsMatchedAllWords.Rows.Count == 0)
                {
                    lblNoResults.Visible = true;
                }
                else
                {
                    lblNoResults.Visible = false;
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

    private void BindGridViewCurrentContact()
    {
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("CurrentContact", connection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@buildId", buildID);

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

    protected void SetBigImageUrl(string refLoc)
    {
        bigImage.ImageUrl = refLoc;
    }
    //<-----------------BEGIN BUTTON CLICK EVENTS----------------->

    protected void SearchAll()
    {
        GridViewCurrentContact.DataSource = null;
        GridViewCurrentContact.DataBind();
        GalleryContainer.Controls.Clear();
        Session["GalleryBuildId"] = null;
        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {
            connection.Open();
            SqlCommand sqlCmd = new SqlCommand("building", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
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
    //<-----------------END BUTTON CLICK EVENTS----------------->

    //<-----------------BEGIN SELECTED INDEX CHANGED----------------->
    protected void GridViewBuildingList_SelectedIndexChanged(object sender, EventArgs e)
    {
        buildID = Convert.ToInt32(GridViewBuildingList.SelectedValue);
        Session["GalleryBuildId"] = buildID;
        PopulateGallery();
        bigImageZoom.Attributes["style"] = "width:0px;height:0px;display:none;";
        BindGridViewCurrentContact();
    }

    protected void PopulateGallery()
    {
        if(GalleryContainer.Controls.Count > 0)
        {
            GalleryContainer.Controls.Clear();
        }
        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            connection.Open();
            SqlCommand cmd = new SqlCommand("BuildRefLoc", connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@buildId", buildID);
            SqlDataReader reader = cmd.ExecuteReader();

            int x = 1;
            while(reader.Read())
            {
                ImageButton galleryButton = new ImageButton
                {
                    ID = "GalleryImageButton" + x,
                    AlternateText = "Gallery Image Button " + x,
                    ImageAlign = ImageAlign.Left,
                    ImageUrl = reader["refLoc"].ToString(),
                    CssClass = "galleryButton",
                    Height = 300,
                    Width = 300
                };

                galleryButton.Click += new ImageClickEventHandler(galleryButton_Click);
                GalleryContainer.Controls.Add(galleryButton);
                
                x++;
            }
        }
    }

    protected void galleryButton_Click(object sender, EventArgs e)
    {
        ImageButton galleryButton = (ImageButton)sender;

        SetBigImageUrl(galleryButton.ImageUrl);

        System.Drawing.Bitmap b = new System.Drawing.Bitmap(Server.MapPath(galleryButton.ImageUrl));
        int naturalWidth = b.Width;
        int naturalHeight = b.Height;
        b.Dispose();

        double ratio = bigImage.Width.Value / naturalWidth;
        int scaledHeight = (int)(naturalHeight * ratio);

        bigImageZoom.Attributes["Style"] = String.Format("overflow:hidden;width:820px;height:{0}px;", scaledHeight + 6);
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        GridViewCurrentContact.DataSource = null;
        GridViewCurrentContact.DataBind();
        string search = TextBoxSearch.Text;
        BindGridViewSearch(search);
        bigImageZoom.Attributes["style"] = "width:0px;height:0px;display:none;";
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
                    SqlCommand cmd = new SqlCommand("CurrentContact", connection)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@buildId", buildID);
                    SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);

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
                while (reader.Read())
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

    protected void GridViewBuildingList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='none';";
            e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

            e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridViewBuildingList, "Select$" + e.Row.RowIndex);
            //e.Row.Cells[4].Style["display"] = "none";
        }
    }

    protected void ButtonHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx", false);
    }
}