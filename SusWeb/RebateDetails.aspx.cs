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
using PilotBL;
using PilotDL;
using PilotDL.SearchTableAdapters;

public partial class RebateDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int tdxIncentiveId = Convert.ToInt32(Request.QueryString["TdxIncentiveId"]);
        sp_050_text_detailsTableAdapter taRebateDetails = new sp_050_text_detailsTableAdapter();
        Hashtable rebateDetailsRow = SearchBL.GetRebateDetails(tdxIncentiveId);
        if (rebateDetailsRow != null)
        {
            lblIncentiveName.Text = rebateDetailsRow["IncentiveName"].ToString();
            lblSummary.Text = rebateDetailsRow["Summary"].ToString();
            lblEquipmentRequirements.Text = rebateDetailsRow["EquipmentRequirements"].ToString();
            lblInstallationRequirements.Text = rebateDetailsRow["InstallationRequirements"].ToString();
            lblProjectReviewCertification.Text = rebateDetailsRow["ProjectReviewCertification"].ToString();
            lblTerms.Text = rebateDetailsRow["Terms"].ToString();
            lblMaxLimit.Text = rebateDetailsRow["MaxLimit"].ToString();
            lblExpirationDate.Text = rebateDetailsRow["ExpirationDate"].ToString();
            lblIncentiveWebsite.Text = rebateDetailsRow["IncentiveWebsite"].ToString();
            lblContactFName.Text = rebateDetailsRow["ContactFName"].ToString();
            lblContactLName.Text = rebateDetailsRow["ContactLName"].ToString();
            lblContactDept.Text = rebateDetailsRow["ContactDept"].ToString();
            lblContactStreet.Text = rebateDetailsRow["ContactStreet"].ToString();
            lblContactCity.Text = rebateDetailsRow["ContactCity"].ToString();
            lblContactState.Text = rebateDetailsRow["ContactState"].ToString();
            lblContactZip.Text = rebateDetailsRow["ContactZip"].ToString();
            lblContactPhone.Text = rebateDetailsRow["ContactPhone"].ToString();
            lblContactWebsite.Text = rebateDetailsRow["ContactWebsite"].ToString();
        }
        else
        {
            //this.lblResult.Text = "Invalid Username and/or Password";
        }
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx?" + Request.QueryString.ToString());
        //Response.Redirect("Login.aspx" + Helper.AppendQueryString(Request.QueryString));
    }
    protected void btnBackToSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search.aspx?" + Request.QueryString.ToString());
        //Response.Redirect("Search.aspx" + Helper.AppendQueryString(Request.QueryString));
    }
}
