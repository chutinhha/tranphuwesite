<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminApplicationManager.aspx.cs" Inherits="WebPortal.AdminApplicationManager" %>
<%@ Register TagPrefix="UC" TagName="AppList" Src="~/AdminUsercontrols/UCAdminApplicationList.ascx" %>
<%@ Register TagPrefix="UC" TagName="AppDetail" Src="~/AdminUsercontrols/UCAdminApplicationDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="css/admin-usermanager.css" rel="Stylesheet" />
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
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
                <UC:AppList runat="server" ID="UCAppList" />
                <!-- /#table -->
                <%}
                   else if (Request.QueryString["type"] != null)
                   { %>
                <UC:AppDetail runat="server" ID="UCAppDetail"/>
                <%} %></div>
                <!-- end of box-wrap -->
            </div>
</div>
        <!-- end of box-wrap -->
                <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>