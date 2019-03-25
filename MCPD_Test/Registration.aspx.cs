using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        MailAddress fromAddress = new MailAddress("SENDER GOES HERE");
        MailAddress toAddress = new MailAddress("RECIPIENT GOES HERE");
        MailMessage emailMsg = new MailMessage(fromAddress, toAddress)
        {
            Subject = ("Hey!"),

            Body = ("Nailed it")

        };

        //Creates SMTP client
        //Gmail used as test, replace with hosts domain
        //587 is Theme port number used by SMTP
        //If two-factor authentication is used on owner account, a permanent passphrase
        //can be created in account security settings
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
        {
            EnableSsl = true,
            Credentials = new System.Net.NetworkCredential("Email of owner account", "Password"),
            DeliveryMethod = SmtpDeliveryMethod.Network
        };

        try
        {
            client.Send(emailMsg);
            Response.Write("<B>Email Has been sent successfully.</B>");
        }
        catch (Exception ex)
        {
            Console.WriteLine("Exception caught in ButtonSubmit_Click(): { 0}", ex.ToString());
        }
    }
}
