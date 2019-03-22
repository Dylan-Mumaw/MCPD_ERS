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

    protected void newBuilding_Click(object sender, EventArgs e)
    {
        DetailsViewBuildings.ChangeMode(DetailsViewMode.Insert);
    }
    protected void newType_Click(object sender, EventArgs e)
    {
        DetailsViewTypes.ChangeMode(DetailsViewMode.Insert);
    }

    protected void newLogin_Click(object sender, EventArgs e)
    {
        DetailsViewLogin.ChangeMode(DetailsViewMode.Insert);
    }

    protected void newPicture_Click(object sender, EventArgs e)
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
        }
    }
}