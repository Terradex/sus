using System;

using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;


/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
    public Helper()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static bool SendEmail(string userEmail)
    {
        try
        {
            //string sender_address = ConfigurationManager.AppSettings["sender_address"];
            //string sender_password = ConfigurationManager.AppSettings["sender_password"];
            //string smtp_host = ConfigurationManager.AppSettings["smtp_host"];
            //string receiver_address = ConfigurationManager.AppSettings["receiver_address"];
            //string receiver_name = ConfigurationManager.AppSettings["receiver_name"];

            string sender_address = "saaima.yaqub@gmail.com";
            string sender_password = "albaqarah333";
            string smtp_host = "smtp.gmail.com";
            string receiver_address = "saaima.yaqub@gmail.com";
            string receiver_name = "Receivers Name";

            string subject = "Forgot Password Request";
            string body = "Hi " + receiver_name + "," + "<br><br>";
            body = body + "This is to inform you that the user registered on www.terradex.com with the email address <i>" + userEmail + "</i> has forgot his password. Please contact this user.<br> Thanks." + "<br><br>";
            body = body + "Terradex.com";
            body = body + "<br><br>";

            MailMessage message = new MailMessage(sender_address, receiver_address, subject, body);
            message.IsBodyHtml = true;
            
            SmtpClient mailClient = new SmtpClient(smtp_host);
            System.Net.NetworkCredential nCredentials = new System.Net.NetworkCredential(sender_address,sender_password);
            mailClient.Port = 25;
            mailClient.UseDefaultCredentials = false;
            mailClient.Credentials = nCredentials;
            mailClient.Send(message);
            return true;
        }
        catch
        {
            throw;
            //return false;
        }
    }

    

    }

