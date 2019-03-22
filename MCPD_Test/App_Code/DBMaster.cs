using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBMaster
/// </summary>
public class DBMaster
{
    public DBMaster()
    {
        
    }
    public SqlDataReader getReader(string query)
    {
        SqlConnection connection = new SqlConnection(GetConnectionString());
        SqlCommand sqlCmd = new SqlCommand(query);
        connection.Open();
        sqlCmd.CommandType = System.Data.CommandType.Text;
        sqlCmd.Connection = connection;

        SqlDataReader reader = sqlCmd.ExecuteReader();
        return reader;
    }
    private string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }
}