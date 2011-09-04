<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminUserManager.aspx.cs" Inherits="WebPortal.AdminIndex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/admin-usermanager.css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
            <div class="box-header clear">
                <h2>
                    Admin Site</h2>
            </div>
            <div class="box-wrap clear">
                <!-- TABLE -->
                <div id="data-table">
                    <p>
                        <span style="font-family: Arial">Quản lý tài khoản</span>
                    </p>
                    <form method="post" action="#">
                    <% List<WebPortal.Model.User> list = GetAllUsers();
                    %>
                    <table class="style1 datatable">
                        <thead>
                            <tr>
                                <th class="bSortable">
                                    <input type="checkbox" class="checkbox select-all" />
                                </th>
                                <th>
                                    Username
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Ngày đăng nhập cuối
                                </th>
                                <th>
                                    Ngày tạo
                                </th>
                                <th>
                                    Nhóm
                                </th>
                                <th>
                                    Thao tác
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                if (list != null)
                                {
                                    foreach (var user in list)
                                    { %>
                            <tr>
                                <td>
                                    <input type="checkbox" class="checkbox" />
                                </td>
                                <td>
                                    <%=user.UserName %>
                                </td>
                                <td>
                                    <%=user.Email %>
                                </td>
                                <td>
                                    <%=user.LastLoginDate.ToString() %>
                                </td>
                                <td>
                                    <%=user.DateCreate.ToString() %>
                                </td>
                                <td>
                                    <%=user.Type %>
                                </td>
                                <td>
                                    <a href="#">
                                        <img src="images/ico_edit_16.png" class="icon16 fl-space2 usermanager-command" alt=""
                                            title="edit" /></a> <a href="#">
                                                <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                                                    alt="" title="delete" /></a> <a href="#">
                                                        <img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                                                            alt="" title="settings" /></a>
                                </td>
                            </tr>
                            <%} %>
                            <%} %>
                        </tbody>
                    </table>
                    </form>
                </div>
                <!-- /#table -->
            </div>
            <!-- end of box-wrap -->
        </div>
        <!-- end of box-body -->
    </div>
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
