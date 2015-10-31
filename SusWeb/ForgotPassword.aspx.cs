using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (Helper.SendEmail(txtEmail.Text))
                lblResult.Text = "Password Recovery Request has been Sent. You will be contacted soon.";
            else
                lblResult.Text = "Error Occurred. Please try later.";
        }
        catch (Exception ex)
        {
            lblResult.Text = ex.InnerException.Message;
        }
    }
}
