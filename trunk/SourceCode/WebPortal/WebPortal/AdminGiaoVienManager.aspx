<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminGiaoVienManager.aspx.cs" Inherits="WebPortal.AdminGiaoVienManager" %>
<%@ Register TagPrefix="UC" TagName="GVList" Src="~/AdminUsercontrols/UCAdminGiaoVienList.ascx" %>
<%@ Register TagPrefix="UC" TagName="GVDetail" Src="~/AdminUsercontrols/UCAdminGiaoVienDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
            <div class="box-header clear">
                <h2>
                    Admin Site</h2>
            </div>
            <div class="box-wrap clear">
                <% if (Request.QueryString["id"] == null)
                   {%>
                <!-- TABLE -->
                <UC:GVList runat="server" ID="UCGiaoVienList" />
                <!-- /#table -->
                <%}
                   else if (Request.QueryString["type"] != null)
                   { %>
                <UC:GVDetail runat="server" ID="UCGiaoVienDetail" />
                <%} %>
            </div>
            <!-- end of box-wrap -->
        </div>
    </div>
    <!-- end of box-wrap -->
</asp:Content>