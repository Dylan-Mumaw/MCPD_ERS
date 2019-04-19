<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public class Handler : IHttpHandler
{

    int buildID = 0;
    public void ProcessRequest(HttpContext context)
    {

        if (context.Request.QueryString["buildID"] != null)
        {
            buildID = Convert.ToInt16(context.Request.QueryString["buildID"]);
            context.Response.ContentType = "Int16";
            DisplayGallery();

            //Stream strm = DisplayGallery(buildID);

            //byte[] buffer = new byte[4096];
            //int byteSeq = strm.Read(buffer, 0, 4096);

            //while (byteSeq > 0)
            //{
            //    context.Response.OutputStream.Write(buffer, 0, byteSeq);
            //    byteSeq = strm.Read(buffer, 0, 4096);
            //}


        }
        else
        {
            context.Response.Write("No Image Found");
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public void DisplayGallery()
    {

        DataTable dt = new DataTable();
        SqlConnection connection = new SqlConnection(GetConnectionString());

        try
        {

            connection.Open();
            SqlCommand sqlCmd = new SqlCommand("BuildRefLoc", connection)
            {
                CommandType = CommandType.StoredProcedure
            };
            sqlCmd.Parameters.AddWithValue("@buildID", buildID);
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




        //connection.Open();
        //SqlCommand cmd = new SqlCommand("Select Photo from Members where Member_No = @ID", con);
        //cmd.CommandType = CommandType.Text;
        //cmd.Parameters.AddWithValue("@ID", picId);

        //object img = cmd.ExecuteScalar();

        //try
        //{
        //    return new MemoryStream((byte[])img);
        //}
        //catch
        //{
        //    return null;
        //}
        //finally
        //{
        //    connection.Close();
        //}

    }
    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

}