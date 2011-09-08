<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminApplicationList.ascx.cs" Inherits="WebPortal.AdminUsercontrols.AdminApplicationList" %>
<div id="data-table">
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý Permission</span>
    </p>
    <a href="../AdminApplicationManager.aspx?id=0&type=new">Thêm Application</a>
    <form method="post" action="#">
    <% 
        WebPortal.Repository.Application appDA = new WebPortal.Repository.Application();
        List<WebPortal.Model.Application> list = appDA.All();
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
                    <input type="checkbox" class="checkbox" />
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
                <a href="<%=app.Application_Image%>" title="preview" rel="group1"><img src="<%=app.Application_Image%>" alt="" class="thumb size64 fl-space" />
                    
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
