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
        //InitializeData();
        //GetBoxRate();
        //int selectedCategoryRowId = gvCategories.SelectedIndex;
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
        //double boxRate = 0;
        //if (!txtZip.Text.Equals(string.Empty))
        //    boxRate = GetBoxRate();
        BindSearchResults();
    }

    protected void gvCategories_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        selectedCategoryId = Convert.ToInt32(e.CommandArgument);
        //HighlightSelectedCategory();   
        BindSearchResults();
    }


    protected void BindSearchResults()
    {
        DataTable dt = SearchBL.GetSearchResults(txtZip.Text, selectedCategoryId, Convert.ToInt32(ddRetailers.SelectedValue), Convert.ToInt32(ddModel.SelectedValue));
        gvProducts.DataSource = dt;
        gvProducts.DataBind();
        lblResultCount.Text = dt.Rows.Count + " Results Found.";
        BindRetailers();
    }

    protected void BindRetailers()
    {
        int index = 0;
        int ratingModelTdxId = -1;
        IEnumerator retailersListEnum = gvProducts.DataKeys.GetEnumerator();
        retailersListEnum.MoveNext();
        do
        {
            ratingModelTdxId = Convert.ToInt32(gvProducts.DataKeys[index].Value);
            GridView gvRetailers = (GridView)gvProducts.Rows[index].FindControl("gvRetailerList");
            gvRetailers.DataSource = SearchBL.SP_20_GetRetailersList(ratingModelTdxId, Convert.ToInt32(ddRetailers.SelectedValue));
            gvRetailers.DataBind();
            index++;
        } while (retailersListEnum.MoveNext());
    }

    protected void ddModel_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindSearchResults();
    }
    protected void ddRetailers_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindSearchResults();
    }
    //protected void gvCategories_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //TableItemStyle style = gvCategories.SelectedRowStyle;
    //    //style.BackColor = System.Drawing.Color.Gray;
    //    //style.Font.Bold = true;
    //    int RowIndex = gvCategories.SelectedIndex;
    //    this.gvCategories.Rows[RowIndex].ControlStyle.BackColor = System.Drawing.Color.Yellow;
    //}
    //protected void HighlightSelectedCategory()
    //{
    //    try
    //    {
    //        int RowIndex = gvCategories.SelectedIndex;
    //        this.gvCategories.Rows[RowIndex].ControlStyle.BackColor = System.Drawing.Color.Yellow;
    //    }
    //    catch{}
    //    //TableItemStyle style = gvCategories.SelectedRowStyle;
    //    //style.BackColor = System.Drawing.Color.Gray;
    //    //style.Font.Bold = true;
    //    //gvCategories.DataBind();
    //}
    //protected void gvCategories_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    //{
    //    int RowIndex = gvCategories.SelectedIndex;
    //    this.gvCategories.Rows[RowIndex].ControlStyle.BackColor = System.Drawing.Color.Yellow;
    //}
    protected void gvCategories_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Attributes.Add("onMouseOver", "this.style.background='#eeff00'");
        e.Row.Attributes.Add("onMouseOut", "this.style.background='#ffffff'");
        //int index = e.Row.RowIndex;
        //string ratingTermsTdxId = "";
        //if (index > -1)
        //{
        //    try
        //    {
        //        ratingTermsTdxId = gvProducts.DataKeys[index].Value.ToString();
        //    }
        //    catch{}
        //}

        // gvProducts.DataKeyNames;
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    e.Row.Attributes.Add("onclick", "onGridViewRowSelected('" + e.Row.RowIndex.ToString() + "')");
        //}
    }
    protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //e.CommandName;
        // Dim cbPartID As String = CType(GridView2.Rows(i).Cells(1).Controls.Item(0).FindControl("ddPart"), DropDownList).SelectedValue
        GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        int currentIndex = row.RowIndex;
        int tdxIncentiveID, ratingModelTdxID, rebateAmount;

        string[] keys = gvProducts.DataKeyNames;
        tdxIncentiveID = Convert.ToInt32(gvProducts.DataKeys[currentIndex]["TdxIncentiveID"]);
        ratingModelTdxID = Convert.ToInt32(gvProducts.DataKeys[currentIndex]["RatingModelTdxID"]);
        rebateAmount = Convert.ToInt32(gvProducts.DataKeys[currentIndex]["RebateAmount"]);

        Response.Redirect("Login.aspx?tdxIncentiveID=" + tdxIncentiveID + "&ratingModelTdxID=" + ratingModelTdxID + "&rebateAmount=" + rebateAmount);

    }
}

