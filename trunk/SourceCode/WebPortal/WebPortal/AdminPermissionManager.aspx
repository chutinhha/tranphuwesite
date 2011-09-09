<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminPermissionManager.aspx.cs" Inherits="WebPortal.AdminPermissionManager" %>
<%@ Register TagPrefix="UC" TagName="PerList" Src="~/AdminUsercontrols/UCAdminPermissionList.ascx" %>
<%@ Register TagPrefix="UC" TagName="PerDetail" Src="~/AdminUsercontrols/UCAdminPermissionDetail.ascx" %>
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
                <UC:PerList runat="server" ID="UCPerList" />
                <!-- /#table -->
                <%}
                   else if (Request.QueryString["type"] != null)
                   { %>
               
                <UC:PerDetail runat="server" ID="UCPerDetail"/>
                <%} %>
                 </div>
                <!-- end of box-wrap -->
            </div>
</div>
        <!-- end of box-wrap -->
</asp:Content>
