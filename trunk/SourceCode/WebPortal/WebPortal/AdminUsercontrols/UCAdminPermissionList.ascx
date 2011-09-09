<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminPermissionList.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.AdminPermissionList" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý Permission</span>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Thêm Permission" 
            CssClass="button" onclick="Button1_Click" />
    </p>
    <form method="post" action="#">
    <% 
        WebPortal.Repository.Permission permissionDA = new WebPortal.Repository.Permission();
        List<WebPortal.Model.Permission> list = permissionDA.All();
    %>
    <table class="datatable style1">
        <thead>
            <tr>
                <th class="bSortable">
                    <input type="checkbox" class="checkbox select-all" />
                </th>
                <th>
                    ID
                </th>
                <th>
                    Name
                </th>
                <th>
                    Description
                </th>
                <th>
                    Permission ToString
                </th>
                <th>
                    Active
                </th>
                <th style="width: 150px">
                    Tool&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </th>
            </tr>
        </thead>
        <tbody>
            <% 
                if (list != null)
                {
                    foreach (var per in list)
                    { %>
            <tr>
                <td>
                    <input type="checkbox" class="checkbox" />
                </td>
                <td>
                    <%=per.PermissionID%>
                </td>
                <td>
                    <%=per.Name %>
                </td>
                <td>
                    <%=per.Descritption %>
                </td>
                <td>
                    <%=per.Permission_ToString %>
                </td>
                <td>
                    <%=per.Active.ToString() %>
                </td>
                <td>
                    <a href="AdminPermissionManager.aspx?id=<%=per.PermissionID %>&type=delete">
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a> <a href="AdminPermissionManager.aspx?id=<%=per.PermissionID%>&type=edit">
                                <img src="images/ico_settings_16.png" class="icon16 fl-space2 usermanager-command"
                                    alt="" title="Chỉnh sửa" /></a>
                </td>
            </tr>
            <%} %>
            <%} %>
        </tbody>
    </table>
    </form>
</div>
