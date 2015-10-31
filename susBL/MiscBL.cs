using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using PilotDL;
using PilotDL.MiscTableAdapters;

namespace PilotBL
{
    public class MiscBL
    {
        public static Misc.sp_052_displayConfirmationRow GetConfirmationDetails(int confirmationID)
        {
            sp_052_displayConfirmationTableAdapter taConfirmationDetails = new sp_052_displayConfirmationTableAdapter();
            Misc.sp_052_displayConfirmationDataTable dtConfirmationDetails = taConfirmationDetails.GetConfirmationDetails(confirmationID);
            if (dtConfirmationDetails.Rows.Count > 0)
            {
                return (Misc.sp_052_displayConfirmationRow)dtConfirmationDetails.Rows[0];
            }            
            return null;
        }
    }
}
