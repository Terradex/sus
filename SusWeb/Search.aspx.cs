using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using PilotBL;

public partial class Search : System.Web.UI.Page
{
    static int selectedCategoryId = 3;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string zip = Request.QueryString["Zip"].ToString();
                int retailerId = Convert.ToInt32(Request.QueryString["RetailerId"]);
                int inputSize = Convert.ToInt32(Request.QueryString["InputSize"]);
                int categoryId = Convert.ToInt32(Request.QueryString["CategoryId"]);
                string boxRate = Request.QueryString["BoxRate"].ToString();
                BindSearchResults(zip, categoryId, retailerId, inputSize, boxRate); 
            }
        }catch {}
    }

    private double GetBoxRate()
    {
        if (txtBoxRate.Text.Equals(string.Empty))
            return Convert.ToDouble(SearchBL.GetDefaultBoxRate(txtZip.Text));
        else
        {
            try
            {
                return Convert.ToDouble(txtZip.Text);
            }
            catch
            {
                lblError.Text = "You have entered an invalid value for Box Rate";
                return 0;
            }
        }
    }

    protected void ddModel_DataBound(object sender, EventArgs e)
    {
        if (ddModel.Items.Count > 1)
            ddModel.SelectedIndex = 1;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        //Highlight default Category
        GridViewRow row = gvCategories.Rows[0];
        //((LinkButton)row.FindControl("btnCategory")).CssClass = "selected";
        ((HtmlTable)row.FindControl("tblCategories")).Attributes.CssStyle.Value = "selected";
        BindSearchResults();
    }
    protected void gvCategories_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        lblError.Text = "";
        selectedCategoryId = Convert.ToInt32(e.CommandArgument);
        
        //Remove css from all the rows
        GridViewRow row;
        for (int i = 0; i < gvCategories.Rows.Count; i++)
        {
             row = gvCategories.Rows[i];
             ((LinkButton)row.FindControl("btnCategory")).CssClass = "";
        }
        //Apply css to selected row
        GridViewRow selectedRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        LinkButton btnCategory = (LinkButton)selectedRow.FindControl("btnCategory");
        btnCategory.CssClass = "selected";
        //((HtmlTable)selectedRow.FindControl("tblCategories")).Attributes.CssStyle.Value = "selected";

        HighlightSelectedCategory();
        BindSearchResults();
    }

    private void HighlightSelectedCategory()
    {
        //throw new NotImplementedException();
    }

    protected void BindSearchResults()
    {
        DataTable dt = SearchBL.GetSearchResults(txtZip.Text, selectedCategoryId, Convert.ToInt32(ddRetailers.SelectedValue), Convert.ToInt32(ddModel.SelectedValue),txtBoxRate.Text);
        gvProducts.DataSource = dt;
        gvProducts.DataBind();
        lblResultCount.Text = dt.Rows.Count + " Results Found.";
        BindRetailers();
    }
    protected void BindSearchResults(string zip,int categoryId,int retailerId,int inputSize,string boxRate)
    {
        try
        {
            txtZip.Text = zip;
            selectedCategoryId = categoryId;
            //ddRetailers.DataBind();
            //ddRetailers.SelectedValue = retailerId.ToString();
            //ddModel.DataBind();
            //ddModel.SelectedValue = inputSize.ToString();
            DataTable dt = SearchBL.GetSearchResults(zip, categoryId, retailerId, inputSize,boxRate);
            gvProducts.DataSource = dt;
            gvProducts.DataBind();
            lblResultCount.Text = dt.Rows.Count + " Results Found.";
            BindRetailers(retailerId);
        }catch{}
    }

    protected void BindRetailers()
    {
        int index = 0;
        int ratingModelTdxId = -1;

        if (gvProducts.DataKeys.Count>0)
        {
            IEnumerator retailersListEnum = gvProducts.DataKeys.GetEnumerator();
            retailersListEnum.MoveNext();
            do
            {
                ratingModelTdxId = Convert.ToInt32(gvProducts.DataKeys[index]["RatingModelTdxID"]);
                GridView gvRetailers = (GridView)gvProducts.Rows[index].FindControl("gvRetailerList");
                gvRetailers.DataSource = SearchBL.SP_20_GetRetailersList(ratingModelTdxId, Convert.ToInt32(ddRetailers.SelectedValue));
                gvRetailers.DataBind();
                index++;
            } while (retailersListEnum.MoveNext()); 
        }
    }
    protected void BindRetailers(int retailerId)
    {
        int index = 0;
        int ratingModelTdxId = -1;

        if (gvProducts.DataKeys.Count > 0)
        {
            IEnumerator retailersListEnum = gvProducts.DataKeys.GetEnumerator();
            retailersListEnum.MoveNext();
            do
            {
                ratingModelTdxId = Convert.ToInt32(gvProducts.DataKeys[index]["RatingModelTdxID"]);
                GridView gvRetailers = (GridView)gvProducts.Rows[index].FindControl("gvRetailerList");
                gvRetailers.DataSource = SearchBL.SP_20_GetRetailersList(ratingModelTdxId, retailerId);
                gvRetailers.DataBind();
                index++;
            } while (retailersListEnum.MoveNext());
        }
    }

    protected void ddModel_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindSearchResults();
    }
    protected void ddRetailers_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindSearchResults();
    }

    protected void gvCategories_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
        //e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
    }

    protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        lblError.Text = "";
        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        int currentIndex = row.RowIndex;
        int tdxTermsID=0, ratingModelTdxID=0, tdxIncentiveId=0;
        double rebateAmount = 0;
        string[] keys = gvProducts.DataKeyNames;
        try{
            tdxTermsID = Convert.ToInt32(gvProducts.DataKeys[currentIndex]["TdxTermsID"]);
        }catch{}
        try{
        ratingModelTdxID = Convert.ToInt32(gvProducts.DataKeys[currentIndex]["RatingModelTdxID"]);
        }catch{}
        try{
        rebateAmount = Convert.ToDouble(gvProducts.DataKeys[currentIndex]["RebateAmount"]);
    }catch{}
        try
        {
            tdxIncentiveId = Convert.ToInt32(gvProducts.DataKeys[currentIndex]["TdxIncentiveID"]);
        }
        catch
        {
            lblError.Text = "Sorry. Rebate Details are not available for this item.";
            return;
        }
        Response.Redirect("RebateDetails.aspx?TdxTermsID=" + tdxTermsID + "&RatingModelTdxID=" + ratingModelTdxID + "&RebateAmount=" + rebateAmount + "&CategoryId=" + selectedCategoryId + "&RetailerId=" + ddRetailers.SelectedValue + "&InputSize=" + ddModel.SelectedValue + "&Zip=" + txtZip.Text + "&TdxIncentiveId=" + tdxIncentiveId + "&BoxRate=" + txtBoxRate.Text);
    }
}

