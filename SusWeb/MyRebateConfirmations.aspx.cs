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

public partial class MyRebateConfirmations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int userId = -1;
        if (Session["LoggedUserId"] != null)
        {
            if (!Session["LoggedUserId"].Equals(string.Empty))
            {
                userId = Convert.ToInt32(Session["LoggedUserId"]);
            }
            else
            {
                lblMesasge.Text = "Sorry. You are not logged in.";
                return;
            }
        }
        else
        {
            lblMesasge.Text = "Sorry. You are not logged in.";
            return;
        }
    }
}
