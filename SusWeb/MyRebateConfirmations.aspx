<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyRebateConfirmations.aspx.cs" Inherits="MyRebateConfirmations" Title="Pilot Product Display > My Rebate Confirmations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lbl1" runat="server" Text="My Rebate Confirmations"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="lblMesasge" ForeColor="Red" runat="server" Text=""></asp:Label>
    <asp:GridView ID="gvConfirmations" runat="server" AutoGenerateColumns="False"  
        CellPadding="4" DataSourceID="ObjectDataSource_Confirmations"
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <Columns>
        
        <asp:HyperLinkField DataNavigateUrlFields="ConfirmationID" 
            DataNavigateUrlFormatString="RebateForm.aspx?ConfirmationID={0}" 
            DataTextField="ConfirmationID" HeaderText="Confirmation Number(Click to View)" />
            
        <asp:TemplateField HeaderText="Rebate">
            <ItemTemplate>
                <asp:Label ID="lblRebate" runat="server" Text='<%# Eval("RebateAmount") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
                <asp:Label ID="lblDate" runat="server" Text='<%# Eval("UpdateDate") %>' ></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        
    </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource_Confirmations" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetMyConfirmations" 
        TypeName="PilotDL.MiscTableAdapters.sp_053_list_confirmationsTableAdapter">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="UserID" SessionField="LoggedUserId" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

