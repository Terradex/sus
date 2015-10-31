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

public partial class Login : System.Web.UI.Page
{
    public static bool isNewUser = true;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCurrentUser_Click(object sender, EventArgs e)
    {
        try
        {
            Session["LoggedUserId"] = null;
            dsUser.UserInfoRow row = UserBL.GetUserInfo(txtEmail.Text, txtPassword.Text);
            if (row != null)
            {
                this.lblResult.Text = "Logged in successfully.";
                lblSaveResult.Text = "";
                lblRebateResult.Text = "";
                isNewUser = false;
                int subscriberId = row.UserID;
                Session["LoggedUserId"] = subscriberId;
                HtmlAnchor linkLogin = (HtmlAnchor)this.Master.FindControl("linkLogin");
                linkLogin.InnerText = "Logout";
                //Load User Information
                txtFName.Text = row.FName;
                txtLName.Text = row.LName;
                txtStreet.Text = row.Street;
                txtApartment.Text = row.Apartment;
                txtCity.Text = row.City;
                txtState.Text = row.State;
                txtZip.Text = row.ZIP;
                txtPhone.Text = row.Phone;
                txtPassword.Text = row.logonPW;
                txtUtilityAccountNumber.Text = row.UtilityAccountNumber;
                //Billing Info
                txtB_FName.Text = row.B_FName;
                txtB_LName.Text = row.B_LName;
                txtB_Street.Text = row.B_Street;
                txtB_Apartment.Text = row.B_Apartment;
                txtB_City.Text = row.B_City;
                txtB_State.Text = row.B_State;
                txtB_Zip.Text = row.B_ZIP;
                txtB_Phone.Text = row.B_Phone;
                txtB_Email.Text = row.B_email;
            }
            else
            {
                this.lblResult.Text = "Invalid Username and/or Password";
                isNewUser = true;
            }
        }
        catch
        {
            lblResult.Text = "Error occurred. Please try later.";
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblResult.Text = "";
        try
        {
            dsUser.UserInfoDataTable tbUserInfo = new dsUser.UserInfoDataTable();
            PilotDL.dsUserTableAdapters.UserInfoTableAdapter taUserInfo = new PilotDL.dsUserTableAdapters.UserInfoTableAdapter();
            dsUser.UserInfoRow row = tbUserInfo.NewUserInfoRow();
                        
            //Save User Information
            row.FName = txtFName.Text;
            row.LName = txtLName.Text;
            row.Street = txtStreet.Text;
            row.Apartment = txtApartment.Text;
            row.City = txtCity.Text;
            row.Phone = txtPhone.Text;
            row.State = txtState.Text;
            row.ZIP = txtZip.Text;
            
            row.UtilityAccountNumber = txtUtilityAccountNumber.Text;

            //Save Billing Info
            row.B_FName = txtB_FName.Text;
            row.B_LName = txtB_LName.Text;
            row.B_Street = txtB_Street.Text;
            row.B_Apartment = txtB_Apartment.Text;
            row.B_City = txtB_City.Text;
            row.B_State = txtB_State.Text;
            row.B_ZIP = txtB_Zip.Text;
            row.B_Phone = txtB_Phone.Text;
            row.B_email = txtB_Email.Text;

            if (Session["LoggedUserId"] != null)
            {
                if (!Session["LoggedUserId"].Equals(string.Empty))
                {
                    row.UserID = Convert.ToInt32(Session["LoggedUserId"]);
                    row.logonEmail = txtEmail.Text;
                    if (!txtPassword.Text.Equals(string.Empty))
                        row.logonPW = txtPassword.Text;
                    else
                        row.logonPW = "";
                    if(UserBL.UpdateUserInfo(row))
                        lblSaveResult.Text = "Information Successfully Saved.";
                    else
                        lblSaveResult.Text = "Error Occurred. Please Try Later.";
                }
                else
                {
                    //row.logonEmail = txtEmail_NewUser.Text;
                    //row.logonPW = txtPassword_NewUser.Text;
                    InsertNewUser(row);
                    return;
                }
            }
            else
            {
                //row.logonEmail = txtEmail_NewUser.Text;
                //row.logonPW = txtPassword_NewUser.Text;
                InsertNewUser(row);
            }
        }
        catch
        {
            lblSaveResult.Text = "Error occured. Please try later.";
        }
    }

    private void InsertNewUser(dsUser.UserInfoRow row)
    {
        try
        {
            if (txtEmail_NewUser.Text.Equals(string.Empty) || txtPassword_NewUser.Text.Equals(string.Empty))
            {
                lblSaveResult.Text = "Email and/or password can not be empty.";
                return;
            }
            int userId = 0;
            row.logonEmail = txtEmail_NewUser.Text;
            row.logonPW = txtPassword_NewUser.Text;
            if (UserBL.InsertUserInfo(row) > 0)
            {
                userId = UserBL.GetUserId(row.logonEmail, row.logonPW);
                Session["LoggedUserId"] = userId;
                HtmlAnchor linkLogin = (HtmlAnchor)this.Master.FindControl("linkLogin");
                linkLogin.InnerText = "Logout";
                lblSaveResult.Text = "Your Account is Successfully Registered.";
            }
        }
        catch
        {
            lblSaveResult.Text = "Error occured. Please try later.";
        }
    }

    protected void btnShowRebateForm_Click(object sender, EventArgs e)
    {
        try
        {         
            int tdxTermsID, ratingModelTdxID;
            int userId = -1;
            decimal rebateAmount = 0;
            if (Session["LoggedUserId"] != null)
            {
                if (!Session["LoggedUserId"].Equals(string.Empty))
                {
                    userId = Convert.ToInt32(Session["LoggedUserId"]);
                }
                else
                {
                    lblRebateResult.Text = "Sorry. You are not logged in.";
                    return;
                }
            }
            else
            {
                lblRebateResult.Text = "Sorry. You are not logged in.";
                return;
            }
            tdxTermsID = Convert.ToInt32(Request.QueryString["TdxTermsID"]);
            ratingModelTdxID = Convert.ToInt32(Request.QueryString["RatingModelTdxID"]);
            rebateAmount = Convert.ToDecimal(Request.QueryString["RebateAmount"]);
            int confirmationId =  UserBL.GetConfirmationID(userId, tdxTermsID, ratingModelTdxID, rebateAmount);
            Response.Redirect("RebateForm.aspx?ConfirmationId="+confirmationId);
        }
        catch 
        {
            lblRebateResult.Text = "Error occurred.";
        }
    }

}
