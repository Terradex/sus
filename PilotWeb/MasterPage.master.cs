using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
//using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        linkLogin.InnerText = "Login";
        if (Session["LoggedUserId"] != null)
        {
            if (!Session["LoggedUserId"].Equals(String.Empty))
            {
                linkLogin.InnerText = "Logout";
                //linkProfile.Visible = true;
            }
            else
                linkLogin.InnerText = "Login";
        }
        else
            linkLogin.InnerText = "Login";
    }

    public void linkLogin_Clicked(object sender, EventArgs e)
    {
        int userId = Convert.ToInt32(Session["LoggedUserId"]);
        if (linkLogin.InnerText.Equals("Logout"))
        {
            Session["LoggedUserId"] = null;
            Session["LoggedUserPassword"] = null;
            Session["LoggedAdminId"] = null;
            Session["IsBusinessProfile"] = null;
            linkLogin.InnerText = "Login";
            //linkProfile.Visible = false;
        }
        Response.Redirect("LogIn.aspx");
    }
}
