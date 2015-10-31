<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" Title="Pilot Product Display > Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">
    var gridViewCtlId = '<%=gvCategories.ClientID%>';
    var gridViewCtl = null;
    var curSelRow = null;
    function getGridViewControl()
    {
        if (null == gridViewCtl)
        {
            gridViewCtl = document.getElementById(gridViewCtlId);
        }
    }
    
    function onGridViewRowSelected(rowIdx)
    {
        var selRow = getSelectedRow(rowIdx);
////        if (curSelRow != null)
////        {
////            curSelRow.style.backgroundColor = '#ffffff';
////        }
        
        if (null != selRow)
        {
            curSelRow = selRow;
            curSelRow.style.backgroundColor = '#ff0022';
        }
    }
    
    function getSelectedRow(rowIdx)
    {
        getGridViewControl();
        if (null != gridViewCtl)
        {
            return gridViewCtl.rows[rowIdx];
        }
        return null;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td>
            &nbsp;</td>
        <td colspan="2">
            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
        </td>
        <td>
            Enter Zip Code Here
            <asp:TextBox ID="txtZip" runat="server" Text="94303"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtZip" ErrorMessage="*"></asp:RequiredFieldValidator>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Go" onclick="btnSearch_Click" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:DropDownList ID="ddRetailers" runat="server" 
                DataSourceID="ObjectDataSource_Retailers" DataTextField="RetailerName" 
                DataValueField="RetailerID" 
                onselectedindexchanged="ddRetailers_SelectedIndexChanged" 
                AutoPostBack="True" >
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource_Retailers" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetRetailers" 
                TypeName="PilotDL.SearchTableAdapters.sp_006_menu_retailerTableAdapter">
            </asp:ObjectDataSource>
        </td>
        <td>
            <asp:DropDownList ID="ddModel" runat="server" 
                DataSourceID="ObjectDataSource_Model" DataTextField="LabelText" 
                DataValueField="InputSize" ondatabound="ddModel_DataBound" 
                onselectedindexchanged="ddModel_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource_Model" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetModels" 
                TypeName="PilotDL.SearchTableAdapters.sp_003_menu_HHsizeTableAdapter">
            </asp:ObjectDataSource>
        </td>
        <td>
            <asp:TextBox ID="txtBoxRate" runat="server"></asp:TextBox>Cents per KWH</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="center" colspan="3">
            <asp:Label ID="lblResultCount" runat="server" Font-Bold="True"></asp:Label>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <%--<asp:DataList ID="listCategories" runat="server" 
                DataSourceID="ObjectDataSource_Categories" 
                onselectedindexchanged="listCategories_SelectedIndexChanged">
                <ItemTemplate>
                    <asp:LinkButton ID="btnCategory" runat="server" 
                    CommandName="CategoryTdxID" 
                    CommandArgument='<%# Eval("CategoryTdxID") %>' 
                    Text='<%# Eval("CategoryLabel") %>' OnClick="Category_Clicked">
                    </asp:LinkButton>
                    <br />
                </ItemTemplate>
            </asp:DataList>--%>
            
            <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False" 
                DataSourceID="ObjectDataSource_Categories" 
                EmptyDataText="No Results Found" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-Font-Size="Larger" 
                ShowHeader="False" onrowcommand="gvCategories_RowCommand" 
                onrowcreated="gvCategories_RowCreated">
                <Columns>
                    <asp:TemplateField>
                    
                        <ItemTemplate>
                            <asp:LinkButton ID="btnCategory" runat="server" 
                                CommandName="ProcessCategory"
                                CommandArgument='<%# Eval("CategoryTdxID") %>' 
                                Text='<%# Eval("CategoryLabel") %>'>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <selectedrowstyle backcolor="palegoldenrod" />
            </asp:GridView>           
            <asp:ObjectDataSource ID="ObjectDataSource_Categories" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategories" 
                TypeName="PilotDL.SearchTableAdapters.sp_005_menu_categoryTableAdapter">
            </asp:ObjectDataSource>
        </td>
        <td colspan="3">
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" onrowcommand="gvProducts_RowCommand" 
            ShowHeader="false" DataKeyNames="TdxIncentiveID,RatingModelTdxID,RebateAmount" 
                Width="692px">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div>
                            <table style="width:620px;">
                                <tr>
                                    <td rowspan="5">
                                        <asp:Image ID="imgProduct" runat="server" ImageUrl = '<%# Bind("ProdImgURL") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="$" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="lblRebateAmount" runat="server" 
                                            Text = '<%# Bind("RebateAmount") %>' Font-Bold="True" ></asp:Label>
                                        <asp:Label ID="Label6" runat="server" Text="Rebate" Font-Bold="True"></asp:Label>
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
                                        
                                        <table style="width:265px;border-width:thin;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="Cost Savings"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblDollarSavings" runat="server" Text= '<%# Bind("DollarSavings") %>' ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="Green House Gas"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCO2SavingsLbs" runat="server"  Text= '<%# Bind("CO2SavingsLbs") %>' ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server" Text="Energy Units"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblKWHSavings" runat="server"  Text= '<%# Bind("KWHSavings") %>' ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                        
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPOSURL" runat="server" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblBrandModel" runat="server" Text= '<%# Bind("BrandModel") %>' ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRetailerName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="btnApplyNow" runat="server" CommandArgument='<%# Bind("RatingModelTdxID") %>'
                                                                                            CommandName="Apply" Text="Apply Now"> </asp:LinkButton>
                                        <br />
                                        <asp:ImageButton ID="imgUtilityLogoURL" runat="server" ImageUrl='<%# Eval("UtilityLogoURL")%>' />
                                    </td>
                                    <td>
                                        <asp:GridView ID="gvRetailerList" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <Columns>
                                                <asp:HyperLinkField DataNavigateUrlFields="POSURL" 
                                                    DataNavigateUrlFormatString="" DataTextField="RetailerName" 
                                                    DataTextFormatString="" NavigateUrl="POSURL" Target="_blank" 
                                                    ShowHeader="False" />
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
                                        <asp:HiddenField ID="hdnRatingModelTdxId" runat="server" 
                                            Value='<%# Bind("RatingModelTdxID") %>' />
                                        <asp:HiddenField ID="hdnRebateAmount" runat="server" 
                                            Value='<%# Bind("RebateAmount") %>' />
                                        <asp:HiddenField ID="hdnTdxIncentiveId" runat="server" 
                                            Value='<%# Bind("TdxIncentiveID") %>' />
                                    </td>
                                    <td>
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
                                </tr>
                            </table>
                        </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
    </tr>
</table>
</asp:Content>

