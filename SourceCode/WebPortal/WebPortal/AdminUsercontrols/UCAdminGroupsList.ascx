<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminGroupsList.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminGroupsList" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý Nhóm</span>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Thêm Nhóm" CssClass="button" 
            onclick="Button1_Click"/>
    </p>
    <form method="post" action="#">
    <% 
        WebPortal.Repository.Group groupDA = new WebPortal.Repository.Group();
        List<WebPortal.Model.Group> list = groupDA.All();
    %>
    <table class="datatable style1">
        <thead>
            <tr>
                <th class="bSortable">
                </th>
                <th>
                    Group ID
                </th>
                <th>
                    Group Name
                </th>
                <th>
                    Group Description
                </th>
                <th>
                    Group ToString
                </th>
                <th>
                    Group DataCreate
                </th>
                <th>
                    User Create
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
                    foreach (var group in list)
                    { %>
            <tr>
                <td>
                </td>
                <td>
                    <%=group.GroupID%>
                </td>
                <td>
                    <%=group.Group_Name %>
                </td>
                <td>
                    <%=group.Group_Description %>
                </td>
                <td>
                    <%=group.Group_ToString %>
                </td>
                <td>
                    <%=group.Group_DateCreate.ToString() %>
                </td>
                <td>
                    <%=group.User_Create.ToString() %>
                </td>
                <td>
                    <%=group.Active.ToString() %>
                </td>
                <td>
                    <a href="AdminGroupsManager.aspx?id=<%=group.GroupID %>&type=delete">
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a> <a href="AdminGroupsManager.aspx?id=<%=group.GroupID%>&type=edit">
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
