<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Pilot Product Display > Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;" cellpadding="15">
        <tr>
            <td valign="top" align="center" colspan="3">
                <asp:Label ID="Label44" runat="server" Font-Size="Larger" 
                    Text="LabelContact and Use Location Information"></asp:Label>
            </td>
        </tr>
        <tr>
                    <td valign="top" style="width:30%;">
                        <table style="width:100%;">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label45" runat="server" 
                                        Text="Need to enter Password to Save (email and password are required to later log on)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label42" runat="server" Text="Email"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label43" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
            <asp:Button ID="btnCurrentUser" runat="server" Text="Current User" />
                        
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" style="width:40%;">
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
                        <br />
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
                    <td valign="top" style="width:30%;">
                        <table style="width:100%;">
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label46" runat="server" 
                                        
                                        Text="Need to enter Password to Save (email and password are required to later log on)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label47" runat="server" Text="Email"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail0" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label48" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword0" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
            <asp:Button ID="btnSave" runat="server" Text="Save To Return Later" />
                        
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="width:100%;">
                            <tr>
                                <td>
                        
            <asp:Button ID="btnShowRebateForm" runat="server" Text="Show Rebate Form" />
                        
                                </td>
                            </tr>
                        </table>
                    </td>
        </tr>
    </table>
</asp:Content>

