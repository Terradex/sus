<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Pilot Product Display > Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;" cellpadding="15">
        <tr>
            <td valign="top" align="center" colspan="3">
                <asp:Label ID="Label44" runat="server" Font-Size="Larger" 
                    Text="Contact and Use Location Information"></asp:Label>
            </td>
        </tr>
        <tr>
                    <td valign="top" style="width:30%;">
                        &nbsp;</td>
                    <td valign="top" style="width:40%;">
                        &nbsp;</td>
                    <td valign="top" style="width:30%;">
                        &nbsp;</td>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="txtEmail" ErrorMessage="*" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label43" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtPassword" ErrorMessage="*" 
                                        ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
            <asp:Button ID="btnCurrentUser" runat="server" Text="Current User" onclick="btnCurrentUser_Click" 
                                        ValidationGroup="LoginGroup" />
                        
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
                                    <asp:HyperLink ID="linkForgotPassword" runat="server" 
                                        NavigateUrl="~/ForgotPassword.aspx">Forgot Password</asp:HyperLink>
                        
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
                                    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                        
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td valign="top" style="width:40%;">
                        <table style="width:100%;">
                            <tr>
                                <td colspan="2">
                                    ------ My Information ------          </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="First Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Street"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Apartment"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtApartment" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="City"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label34" runat="server" Text="State"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Zip Code"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="Phone"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Utility Account Number"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUtilityAccountNumber" runat="server"></asp:TextBox>
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
                            <asp:TextBox ID="txtB_FName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label20" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_LName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label22" runat="server" Text="Street"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_Street" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label24" runat="server" Text="Apartment"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_Apartment" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label26" runat="server" Text="City"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_City" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label49" runat="server" Text="State"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_State" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label28" runat="server" Text="Zip Code"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_Zip" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label32" runat="server" Text="Phone"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_Phone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label30" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtB_Email" runat="server"></asp:TextBox>
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
                                    <asp:TextBox ID="txtEmail_NewUser" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label48" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword_NewUser" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
            <asp:Button ID="btnSave" runat="server" Text="Save To Return Later" onclick="btnSave_Click" />
                        
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                        
                                    <asp:Label ID="lblSaveResult" runat="server" ForeColor="Red"></asp:Label>
                        
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table style="width:100%;">
                            <tr>
                                <td>
                        
            <asp:Button ID="btnShowRebateForm" runat="server" Text="Show Rebate Form" 
                                        onclick="btnShowRebateForm_Click" />
                        
                                </td>
                            </tr>
                            <tr>
                                <td>
                        
                                    <asp:Label ID="lblRebateResult" runat="server" ForeColor="Red"></asp:Label>
                        
                                </td>
                            </tr>
                        </table>
                    </td>
        </tr>
    </table>
</asp:Content>

