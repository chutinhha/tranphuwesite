<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminUserManager.aspx.cs" Inherits="WebPortal.AdminIndex" %>

<%@ Register TagPrefix="UC" TagName="UserList" Src="~/AdminUsercontrols/UCAdminUserList.ascx" %>
<%@ Register TagPrefix="UC" TagName="UserDetail" Src="~/AdminUsercontrols/UCAdminUserDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/admin-usermanager.css" rel="Stylesheet" />
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('input[name="dateLogin"]').datepicker({
                dateFormat: 'dd/mm/yy'
            });
            $('input[name="dateCreate"]').datepicker({
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
                <UC:UserList runat="server" ID="UCUserList" />
                <!-- /#table -->
                <%}
                   else if (Request.QueryString["type"] != null)
                   { %>
                <UC:UserDetail runat="server" ID="UserDetail" />
                <%} %>
                <!-- end of box-wrap -->
            </div>
        </div>
        <!-- end of box-wrap -->
    </div>
    <!-- end of box-body -->
    <!-- NOTIFICATIONS (Thong bao)-->
    <%--                <div class="notification note-error">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>Error notification:</strong> Thông báo lỗi xuất hiện tại đây.</p>
                </div>
                <div class="notification note-success">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>Success notification:</strong> Thông báo lỗi xuất hiện tại đây.</p>
                </div>
                <div class="notification note-info">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>Information notification:</strong> Thông báo lỗi xuất hiện tại đây.</p>
                </div>
                <div class="notification note-attention">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>Attention notification:</strong> Thông báo lỗi xuất hiện tại đây.</p>
                </div>--%>
</asp:Content>
