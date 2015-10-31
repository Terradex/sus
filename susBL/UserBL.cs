using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PilotDL;
using PilotDL.dsUserTableAdapters;
using PilotDL.MiscTableAdapters;

namespace PilotBL
{
    public static class UserBL
    {
        //public static bool UpdateUserInfo(string fName, string lName,string street,string apartment,string city,string state,string zip,string logonEmail, string logonPW, string phone,string utilityAccountNumber,string B_FName,string B_Lname,string B_Street,string B_apartment,string B_City,string B_State,string B_Zip, string B_Phone,string B_email, int userId)
        //{
        //    UserInfoTableAdapter taUserInfo = new UserInfoTableAdapter();
        //    int resultCount = taUserInfo.UpdateUser(fName,lName,street,apartment,city,state,zip,phone,logonEmail,logonPW,utilityAccountNumber,B_FName,B_Lname,B_Street,B_apartment,B_City,B_State,B_Zip,B_Phone,B_email,userId);
        //    if (resultCount > 0)
        //    {
        //        return true;
        //    }
        //    return false;
        //}
        public static bool UpdateUserInfo(dsUser.UserInfoRow row)
        {
            try
            {
                UserInfoTableAdapter taUserInfo = new UserInfoTableAdapter();
                int resultCount = taUserInfo.UpdateUser(row.FName, row.LName, row.Street, row.Apartment, row.City, row.State, row.ZIP, row.Phone, row.logonEmail, row.UtilityAccountNumber, row.B_FName, row.B_LName, row.B_Street, row.B_Apartment, row.B_City, row.B_State, row.B_ZIP, row.B_Phone, row.B_email, row.UserID);
                if (resultCount > 0)
                {
                    if (row.logonPW != null)
                    {
                        if (!row.logonPW.Equals(string.Empty))
                        {
                            taUserInfo.UpdatePassword(row.logonPW, row.UserID);
                        }
                    }
                    return true;
                }
                return false;
            }
            catch { return false; }
        }

        public static int InsertUserInfo(dsUser.UserInfoRow row)
        {
            try
            {
                UserInfoTableAdapter taUserInfo = new UserInfoTableAdapter();
                int userId = taUserInfo.Insert(row.FName, row.LName, row.Street, row.Apartment, row.City, row.State, row.ZIP, row.Phone, row.logonEmail, row.logonPW, row.UtilityAccountNumber, row.B_FName, row.B_LName, row.B_Street, row.B_Apartment, row.B_City, row.B_State, row.B_ZIP, row.B_Phone, row.B_email);
                return userId;
            }
            catch { return 0; }
        }

        public static dsUser.UserInfoRow GetUserInfo(string email, string password)
        {
            try
            {
                UserInfoTableAdapter taUserInfo = new UserInfoTableAdapter();
                dsUser.UserInfoDataTable dtUserInfo = taUserInfo.GetUserInfo(email, password);
                if (dtUserInfo.Rows.Count > 0)
                {
                    return dtUserInfo[0];
                }
                return null;
            }
            catch { return null; }
        }

        public static int GetUserId(string email, string password)
        {
            try
            {
                UserInfoTableAdapter taUserInfo = new UserInfoTableAdapter();
                dsUser.UserInfoDataTable dtUserInfo = taUserInfo.GetUserInfo(email, password);
                int userId = 0;
                if (dtUserInfo.Rows.Count > 0)
                {
                    userId = Convert.ToInt32(dtUserInfo[0]["UserId"]);
                }
                return userId;
            }
            catch { return 0; }
        }

        public static dsUser.UserInfoRow GetUserInfoByUserId(int userId)
        {
            try
            {
                UserInfoTableAdapter taUserInfo = new UserInfoTableAdapter();
                dsUser.UserInfoDataTable dtUserInfo = taUserInfo.GetUserInfoById(userId);
                if (dtUserInfo.Rows.Count > 0)
                {
                    return dtUserInfo[0];
                }
                return null;
            }
            catch { return null; }
        }

        

        public static int GetConfirmationID(int userId, int tdxTermsId, int ratingModelTdxId, decimal rebateAmount)
        {
            try
            {
                sp_051_create_confirmationRecordTableAdapter taCreateConfirmation = new sp_051_create_confirmationRecordTableAdapter();
                Misc.sp_051_create_confirmationRecordDataTable dtConfirmation = taCreateConfirmation.InsertAndGetConfirmationID(userId, tdxTermsId, ratingModelTdxId, rebateAmount);
                if (dtConfirmation.Rows.Count > 0)
                {
                    return Convert.ToInt32(dtConfirmation.Rows[0]["ConfirmationID"]);
                }
                return -1;
            }
            catch { return -1; }
            
        }
    }
}
