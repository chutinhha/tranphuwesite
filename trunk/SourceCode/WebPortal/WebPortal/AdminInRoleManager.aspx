<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminInRoleManager.aspx.cs" Inherits="WebPortal.AdminInRoleManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
            <form method="post">
            <div class="box-header clear">
                <h2>
                    Admin Site</h2>
            </div>
            <div class="box-wrap clear">
                <p>
                    <b>Chọn nhóm người dùng</b>
                    <asp:DropDownList runat="server" ID="ddlGroupList" AutoPostBack="true">
                    </asp:DropDownList>
                </p>
                <% List<WebPortal.Model.Application> currentAppList = null;
                   if (ddlGroupList.SelectedItem != null)
                   {
                       int groupID = Libs.LibConvert.ConvertToInt(ddlGroupList.SelectedValue, 0);
                       var group = groupRepository.Single(groupID);
                       currentAppList = appRepository.GetAllApplicationByGroupID(groupID);
                %>
                <table class="style1">
                    <tbody>
                        <tr>
                            <th>
                                Tên nhóm
                            </th>
                            <td>
                                <%=group.Group_Name %>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Mô tả thông tin
                            </th>
                            <td>
                                <%=group.Group_Description %>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Ngày tạo nhóm
                            </th>
                            <td>
                                <%=group.Group_DateCreate %>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%}%>
                <div>
                    <%  List<WebPortal.Model.Application> appList = appRepository.All();%>
                    <div id="table">
                        <p>
                            <b>Danh sách các trang truy cập</b></p>
                        <table class="style1">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="checkbox select-all" />
                                    </th>
                                    <th>
                                        Tên trang
                                    </th>
                                    <th>
                                        Mô tả
                                    </th>
                                    <th>
                                        Hình ảnh
                                    </th>
                                    <th>
                                        Ngày tạo
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    foreach (var app in appList)
                                    {
                                %>
                                <tr>
                                    <td>
                                        <% if (IsInsideApplicationList(app.ApplicationID, currentAppList))
                                           { %>
                                        <input name="apps" type="checkbox" class="checkbox" value="<%=app.ApplicationID %>"
                                            checked="checked" />
                                        <%}
                                           else
                                           { %>
                                        <input name="apps" type="checkbox" class="checkbox" value="<%=app.ApplicationID %>" />
                                        <%} %>
                                    </td>
                                    <td>
                                        <%=app.Application_Name %>
                                    </td>
                                    <td>
                                        <%=app.Application_Description %>
                                    </td>
                                    <td>
                                        <image src="<%=app.Application_Image %>" alt="" title="Hình ảnh" style="max-height: 100px;
                                            max-width: 100px; border: 1px solid #ccc" />
                                    </td>
                                    <td>
                                        <%=app.Application_DateCreate %>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                        <div class="tab-footer clear">
                            <div class="fr">
                                <input type="submit" value="Lưu thay đổi" name="save" class="button" />
                            </div>
                        </div>
                    </div>
                    <!-- /#table -->
                </div>
            </div>
            <% if (Request.Form["save"] != null)
               {
                   if (Request.Form["apps"] != null)
                   {
                       string[] ids = Request.Form["apps"].Split(',');
                       List<int> appIDList = new List<int>();
                       foreach (string s in ids)
                       {
                           appIDList.Add(Libs.LibConvert.ConvertToInt(s, 0));
                       }
                       int groupID = Libs.LibConvert.ConvertToInt(this.ddlGroupList.SelectedValue, 0);
                       if (inroleRepository.DecentralizeGroupWithApps(groupID, appIDList))
                       {%>
            <div class="notification note-success">
                <a href="#" class="close" title="Close notification">close</a>
                <p>
                    <strong>Success notification:</strong> Lưu thay đổi thành công
                </p>
            </div>
            <%}
                       else
                       {%>
            <div class="notification note-error">
                <a href="#" class="close" title="Close notification">close</a>
                <p>
                    <strong>Error notification:</strong> Đã có lỗi xảy ra, vui lòng thử lại</p>
            </div>
            <%}
                   }
               }  %>
            </form>
        </div>
    </div>
    <% 
        WebPortal.Repository.Log.WriteLog(Request);
    %>
</asp:Content>
