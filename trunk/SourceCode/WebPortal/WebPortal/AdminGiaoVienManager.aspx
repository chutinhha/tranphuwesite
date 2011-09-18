<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminGiaoVienManager.aspx.cs" Inherits="WebPortal.AdminGiaoVienManager" %>
<%@ Register TagPrefix="UC" TagName="GVList" Src="~/AdminUsercontrols/UCAdminGiaoVienList.ascx" %>
<%@ Register TagPrefix="UC" TagName="GVDetail" Src="~/AdminUsercontrols/UCAdminGiaoVienDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="css/admin-usermanager.css" rel="Stylesheet" />
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#form1").validate({
                 rules: {
                     email: {
                         email: true
                     },
                     hoGV: {
                         required: true
                     },
                     tenGV: {
                         required: true
                     },
                     dienThoai: {
                         number: true
                     }
                 }
             });
             $('input[name="ngaySinh"]').datepicker({
                 dateFormat: 'dd/mm/yy'
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
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>