<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="Search" Title="Pilot Product Display > Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td style="width: 15%;">
                &nbsp;
            </td>
            <td style="width: 85%;">
                <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 15%;">
                &nbsp;
            </td>
            <td style="width: 85%;" align="center">
                <asp:Label ID="lblResultCount" runat="server" Font-Bold="True" ForeColor="Green"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 15%;">
                &nbsp;
            </td>
            <td style="width: 85%;" align="center">
                <div style="margin-bottom: 10px; top: 0px; left: 0px; float:left">
                            <asp:DropDownList ID="ddRetailers" runat="server" DataSourceID="ObjectDataSource_Retailers"
                                DataTextField="RetailerName" DataValueField="RetailerID" OnSelectedIndexChanged="ddRetailers_SelectedIndexChanged"
                                AutoPostBack="True">
                            </asp:DropDownList>
                            &nbsp;<asp:DropDownList ID="ddModel" runat="server" DataSourceID="ObjectDataSource_Model"
                                DataTextField="LabelText" DataValueField="InputSize" OnDataBound="ddModel_DataBound"
                                OnSelectedIndexChanged="ddModel_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                            &nbsp;<asp:TextBox ID="txtBoxRate" runat="server"></asp:TextBox>
                            &nbsp;cents/kWh
                        </div>
            </td>
            </tr>
        <tr>
                <td style="width: 15%;" valign="top">
                    <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource_Categories"
                        EmptyDataText="No Results Found" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-Font-Size="Larger"
                        ShowHeader="False" OnRowCommand="gvCategories_RowCommand" OnRowCreated="gvCategories_RowCreated">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table id="tblCategories" runat="server" width="200px" border="0" cellspacing="2"
                                        cellpadding="0" class="my_nav">
                                        <tr>
                                            <td align="left" valign="top">
                                                <asp:LinkButton ID="btnCategory" runat="server" CommandName="ProcessCategory" CommandArgument='<%# Eval("CategoryTdxID") %>'
                                                    Text='<%# Eval("CategoryLabel") %>'>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 85%;" align="center">
                    <div id="wrapper">
                            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False"
                                OnRowCommand="gvProducts_RowCommand" ShowHeader="false" DataKeyNames="TdxTermsID,RatingModelTdxID,RebateAmount,TdxIncentiveID"
                                Width="692px">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <div>
                                                <table style="width: 620px;">
                                                    <tr>
                                                        <td rowspan="4">
                                                            <asp:Image ID="imgProduct" runat="server" AlternateText="Image Not Available"
                                                             CssClass="image_product" ImageUrl='<%# Bind("ProdImgURL") %>' />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="$"></asp:Label>
                                                            <asp:Label ID="lblRebateAmount" runat="server" Font-Bold="True" Text='<%# Bind("RebateAmount") %>'></asp:Label>
                                                            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Rebate"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="5 Years Savings"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Text="Purchase"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblBrandName" runat="server" Text='<%# Bind("BrandName") %>'></asp:Label>
                                                        </td>
                                                        <td rowspan="3">
                                                            <table style="width: 265px; border-width: thin; border-color: Gray;" border="">
                                                                <tr>
                                                                    <td style="width: 70%">
                                                                        <asp:Label ID="Label3" runat="server" Text="Cost Savings"></asp:Label>
                                                                        ($)</td>
                                                                    <td style="width: 30%">
                                                                        <asp:Label ID="lblDollarSavings" runat="server" Text='<%# Bind("DollarSavings") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 70%">
                                                                        <asp:Label ID="Label4" runat="server" Text="Green House Gas(Lbs)"></asp:Label>
                                                                    </td>
                                                                    <td style="width: 30%">
                                                                        <asp:Label ID="lblCO2SavingsLbs" runat="server" Text='<%# Bind("CO2SavingsLbs") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label5" runat="server" Text="Energy Units(Kwh)"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblKWHSavings" runat="server" Text='<%# Bind("KWHSavings") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td rowspan="3">
                                                            <asp:GridView ID="gvRetailerList" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None" ShowHeader="False" Width="150px">
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <Columns>
                                                                    <asp:HyperLinkField DataNavigateUrlFields="POSURL" DataNavigateUrlFormatString=""
                                                                        DataTextField="RetailerName" DataTextFormatString="" NavigateUrl="" ShowHeader="False"
                                                                        Target="_blank">
                                                                        <ControlStyle Font-Size="Smaller" />
                                                                    </asp:HyperLinkField>
                                                                </Columns>
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblBrandModel" runat="server" Text='<%# Bind("BrandModel") %>'></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="btnApplyNow" runat="server" CommandArgument='<%# Bind("RatingModelTdxID") %>'
                                                                CommandName="Apply" Text="Rebate"><img class="rebatebutton" src="images/rebatebutton.jpg" style="border:none;">
                                                            </asp:LinkButton>
                                                            <br />
                                                            <asp:Image ID="imgUtilityLogoURL" runat="server" AlternateText="Logo Image Not Available" CssClass="image_logo"
                                                                ImageUrl='<%# Eval("UtilityLogoURL")%>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td style="display: none;">
                                                            <asp:Label ID="Label14" runat="server" Text="To Be Hidden"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label1" runat="server">RatingModelTdxId:</asp:Label>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("RatingModelTdxID") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label8" runat="server">RebateAmount: </asp:Label>
                                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("RebateAmount") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label10" runat="server">TdxIncentiveId:</asp:Label>
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("TdxIncentiveID") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label12" runat="server">UtilityId:</asp:Label>
                                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("UtilityID") %>'></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label17" runat="server">Input Size:</asp:Label>
                                                            <asp:Label ID="Label18" runat="server" Text='<%# Bind("InputSize") %>'></asp:Label>
                                                            <br />
                                                        </td>
                                                        <td style="display: none">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        
                    </div>
                </td>
        </tr>
        <tr>
            <td style="width: 15%;" valign="top">
                <div>
                    <br />
                </div>
            </td>
            <td style="width: 85%;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 15%;" valign="top">
                <asp:ObjectDataSource ID="ObjectDataSource_Categories" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetCategories" TypeName="PilotDL.SearchTableAdapters.sp_005_menu_categoryTableAdapter">
                </asp:ObjectDataSource>
            </td>
            <td style="width: 85%;">
                <asp:ObjectDataSource ID="ObjectDataSource_Retailers" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetRetailers" TypeName="PilotDL.SearchTableAdapters.sp_006_menu_retailerTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource_Model" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetModels" TypeName="PilotDL.SearchTableAdapters.sp_003_menu_HHsizeTableAdapter">
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <br />
    <br />
    <div style="float: right;">
        <asp:Label ID="Label19" runat="server" Text="Enter Your Zip Code"></asp:Label>
        &nbsp;<asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtZip"
            ErrorMessage="*"></asp:RequiredFieldValidator>
        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Go" OnClick="btnSearch_Click" />
    </div>
</asp:Content>
