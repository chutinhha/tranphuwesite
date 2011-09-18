<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminGroupsManager.aspx.cs" Inherits="WebPortal.AdminGroupsManager" %>

<%@ Register TagPrefix="UC" TagName="GroupList" Src="~/AdminUsercontrols/UCAdminGroupsList.ascx" %>
<%@ Register TagPrefix="UC" TagName="GroupDetail" Src="~/AdminUsercontrols/UCAdminGroupsDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="css/admin-usermanager.css" rel="Stylesheet" />
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#form1").validate({
                 rules: {
                     groupName: {
                         required: true
                     }
                 }
             });
         });
    </script>
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
                <UC:GroupList runat="server" ID="UCGroupList" />
                <!-- /#table -->
                <%}
                   else if (Request.QueryString["type"] != null)
                   { %>
                <UC:GroupDetail runat="server" ID="UCGroupDetail" />
                <%} %>
            </div>
            <!-- end of box-wrap -->
        </div>
    </div>
    <!-- end of box-wrap -->
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
