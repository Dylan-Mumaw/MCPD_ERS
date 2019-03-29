using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Maintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    protected void GridViewBuildings_RowCreated(Object sender, GridViewRowEventArgs e)
    {
        SetArrows(sender, e);
    }
    protected void GridViewTypes_RowCreated(Object sender, GridViewRowEventArgs e)
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
        if(GridViewBeingSorted.SortExpression == "")
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
    protected void DetailsViewBuildings_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
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
            lblError.Text = "A database error has occured. " +
                "Message: " + e.Exception.Message;
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
            lblError.Text = "Another user may have updated that building. " +
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
            GridViewPictures.DataBind();
            Response.Redirect(Request.RawUrl);
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
}