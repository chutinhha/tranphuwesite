<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminApplicationList.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminApplicationList" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý quyền
            truy cập trang</span>
    </p>
    <p>
        <asp:Button runat="server" Text="Tạo mới" CssClass="button" OnClick="Unnamed1_Click" />
    </p>
    <form method="post" action="#">
    <% 
        WebPortal.Repository.Application appDA = new WebPortal.Repository.Application();
        List<WebPortal.Model.Application> list = appDA.All();
    %>
    <table class="style1 datatable">
        <thead>
            <tr class="bSortable">
                <th>
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
                    File Path
                </th>
                <th>
                    Image
                </th>
                <th>
                    Parent_ID
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
                    foreach (var app in list)
                    { %>
            <tr>
                <td>
                </td>
                <td>
                    <%=app.ApplicationID%>
                </td>
                <td>
                    <%=app.Application_Name%>
                </td>
                <td>
                    <%=app.Application_Description%>
                </td>
                <td>
                    <%=app.Application_FilePath%>
                </td>
                <td>
                    <%if (app.Application_Image != null)
                      {%>
                    <a href="<%=app.Application_Image%>" title="preview" rel="group1">
                        <img src="<%=app.Application_Image%>" alt="" class="thumb size64 fl-space" />
                    </a>
                    <%}
                      else
                      {
                    %>
                    <a href="images/default_image.png" title="preview" rel="group1">
                        <img src="images/default_image.png" alt="" class="thumb size64 fl-space" />
                    </a>
                    <%} %>
                </td>
                <td>
                    <%=app.Parent_Id.ToString()%>
                </td>
                <td>
                    <%=app.Active.ToString()%>
                </td>
                <td>
                    <a href="AdminApplicationManager.aspx?id=<%=app.ApplicationID %>&type=delete">
                        <img src="images/ico_delete_16.png" class="icon16 fl-space2 usermanager-command"
                            alt="" title="Xóa" /></a> <a href="AdminApplicationManager.aspx?id=<%=app.ApplicationID%>&type=edit">
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
