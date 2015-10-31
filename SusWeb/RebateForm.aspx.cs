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
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

public partial class RebateForm : System.Web.UI.Page
{
    public static Misc.sp_052_displayConfirmationRow confirmDetailsRow;
    protected void Page_Load(object sender, EventArgs e)
    {
        int confirmationId = 0;
        if (Request.QueryString["ConfirmationID"] != null)
        {
            confirmationId = Convert.ToInt32(Request.QueryString["ConfirmationID"]);
            lblConfirmationID.Text = confirmationId.ToString();
            //Get all other details by confirmationid
            confirmDetailsRow = MiscBL.GetConfirmationDetails(confirmationId);
            if (confirmDetailsRow != null)
            {
                //Rebate Summary
                lblConfirmationID.Text = confirmDetailsRow["ConfirmationID"].ToString();
                lblUtilityName.Text = confirmDetailsRow["UtilityName"].ToString();
                lblIncentiveName.Text = confirmDetailsRow["IncentiveName"].ToString();
                lblSummary.Text = confirmDetailsRow["Summary"].ToString();
                //Item Purchased
                lblCategoryLabel.Text = confirmDetailsRow["CategoryLabel"].ToString();
                lblBrandName.Text = confirmDetailsRow["BrandName"].ToString();
                lblRatingModelNumber.Text = confirmDetailsRow["RatingModelNumber"].ToString();
                //My Information
                lblFName.Text = confirmDetailsRow["FName"].ToString();
                lblLName.Text = confirmDetailsRow["LName"].ToString();
                lblStreet.Text = confirmDetailsRow["Street"].ToString();
                lblApartment.Text = confirmDetailsRow["Apartment"].ToString();
                lblCity.Text = confirmDetailsRow["City"].ToString();
                lblState.Text = confirmDetailsRow["State"].ToString();
                lblZip.Text = confirmDetailsRow["Zip"].ToString();
                lblLogonEmail.Text = confirmDetailsRow["LogonEmail"].ToString();
                lblUtilityAccountNumber.Text = confirmDetailsRow["UtilityAccountNumber"].ToString();
                //Mail Rebate To
                lblContactFName.Text = confirmDetailsRow["ContactFName"].ToString();
                lblContactLName.Text = confirmDetailsRow["ContactLName"].ToString();
                lblContactDept.Text = confirmDetailsRow["ContactDept"].ToString();
                lblContactStreet.Text = confirmDetailsRow["ContactStreet"].ToString();
                lblContactCity.Text = confirmDetailsRow["ContactCity"].ToString();
                lblContactState.Text = confirmDetailsRow["ContactState"].ToString();
                lblContactZip.Text = confirmDetailsRow["ContactZip"].ToString();
                lblContactPhone.Text = confirmDetailsRow["ContactPhone"].ToString();
                lblContactWebsite.Text = confirmDetailsRow["ContactWebsite"].ToString();
                //Utility Bill Payer, if other than me
                lblB_FName.Text = confirmDetailsRow["B_FName"].ToString();
                lblB_LName.Text = confirmDetailsRow["B_LName"].ToString();
                lblB_Street.Text = confirmDetailsRow["B_Street"].ToString();
                lblB_Apartment.Text = confirmDetailsRow["B_Apartment"].ToString();
                lblB_City.Text = confirmDetailsRow["B_City"].ToString();
                lblB_Zip.Text = confirmDetailsRow["B_Zip"].ToString();
                lblB_Phone.Text = confirmDetailsRow["B_Phone"].ToString();
                lblB_Email.Text = confirmDetailsRow["B_Email"].ToString();
            }
        }
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        //string path = "D:\\RebateForm" + confirmDetailsRow.ConfirmationID + ".pdf";
        try
        {
            string path = Server.MapPath("temp/") + confirmDetailsRow.ConfirmationID + ".pdf";
            //string path = Server.MapPath(ConfigurationManager.AppSettings["ExportPath"] + confirmDetailsRow.ConfirmationID + ".pdf");
            //string path = ConfigurationManager.AppSettings["ExportPath"] + confirmDetailsRow.ConfirmationID + ".pdf";
            if (ExportPDF(path))
            {
                string fileLink = "temp/" + confirmDetailsRow.ConfirmationID + ".pdf";
                lblResult.Text = "Form data has been printed <a href='" + fileLink + "' target='_blank'>. Click here to open the file.</a>";
            }
            else
            {
                //lblResult.Text = "Error Occurred during print. Please try later.";
                lblResult.Text = "Error Occurred during print. Please try later.";
            }
        }
        catch (Exception ex)
        {
            lblResult.Text ="Message: \n" + ex.Message + " \n Trace: \n"+ ex.StackTrace + "\n InnerException: \n"  + ex.InnerException;
        }       
    }

