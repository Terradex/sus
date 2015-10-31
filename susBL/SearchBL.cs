using System;
using System.Collections;
using System.Data;
using PilotDL.SearchTableAdapters;
using PilotDL;

namespace PilotBL
{
    public class SearchBL
    {
        public static double GetDefaultBoxRate(string zip)
        {
            try
            {
                sp_004_box_rateTableAdapter taBoxRate = new sp_004_box_rateTableAdapter();
                Search.sp_004_box_rateDataTable dtBoxRate = taBoxRate.GetBoxRate(zip);
                string utilityRate = dtBoxRate.Rows[0]["BoxRate"].ToString();
                return Convert.ToDouble(utilityRate);
            }
            catch
            {
                return 0;
            }
        }

        //@hHSize float =2, /*default 2 people, provided by sp_003_menu_HHsize @inputSize*/
        //@ratingModelTdxID int =0, /*for test use 903774*/
        //@utilityID int=0 /* test ID 7047*/

        //1.) inputSize: user provided HouseHold Size, default is 2 , sp_003_menu_HHsize 
        //2.) RatingModelTdxID: from sp dbo.sp_010_select_IDs_terms_product
        //3.) UtilityID:  from sp dbo.sp_010_select_IDs_terms_product
        //TEST VALUES:
        // zip = 94303, categoryTdxID=3

