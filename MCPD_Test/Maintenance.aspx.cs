using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.IO;

public partial class Maintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url;
        string flag = (String)Session["Flag"];
        if (string.IsNullOrEmpty(flag) || !flag.Equals("Admin"))
        {
            url = "https:" + ConfigurationManager.AppSettings["SecureAppPath"] + "Home.aspx";
            Response.Redirect(url);
        }
    }

    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    protected void GridViewBuildings_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }

    protected void GridViewBuildingsArchive_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }

    protected void GridViewTypes_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }

    protected void GridViewLoginArchive_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }

    protected void GridViewLogin_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }
    protected void GridViewPictures_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }

    protected void GridViewContacts_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }

    protected void SetArrows(Object sender, GridViewRowEventArgs e)
    {
        // Use the RowType property to determine whether the 
        // row being created is the header row. 
        if (e.Row.RowType == DataControlRowType.Header)
        {
            // Call the GetSortColumnIndex helper method to determine
            // the index of the column being sorted.
            int sortColumnIndex = GetSortColumnIndex((GridView)sender);

            if (sortColumnIndex != -1)
            {
                // Call the AddSortImage helper method to add
                // a sort direction image to the appropriate
                // column header. 
                AddSortImage(sortColumnIndex, e.Row, (GridView)sender);
            }
        }
    }

    // This is a helper method used to determine the index of the
    // column being sorted. If no column is being sorted, -1 is returned.
    int GetSortColumnIndex(GridView GridViewBeingSorted)
    {
        if (GridViewBeingSorted.SortExpression == "")
            GridViewBeingSorted.Sort(GridViewBeingSorted.Columns[0].SortExpression, SortDirection.Ascending);

        // Iterate through the Columns collection to determine the index
        // of the column being sorted.
        foreach (DataControlField field in GridViewBeingSorted.Columns)
        {
            if (field.SortExpression == GridViewBeingSorted.SortExpression)
            {
                return GridViewBeingSorted.Columns.IndexOf(field);
            }
        }

        return -1;
    }

    // This is a helper method used to add a sort direction
    // image to the header of the column being sorted.
    void AddSortImage(int columnIndex, GridViewRow headerRow, GridView GridViewBeingSorted)
    {

        // Create the sorting image based on the sort direction.
        Image sortPrefixImage = new Image();
        Image sortSuffixImage = new Image();

        if (GridViewBeingSorted.SortDirection == SortDirection.Ascending)
        {
            sortPrefixImage.ImageUrl = "~/StylePhotos/Up.png";
            sortPrefixImage.AlternateText = "Ascending Order";

            sortSuffixImage.ImageUrl = "~/StylePhotos/Up.png";
            sortSuffixImage.AlternateText = "Ascending Order";
        }
        else
        {
            sortPrefixImage.ImageUrl = "~/StylePhotos/Down.png";
            sortPrefixImage.AlternateText = "Descending Order";

            sortSuffixImage.ImageUrl = "~/StylePhotos/Down.png";
            sortSuffixImage.AlternateText = "Descending Order";
        }

        sortPrefixImage.Width = 15;
        sortSuffixImage.Width = 15;

        // Add the images to the appropriate header cell.
        headerRow.Cells[columnIndex].Controls.AddAt(0, sortPrefixImage);
        headerRow.Cells[columnIndex].Controls.Add(sortSuffixImage);
    }

    //<-----------------BEGIN NEW RECORD BUTTON CLICK----------------->
    protected void NewBuilding_Click(object sender, EventArgs e)
    {
        DetailsViewBuildings.ChangeMode(DetailsViewMode.Insert);
    }
    protected void NewType_Click(object sender, EventArgs e)
    {
        DetailsViewTypes.ChangeMode(DetailsViewMode.Insert);
    }

    protected void NewLogin_Click(object sender, EventArgs e)
    {
        DetailsViewLogin.ChangeMode(DetailsViewMode.Insert);
    }

    protected void NewPicture_Click(object sender, EventArgs e)
    {
        DetailsViewPictures.ChangeMode(DetailsViewMode.Insert);
    }

    protected void NewContact_Click(object sender, EventArgs e)
    {
        DetailsViewContacts.ChangeMode(DetailsViewMode.Insert);
    }
    //<-----------------END NEW RECORD BUTTON CLICK----------------->

    protected Int32 GetNextId(string tableName)
    {
        Int32 nextId = 0;

        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("SELECT IDENT_CURRENT('" + tableName + "')", connection);
            try
            {
                connection.Open();
                nextId = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
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

        return nextId;
    }

    //<-----------------BEGIN BUILDING DATA EVENTS----------------->
    protected void DetailsViewBuildings_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building. " +
                "Please try again.";
        }
        else
        {
            GridViewBuildings.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void DetailsViewBuildings_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        DetailsView dv = (DetailsView)sender;
        Label lblBuildingId = (Label)dv.FindControl("lblDetailsViewBuildingId");
        int buildingId = Convert.ToInt32(lblBuildingId.Text);

        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("ArchiveBuilding", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", buildingId);

                cmd.ExecuteNonQuery();
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

    protected void DetailsViewBuildings_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " + "<br>" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building. " +
                "Please try again.";
        }
        else
        {
            GridViewBuildings.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void DetailsViewBuildings_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else
        {
            GridViewBuildings.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void DetailsViewBuildingsArchive_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " + "<br>" +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building archive. " +
                "Please try again.";
        }
        else
        {
            GridViewBuildingsArchive.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    //<-----------------END BUILDING DATA EVENTS----------------->


    //<----------------BEGIN TYPES DATA EVENTS----------------->
    protected void DetailsViewTypes_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building type. " +
                "Please try again.";
        }
        else
        {
            GridViewTypes.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void DetailsViewTypes_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. <br>" +
                "Message: " + e.Exception.Message +
                "<br> Reason: Selected TYPE is currently held by one or more records in the BUILDINGS table.<br>" +
                "Solution: Delete or update any BUILDING record currently holding the selected TYPE.";
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building type. " +
                "Please try again.";
        }
        else
        {
            GridViewTypes.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void DetailsViewTypes_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else
        {
            GridViewTypes.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    //<-----------------END TYPE DATA EVENTS----------------->

    //<-----------------BEGIN LOGIN DATA EVENTS----------------->
    protected void DetailsViewLogin_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated this user's info. " +
                "Please try again.";
        }
        else
        {
            GridViewLogin.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void DetailsViewLogin_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        DetailsView dv = (DetailsView)sender;
        Label lblUserId = (Label)dv.FindControl("lblDetailsViewUserId");
        int userId = Convert.ToInt32(lblUserId.Text);

        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            try
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("ArchiveLogin", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@LogId", userId);

                cmd.ExecuteNonQuery();
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

    protected void DetailsViewLogin_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that login. " +
                "Please try again.";
        }
        else
        {
            GridViewLogin.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void DetailsViewLogin_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else
        {
            GridViewLogin.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void DetailsViewLoginArchive_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that login archive. " +
                "Please try again.";
        }
        else
        {
            GridViewLogin.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }

    //<-----------------END LOGIN DATA EVENTS----------------->

    //<-----------------BEGIN PICTURE DATA EVENTS----------------->
    protected void DetailsViewPictures_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else
        {
            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                DetailsView dv = (DetailsView)sender;
                FileUpload fu = (FileUpload)dv.FindControl("UploadPicture");

                try
                {
                    string buildingName, buildingType;

                    connection.Open();
                    SqlCommand cmd = new SqlCommand("getBuilding", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", e.Values["buildId"].ToString());
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        buildingName = reader["Name"].ToString();
                        buildingType = reader["Type"].ToString();

                        buildingName = replaceInvalidCharacters(buildingName);
                        buildingType = replaceInvalidCharacters(buildingType);

                        fu.SaveAs(AppDomain.CurrentDomain.BaseDirectory + "\\\\LocationPhotos\\\\" + buildingType + "\\\\" + buildingName + "\\\\" + fu.FileName);
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

                GridViewPictures.DataBind();
                Response.Redirect(Request.RawUrl);
            }
        }
    }

    protected void DetailsViewPictures_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated this user's info. " +
                "Please try again.";
        }
        else
        {
            string oldBuildId = e.OldValues["buildId"].ToString();
            string newBuildId = e.NewValues["buildId"].ToString();

            // Not sure if this works
            if (oldBuildId != newBuildId)
            {
                using (SqlConnection connection = new SqlConnection(GetConnectionString()))
                {
                    try
                    {
                        string oldBuildingName, oldBuildingType, newBuildingName, newBuildingType;

                        connection.Open();
                        SqlCommand cmd1 = new SqlCommand("getBuilding", connection);
                        cmd1.CommandType = CommandType.StoredProcedure;
                        cmd1.Parameters.AddWithValue("@Id", oldBuildId);
                        SqlDataReader reader1 = cmd1.ExecuteReader();

                        if (reader1.Read())
                        {
                            oldBuildingName = reader1["Name"].ToString();
                            oldBuildingType = reader1["Type"].ToString();

                            oldBuildingName = replaceInvalidCharacters(oldBuildingName);
                            oldBuildingType = replaceInvalidCharacters(oldBuildingType);

                            reader1.Close();

                            SqlCommand cmd2 = new SqlCommand("getBuilding", connection);
                            cmd2.CommandType = CommandType.StoredProcedure;
                            cmd2.Parameters.AddWithValue("@Id", newBuildId);
                            SqlDataReader reader2 = cmd2.ExecuteReader();

                            if (reader2.Read())
                            {
                                newBuildingName = reader2["Name"].ToString();
                                newBuildingType = reader2["Type"].ToString();

                                newBuildingName = replaceInvalidCharacters(newBuildingName);
                                newBuildingType = replaceInvalidCharacters(newBuildingType);

                                if (!Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + newBuildingType))
                                {
                                    Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + newBuildingType);
                                }

                                if (!Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + newBuildingType + "\\\\" + newBuildingName))
                                {
                                    Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + newBuildingType + "\\\\" + newBuildingName);
                                }

                                DetailsView dv = (DetailsView)sender;
                                Label lblDetailsViewRefLoc = (Label)dv.FindControl("lblDetailsViewRefLoc");

                                int lastSlashIndex = 0;

                                for (int x = 0; x < lblDetailsViewRefLoc.Text.Length; x++)
                                {
                                    if (lblDetailsViewRefLoc.Text[x] == '\\')
                                    {
                                        lastSlashIndex = x;
                                    }
                                }

                                string fileName = lblDetailsViewRefLoc.Text.Substring(lastSlashIndex + 1);

                                string oldDirectory = AppDomain.CurrentDomain.BaseDirectory + "\\\\LocationPhotos\\\\" + oldBuildingType + "\\\\" + oldBuildingName + "\\\\" + fileName;
                                string newDirectory = AppDomain.CurrentDomain.BaseDirectory + "\\\\LocationPhotos\\\\" + newBuildingType + "\\\\" + newBuildingName + "\\\\" + fileName;

                                File.Move(oldDirectory, newDirectory);
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

                    GridViewPictures.DataBind();
                    Response.Redirect(Request.RawUrl);
                }
            }
            GridViewPictures.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void DetailsViewPictures_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building. " +
                "Please try again.";
        }
        else
        {
            GridViewPictures.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    //<-----------------END PICTURE DATA EVENTS----------------->


    //<-----------------BEGIN CONTACT DATA EVENTS----------------->
    protected void DetailsViewContacts_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building. " +
                "Please try again.";
        }
        else
        {
            GridViewContacts.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void DetailsViewContacts_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that building. " +
                "Please try again.";
        }
        else
        {
            GridViewContacts.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void DetailsViewContacts_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
        }
        else
        {
            GridViewContacts.DataBind();
            Response.Redirect(Request.RawUrl);
        }
    }
    //<-----------------END CONTACT DATA EVENTS----------------->

    protected void DetailsViewPictures_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            try
            {
                string buildingName, buildingType;

                connection.Open();
                SqlCommand cmd = new SqlCommand("getBuilding", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", e.Values["buildId"].ToString());
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    buildingName = reader["Name"].ToString();
                    buildingType = reader["Type"].ToString();

                    buildingName = replaceInvalidCharacters(buildingName);
                    buildingType = replaceInvalidCharacters(buildingType);

                    if (!Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + buildingType))
                    {
                        Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + buildingType);
                    }

                    if (!Directory.Exists(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + buildingType + "\\\\" + buildingName))
                    {
                        Directory.CreateDirectory(AppDomain.CurrentDomain.BaseDirectory + "LocationPhotos\\\\" + buildingType + "\\\\" + buildingName);
                    }

                    DetailsView dv = (DetailsView)sender;
                    FileUpload fu = (FileUpload)dv.FindControl("UploadPicture");
                    SqlDataSourcePictureDetails.InsertParameters.Add("refLoc", "~\\\\LocationPhotos\\\\" + buildingType + "\\\\" + buildingName + "\\\\" + fu.PostedFile.FileName);
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
    }

    private string replaceInvalidCharacters(string path)
    {
        path = path.Replace('\\', '_');
        path = path.Replace('/', '_');
        path = path.Replace('~', '_');
        path = path.Replace('#', '_');
        path = path.Replace('%', '_');
        path = path.Replace('&', '_');
        path = path.Replace('*', '_');
        path = path.Replace('[', '_');
        path = path.Replace(']', '_');
        path = path.Replace(':', '_');
        path = path.Replace('<', '_');
        path = path.Replace('>', '_');
        path = path.Replace('?', '_');
        path = path.Replace('|', '_');
        path = path.Replace('"', '_');

        return path;
    }

    protected void DetailsViewPictures_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(GetConnectionString()))
        {
            try
            {
                string buildingName, buildingType;
                DetailsView dv = (DetailsView)sender;
                TextBox txtBuildId = (TextBox)dv.FindControl("txtDetailsViewBuildID");
                Label lblDetailsViewRefLoc = (Label)dv.FindControl("lblDetailsViewRefLoc");
                int lastSlashIndex = 0;

                for (int x = 0; x < lblDetailsViewRefLoc.Text.Length; x++)
                {
                    if (lblDetailsViewRefLoc.Text[x] == '\\')
                    {
                        lastSlashIndex = x;
                    }
                }

                string fileName = lblDetailsViewRefLoc.Text.Substring(lastSlashIndex + 1);

                connection.Open();
                SqlCommand cmd = new SqlCommand("getBuilding", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", txtBuildId.Text);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    buildingName = reader["Name"].ToString();
                    buildingType = reader["Type"].ToString();

                    buildingName = replaceInvalidCharacters(buildingName);
                    buildingType = replaceInvalidCharacters(buildingType);

                    SqlDataSourcePictureDetails.UpdateParameters.Add("refLoc", "~\\\\LocationPhotos\\\\" + buildingType + "\\\\" + buildingName + "\\\\" + fileName);
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
    }
}