    public static bool ExportPDF(string path)
    {
        try
        {
//            string path = "D:\\RebateForm" + confirmDetailsRow.ConfirmationID + ".pdf"; //Server.MapPath(ConfigurationManager.AppSettings["ExportPDF"] + misc.RandomString(6, true) + ".pdf");
            Document document = new Document(PageSize.A4, 3, 3, 10, 10);
            PdfWriter.GetInstance(document, new FileStream(path, FileMode.Create));

            Phrase ph = new Phrase("All Information Deemed Accurate but not Warranted\n EQUAL HOUSING OPPERTUNITY", FontFactory.GetFont(FontFactory.HELVETICA, 10, new Color(51, 51, 51)));
            HeaderFooter footer = new HeaderFooter(ph, false);
            footer.Border = 0;
            footer.Alignment = Element.ALIGN_CENTER;
            document.Footer = footer;

            document.Open();
            iTextSharp.text.Table tblMain = new iTextSharp.text.Table(2);
            tblMain.Border = 0;
            tblMain.DefaultCellBorder = 0;
            tblMain.Cellpadding = 2;
            SetTitle(confirmDetailsRow, tblMain);
            SetContactInfo(confirmDetailsRow, tblMain);

            document.Add(tblMain);
            document.Close();
            return true;
        }
        catch (Exception)
        {
            //return false;
            throw;
        }
    }
    protected static void SetTitle(Misc.sp_052_displayConfirmationRow row, iTextSharp.text.Table tblMain)
    {
        Cell CellTitle = new Cell();
        CellTitle.Colspan = 2;
        CellTitle.Add(GetTitlePhrase("Rebate Form (Confirmation ID " + row.ConfirmationID + ") \n\n"));
        CellTitle.HorizontalAlignment = Element.ALIGN_CENTER;
        tblMain.AddCell(CellTitle);
    }
    protected static void SetContactInfo(Misc.sp_052_displayConfirmationRow row, iTextSharp.text.Table tblMain)
    {
        Phrase ph = new Phrase();
        ph.Add(GetTextPhrase("--- Header Information ---\n", true, 14));
        ph.Add(GetTextPhrase("Confirmation Number:", true));
        ph.Add(GetTextPhrase(row.ConfirmationID+ "\n" , false));
        ph.Add(GetTextPhrase("UtilityName:", true));
        ph.Add(GetTextPhrase(row.UtilityName + "\n", false));
        tblMain.AddCell(ph);

        ph = new Phrase();
        ph.Add(GetTextPhrase("--- Rebate Summary ---\n", true, 14));
        ph.Add(GetTextPhrase("IncentiveName: ", true));
        ph.Add(GetTextPhrase(row.IncentiveName + "\n", false));
        ph.Add(GetTextPhrase("Summary: ", true));
        ph.Add(GetTextPhrase(row.Summary + "\n" , false));
        tblMain.AddCell(ph);

        ph = new Phrase();
        ph.Add(GetTextPhrase("--- Item Purchased ---\n", true, 14));
        ph.Add(GetTextPhrase("CategoryLabel:", true));
        ph.Add(GetTextPhrase(row.CategoryLabel + "\n", false));
        ph.Add(GetTextPhrase("BrandName: ", true));
        ph.Add(GetTextPhrase(row.BrandName + "\n" , false));
        ph.Add(GetTextPhrase("RatingModelNumber: ", true));
        ph.Add(GetTextPhrase(row.RatingModelNumber + "\n", false));
        tblMain.AddCell(ph);

        ph = new Phrase();
        ph.Add(GetTextPhrase("--- My Information ---\n", true, 14));
        ph.Add(GetTextPhrase("First Name:", true));
        ph.Add(GetTextPhrase(row.FName + "\n" , false));
        ph.Add(GetTextPhrase("Last Name: ", true));
        ph.Add(GetTextPhrase(row.LName + "\n", false));
        ph.Add(GetTextPhrase("Street: ", true));
        ph.Add(GetTextPhrase(row.Street + "\n" , false));
        ph.Add(GetTextPhrase("Apartment: ", true));
        ph.Add(GetTextPhrase(row.Apartment + "\n", false));
        ph.Add(GetTextPhrase("City: ", true));
        ph.Add(GetTextPhrase(row.City + "\n" , false));
        ph.Add(GetTextPhrase("State: ", true));
        ph.Add(GetTextPhrase(row.State + "\n", false));        
        ph.Add(GetTextPhrase("Zip: ", true));
        ph.Add(GetTextPhrase(row.ZIP + "\n" , false));
        ph.Add(GetTextPhrase("Logon Email: ", true));
        ph.Add(GetTextPhrase(row.logonEmail + "\n", false));
        ph.Add(GetTextPhrase("UtilityAccountNumber: \n", true));
        ph.Add(GetTextPhrase(row.UtilityAccountNumber + "\n" , false));
        tblMain.AddCell(ph);

        
        //Utility Bill Payer, if other than me
        ph = new Phrase();
        ph.Add(GetTextPhrase("--- Utility Bill Payer --- \n", true,14));
        ph.Add(GetTextPhrase(row.B_FName + "\n", false));
        ph.Add(GetTextPhrase(row.B_LName + "\n", false));
        ph.Add(GetTextPhrase(row.B_Street + "\n", false));
        ph.Add(GetTextPhrase(row.B_Apartment + "\n", false));
        ph.Add(GetTextPhrase(row.B_City + "\n", false));
        ph.Add(GetTextPhrase(row.B_ZIP + "\n", false));
        ph.Add(GetTextPhrase(row.B_Phone + "\n", false));
        ph.Add(GetTextPhrase(row.B_email + "\n", false));
        tblMain.AddCell(ph);

        ph = new Phrase();
        ph.Add(GetTextPhrase("--- Mail Rebate To --- \n", true, 14));
        ph.Add(GetTextPhrase(row.ContactFName + "\n", false));
        ph.Add(GetTextPhrase(row.ContactLName + "\n", false));
        ph.Add(GetTextPhrase(row.ContactDept + "\n", false));
        ph.Add(GetTextPhrase(row.ContactStreet + "\n", false));
        ph.Add(GetTextPhrase(row.ContactCity + "\n", false));
        ph.Add(GetTextPhrase(row.ContactState + "\n", false));
        ph.Add(GetTextPhrase(row.ContactZip + "\n", false));
        ph.Add(GetTextPhrase(row.ContactPhone + "\n", false));
        ph.Add(GetTextPhrase(row.ContactWebsite + "\n", false));
        tblMain.AddCell(ph);
    }

    protected static Phrase GetTitlePhrase(string Heading)
    {
        Phrase ph = new Phrase(Heading, FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16, new Color(204, 0, 0)));
        return ph;
    }

    protected static Phrase GetTextPhrase(string text, bool isBold)
    {
        string fontName = isBold ? FontFactory.HELVETICA_BOLD : FontFactory.HELVETICA;

        Phrase ph = new Phrase(text, FontFactory.GetFont(fontName, 10, new Color(51, 51, 51)));
        return ph;
    }
    protected static Phrase GetTextPhrase(string text, bool isBold, int Size)
    {
        string fontName = isBold ? FontFactory.HELVETICA_BOLD : FontFactory.HELVETICA;
        Phrase ph = new Phrase(text, FontFactory.GetFont(fontName, Size, new Color(51, 51, 51)));
        return ph;
    }
}
