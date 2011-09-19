<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminPermissionManager.aspx.cs" Inherits="WebPortal.AdminPermissionManager" %>

<%@ Register TagPrefix="UC" TagName="PerList" Src="~/AdminUsercontrols/UCAdminPermissionList.ascx" %>
<%@ Register TagPrefix="UC" TagName="PerDetail" Src="~/AdminUsercontrols/UCAdminPermissionDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#form1").validate({
                 rules: {
                     name: {
                         required: true
                     }
                 }
             });
             $("#back").click(function () {
                 document.location.href = "AdminPermissionManager.aspx";
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
                <UC:PerList runat="server" ID="UCPerList" />
                <!-- /#table -->
                <%}
                   else if (Request.QueryString["type"] != null)
                   { %>
                 <UC:PerDetail runat="server" ID="UCPerDetail" />
                <%} %>
            </div>
        </div>
</div>
    <!-- end of box-wrap -->
    <% 
        WebPortal.Repository.Log.WriteLog(Request);
    %>
</asp:Content>
