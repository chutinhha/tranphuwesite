<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminGroupsPanel.aspx.cs" Inherits="WebPortal.AdminGroupsPanel" %>

<%@ Register TagPrefix="UC" TagName="GroupPanel" Src="~/AdminUsercontrols/UCAdminGroupsPanel.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
            <div class="box-header clear">
                <h2>
                    Group Panel
                </h2>
            </div>
            <div class="box-wrap clear">
                <UC:GroupPanel runat="server" ID="UCGroupList" />
            </div>
            </div>
    </div>
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