        public static DataTable GetSearchResults(string zip, int categoryTdxID, int retailerID_min, int inputSize, string utilityRateCentsPerUnitInput)
        {
            DataTable dtSearchResults = GetSchemaForSearchResultDataTable();
            int utilityID = SP_10_GetUtilityID(zip, categoryTdxID);
            int tdxTermsID = SP_10_GetTdxTermsID(zip, categoryTdxID);
            double utilityRateCentsPerUnit;
            if (!utilityRateCentsPerUnitInput.Equals(string.Empty))
                utilityRateCentsPerUnit = Convert.ToDouble(utilityRateCentsPerUnitInput);
            else
                utilityRateCentsPerUnit = GetDefaultBoxRate(zip);
            int baseAmount = 100;
            ArrayList ratingModelTdxIDList = SP_10_GetRatingModelIDsList(categoryTdxID);
            int ratingModelTdxID = 0;
            //Bring only two results for the time being
            // for (int i = 0; i < 2; i++)
            for (int i = 0; i < ratingModelTdxIDList.Count; i++) 
            {
                DataRow resultRow = dtSearchResults.NewRow();
                ratingModelTdxID = Convert.ToInt32(ratingModelTdxIDList[i]);
                resultRow["RatingModelTdxID"] = ratingModelTdxID.ToString();
                resultRow["UtilityID"] = utilityID.ToString();
                resultRow["TdxTermsID"] = tdxTermsID.ToString();
                resultRow = SP_20_FillModelInfo(ratingModelTdxID, retailerID_min, resultRow);
                if (resultRow == null)
                    continue;
                resultRow = SP_30_FillIncentiveDetailsRebateCalc(tdxTermsID, baseAmount, resultRow);
                resultRow = SP_40_FillAnnualSavings(inputSize, ratingModelTdxID, utilityID,utilityRateCentsPerUnit, resultRow);
                if (resultRow == null)
                    continue;
                dtSearchResults.Rows.Add(resultRow);

            }
            return dtSearchResults;
        }
        private static DataRow SP_40_FillAnnualSavings(int inputSize, int ratingModelTdxID, int utilityID, double utilityRateCentsPerUnit, DataRow resultRow)
        {
            // KWH,CO2,$ = SP_40(inputSize,RatingModelTdxID,UtilityID)
            sp_040_calc_annual_SavingsTableAdapter taAnnualSavings = new sp_040_calc_annual_SavingsTableAdapter();
            Search.sp_040_calc_annual_SavingsDataTable dtAnnaulSavings = taAnnualSavings.CalcAnnualSavings(inputSize, ratingModelTdxID, utilityID, utilityRateCentsPerUnit);
            //Search.sp_040_calc_annual_SavingsDataTable dtAnnaulSavings = taAnnualSavings.CalcAnnualSavings(inputSize, 903398, utilityID);  
            //Get Above info into that partially filled result row which comes as input            
            if (dtAnnaulSavings.Rows.Count > 0)
            {
                resultRow["KWHSavings"] = dtAnnaulSavings.Rows[0]["KWHSavings"];
                resultRow["CO2SavingsLbs"] = dtAnnaulSavings.Rows[0]["CO2SavingsLbs"];
                resultRow["DollarSavings"] = dtAnnaulSavings.Rows[0]["DollarSavings"];
                resultRow["InputSize"] = inputSize.ToString();
            }
            else
                return null;
            //return result row after filling in model info into this
            return resultRow;
        }
        private static DataRow SP_30_FillIncentiveDetailsRebateCalc(int tdxTermsID, int baseAmount, DataRow resultRow)
        {
            // RebateAmount,UtilityLogoURL,TdxIncentiveID,RatingModelTdxID = SP_30(tdxTermsID,baseAmountForRebateCalculation-hardcoded)
            sp_030_select_incentive_details_rebateCalcTableAdapter taIncentiveDetailRebateCalc = new sp_030_select_incentive_details_rebateCalcTableAdapter();
            Search.sp_030_select_incentive_details_rebateCalcDataTable dtIncentiveDetailRebateCalc = taIncentiveDetailRebateCalc.GetIncentiveDetailsRebateCalc(tdxTermsID, baseAmount);

            //Get Above info into that partially filled result row which comes as input            
            if (dtIncentiveDetailRebateCalc.Rows.Count > 0)
            {
                resultRow["RebateAmount"] = dtIncentiveDetailRebateCalc.Rows[0]["RebateAmount"];
                resultRow["UtilityLogoURL"] = dtIncentiveDetailRebateCalc.Rows[0]["UtilityLogoURL"];
                resultRow["TdxIncentiveID"] = dtIncentiveDetailRebateCalc.Rows[0]["TdxIncentiveID"];
            }

            //return result row after filling in model info into this
            return resultRow;
        }
        public static DataTable SP_20_GetRetailersList(int ratingModelTdxID, int retailerID_min)
        {
            sp_054_select_retailer_URLsTableAdapter taRetailerURLs = new sp_054_select_retailer_URLsTableAdapter();
            Search.sp_054_select_retailer_URLsDataTable dtRetailerURLs = taRetailerURLs.GetRetailersList(ratingModelTdxID, retailerID_min);
            return dtRetailerURLs;
        }
        private static DataRow SP_20_FillModelInfo(int ratingModelTdxID, int retailerID_min, DataRow resultRow)
        {
            // BrandName, BrandModel, ProdImgURL,ProdDesc = SP_20(RatingModelTdxID,@retailerID_min)
            sp_020_select_model_info_for_selectedRetailerTableAdapter taModelInfo = new sp_020_select_model_info_for_selectedRetailerTableAdapter();
            Search.sp_020_select_model_info_for_selectedRetailerDataTable dtModelInfo = taModelInfo.GetModelInfo(ratingModelTdxID, retailerID_min);

            //Get Above info into that partially filled result row which comes as input            
            if (dtModelInfo.Rows.Count > 0)
            {
                resultRow["BrandName"] = dtModelInfo.Rows[0]["BrandName"];
                resultRow["BrandModel"] = dtModelInfo.Rows[0]["BrandModel"];
                resultRow["ProdImgURL"] = dtModelInfo.Rows[0]["ProdImgURL"];
                resultRow["ProdDesc"] = dtModelInfo.Rows[0]["ProdDesc"];
            }
            else
                return null;
            //return result row after filling in model info into this
            return resultRow;
        }
        public static int SP_10_GetUtilityID(string zip, int categoryTdxID)
        {
            int utilityID = 0;
            sp_010_select_IDs_terms_productTableAdapter taSP10 = new sp_010_select_IDs_terms_productTableAdapter();
            Search.sp_010_select_IDs_terms_productDataTable dtSP10 = taSP10.GetData(zip, categoryTdxID);
            for (int i = 0; i < dtSP10.Rows.Count; i++)
            {
                utilityID = Convert.ToInt32(dtSP10.Rows[i]["UtilityID"]);
            }
            return utilityID;
        }
        public static int SP_10_GetTdxTermsID(string zip, int categoryTdxID)
        {
            int tdxTermsID = 0;
            sp_010_select_IDs_terms_productTableAdapter taSP10 = new sp_010_select_IDs_terms_productTableAdapter();
            Search.sp_010_select_IDs_terms_productDataTable dtSP10 = taSP10.GetData(zip, categoryTdxID);
            for (int i = 0; i < dtSP10.Rows.Count; i++)
            {
                //ratingModelTdxIDList.Add(dtSP10.Rows[i]["RatingModelTdxID"].ToString());
                tdxTermsID = Convert.ToInt32(dtSP10.Rows[i]["TdxTermsID"]);
            }
            return tdxTermsID;
        }
        public static ArrayList SP_10_GetRatingModelIDsList(int categoryTdxID)
        {
            ArrayList ratingModelTdxIDList = new ArrayList();
            RatingModelTableAdapter taRatingModel = new RatingModelTableAdapter();
            Search.RatingModelDataTable dtRatingModel = taRatingModel.GetRatingModelIDsList(categoryTdxID);
            for (int i = 0; i < dtRatingModel.Rows.Count; i++)
            {
                ratingModelTdxIDList.Add(dtRatingModel.Rows[i]["RatingModelTdxID"].ToString());
            }
            return ratingModelTdxIDList;
        }
        public static Hashtable GetRebateDetails(int tdxIncentiveID)
        {
            sp_050_text_detailsTableAdapter taRebateDetails = new sp_050_text_detailsTableAdapter();
            Search.sp_050_text_detailsDataTable dtRebateDetails = taRebateDetails.GetRebateDetails(tdxIncentiveID);
            Hashtable htRebateDetails = new Hashtable();
            if (dtRebateDetails.Rows.Count > 0)
            {
                htRebateDetails["IncentiveName"] = dtRebateDetails.Rows[0]["IncentiveName"];
                htRebateDetails["Summary"] = dtRebateDetails.Rows[0]["Summary"];
                htRebateDetails["EquipmentRequirements"] = dtRebateDetails.Rows[0]["EquipmentRequirements"];
                htRebateDetails["InstallationRequirements"] = dtRebateDetails.Rows[0]["InstallationRequirements"];
                htRebateDetails["ProjectReviewCertification"] = dtRebateDetails.Rows[0]["ProjectReviewCertification"];
                htRebateDetails["Terms"] = dtRebateDetails.Rows[0]["Terms"];
                htRebateDetails["MaxLimit"] = dtRebateDetails.Rows[0]["MaxLimit"];
                htRebateDetails["ExpirationDate"] = dtRebateDetails.Rows[0]["ExpirationDate"];
                htRebateDetails["IncentiveWebsite"] = dtRebateDetails.Rows[0]["IncentiveWebsite"];
                htRebateDetails["ContactFName"] = dtRebateDetails.Rows[0]["ContactFName"];
                htRebateDetails["ContactLName"] = dtRebateDetails.Rows[0]["ContactLName"];
                htRebateDetails["ContactDept"] = dtRebateDetails.Rows[0]["ContactDept"];
                htRebateDetails["ContactStreet"] = dtRebateDetails.Rows[0]["ContactStreet"];
                htRebateDetails["ContactCity"] = dtRebateDetails.Rows[0]["ContactCity"];
                htRebateDetails["ContactState"] = dtRebateDetails.Rows[0]["ContactState"];
                htRebateDetails["ContactZip"] = dtRebateDetails.Rows[0]["ContactZip"];
                htRebateDetails["ContactPhone"] = dtRebateDetails.Rows[0]["ContactPhone"];
                htRebateDetails["ContactWebsite"] = dtRebateDetails.Rows[0]["ContactWebsite"];
                return htRebateDetails;
            }
            else
                return null;
        }
        public static DataTable GetSchemaForSearchResultDataTable()
        {
            DataTable dtSearchResults = new DataTable("SearchResultsDT");
            //Data for internal use
            dtSearchResults.Columns.Add("UtilityID");
            dtSearchResults.Columns.Add("InputSize");
            //Data to display on web
            dtSearchResults.Columns.Add("TdxTermsID");
            dtSearchResults.Columns.Add("RatingModelTdxID");
            dtSearchResults.Columns.Add("BrandName");
            dtSearchResults.Columns.Add("BrandModel");
            dtSearchResults.Columns.Add("ProdImgURL");
            dtSearchResults.Columns.Add("ProdDesc");
            dtSearchResults.Columns.Add("RebateAmount");
            dtSearchResults.Columns.Add("UtilityLogoURL");
            dtSearchResults.Columns.Add("TdxIncentiveID");
            dtSearchResults.Columns.Add("KWHSavings");
            dtSearchResults.Columns.Add("CO2SavingsLbs");
            dtSearchResults.Columns.Add("DollarSavings");
            return dtSearchResults;
        }
    }
}
