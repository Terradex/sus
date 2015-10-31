<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RebateDetails.aspx.cs" Inherits="RebateDetails" Title="Pilot Product Display > Rebate Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <table style="width:70%;">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True">Rebate Summary</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblIncentiveName" runat="server"></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label4" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblSummary" runat="server"></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label5" runat="server" ></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:70%;">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" >Conditions</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblEquipmentRequirements" runat="server"></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label8" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblInstallationRequirements" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label10" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblProjectReviewCertification" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label3" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblTerms" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label9" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblMaxLimit" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label16" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblExpirationDate" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label18" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblIncentiveWebsite" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;">
                            <asp:Label ID="Label7" runat="server" ></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table style="width:70%;">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label11" runat="server" Text="Contact Information" 
                                Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactFName" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactLName" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactDept" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactStreet" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactCity" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactState" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactZip" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactPhone" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <asp:Label ID="lblContactWebsite" runat="server" ></asp:Label>
                        </td>
                        <td style="width:50%;"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <table style="width:70%;">
                    <tr>
                        <td style="width:50%;">
                            <asp:Button ID="btnBackToSearch" runat="server" onclick="btnBackToSearch_Click" 
                                Text="Back To Search" />
                        </td>
                        <td style="width:50%;">
                            <asp:Button ID="btnProceed" runat="server" onclick="btnProceed_Click" 
                                Text="Proceed" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

