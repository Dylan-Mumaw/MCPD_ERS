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
        /*
        string firstName = TextBoxFirstName.Text;
        string lastName = TextBoxLastName.Text;
        string empPosition = RadioEmployeeLevel.SelectedValue;
        string empNumber = TextBoxID.Text;
        string phoneNumber = TextBoxPhone.Text;
        string address = TextBoxAddress.Text;
        string city = TextBoxCity.Text;
        string state = DropDownListState.SelectedValue.ToString().Trim();
        string ZIP = TextBoxZIP.Text;
        string email = TextBoxEmail.Text;

        MailAddress fromAddress = new MailAddress("Sender email goes here");
        MailAddress toAddress = new MailAddress("Recipient email goes here");
        MailMessage emailMsg = new MailMessage(fromAddress, toAddress)
        {
            Subject = ("Hey!"),

            Body = ("New User Account Requested." +
                    "\nUser Information: " +
                    "\nFirst Name: "  + firstName +
                    "\nLast Name: " + lastName +
                    "\nPosition: " + empPosition +
                    "\nEmployee ID Number: " + empNumber +
                    "\nPhone Number: " + phoneNumber +
                    "\nAddress: " + address +
                    "\nCity: " + city +
                    "\nState: " + state +
                    "\nZIP: " + ZIP +
                    "\nEmail: " + email)
        };

        //Creates SMTP client
        //Gmail used as test, replace with hosts domain
        //587 is the port number used by SMTP
        //If two-factor authentication is used on owner account, a permanent passphrase
        //can be created in clients account security settings
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
        {
            EnableSsl = true,
            Credentials = new System.Net.NetworkCredential("HOST'S EMAIL", "HOST'S PASSWORD"),
            DeliveryMethod = SmtpDeliveryMethod.Network
        };
        */

        try
        {
            //client.Send(emailMsg);
            //Response.Write("<B>Email has been sent successfully.</B>");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email has been sent successfully.')", true);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Exception caught in ButtonSubmit_Click(): {0}", ex.ToString());
        }
    }
}
