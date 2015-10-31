<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RebateForm.aspx.cs" Inherits="RebateForm" Title="Pilot Product Display > Rebate Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ObjectDataSource ID="ObjectDataSource_Rebate" runat="server"></asp:ObjectDataSource>
    <table style="width:100%;" cellpadding="15">
        <tr>
            <td valign="top" style="width:50%;">
                &nbsp;</td>
            <td valign="top" style="width:50%;">        
                <asp:Button ID="btnPrint" runat="server" onclick="btnPrint_Click" 
                    Text="Print" />
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <asp:Label ID="lblResult" runat="server" Font-Bold="True" ForeColor="Green"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top" style="width:50%;">
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">
                            ------ Header information, logo------
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Confirmation Number"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblConfirmationID" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Utility Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblUtilityName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Utility Logo"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblUtilityLogoURL" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" style="width:50%;">        
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">---------- Attach UPC Code receipt here -----------</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    </table>
            </td>
        </tr>
    </table>
    <br/>
    <table style="width:100%;" cellpadding="15">
        <tr>
            <td valign="top" style="width:50%;">
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">
                            ------ Rebate Summary ------
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Incentive Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblIncentiveName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Summary"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblSummary" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label8" runat="server" Text="Rebate Amount($)"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblRebateAmount" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top" style="width:50%;">        
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">---------- Item Purchased -----------</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label15" runat="server" Text="Category Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCategoryLabel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label17" runat="server" Text="Brand Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblBrandName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label16" runat="server" Text="Rating Model Number"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblRatingModelNumber" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <table style="width:100%;" cellpadding="15">
        <tr>
            <td valign="top" style="width:50%;">
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">
                            ------ My Information ------
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label9" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblLName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" Text="Street"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblStreet" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label7" runat="server" Text="Apartment"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblApartment" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="City"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label34" runat="server" Text="State"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblState" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Zip Code"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblZip" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label14" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblLogonEmail" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="Utility Account Number"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblUtilityAccountNumber" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                </table>
            </td>
            <td valign="top" style="width:50%;">        
                <table style="width:100%;">
                    <tr>
                        <td>---------- Mail Rebate To -----------</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactFName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactLName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactDept" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactStreet" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactCity" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactState" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactZip" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="lblContactPhone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblContactWebsite" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <table style="width:100%;" cellpadding="15">
        <tr>
            <td valign="top" style="width:50%;">
                <table style="width:100%;">
                    <tr>
                        <td colspan="2">
                            ------ Utility Bill Payer, if other than me ------
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_FName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label20" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_LName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label22" runat="server" Text="Street"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_Street" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="Apartment"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_Apartment" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="City"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_City" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label28" runat="server" Text="Zip Code"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_Zip" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label32" runat="server" Text="Phone"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_Phone" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label30" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblB_Email" runat="server"></asp:Label>
                        </td>
                    </tr>
                    
                    
                </table>
            </td>
            <td valign="top" style="width:50%;">        
                &nbsp;</td>
        </tr>
    </table>
    </asp:Content>

