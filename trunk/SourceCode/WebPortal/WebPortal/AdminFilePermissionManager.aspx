<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminFilePermissionManager.aspx.cs" Inherits="WebPortal.AdminFilePermissionManager" %>

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
                <% List<WebPortal.Model.Permission> currentPermissionList = null;
                   if (ddlGroupList.SelectedItem != null)
                   {
                       int groupID = Libs.LibConvert.ConvertToInt(ddlGroupList.SelectedValue, 0);
                       var group = groupRepository.Single(groupID);
                       currentPermissionList = permissionRepository.GetAllPermissionByGroupID(groupID);
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
                    <%  List<WebPortal.Model.Permission> permissionList = permissionRepository.All();%>
                    <div id="table">
                        <p>
                            <b>Danh sách các thư mục</b></p>
                        <table class="style1">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="checkbox select-all" />
                                    </th>
                                    <th>
                                        Tên thư mục
                                    </th>
                                    <th>
                                        Mô tả
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    foreach (var permission in permissionList)
                                    {
                                %>
                                <tr>
                                    <td>
                                        <% if (IsInsidePermissionList(permission.PermissionID, currentPermissionList))
                                           { %>
                                        <input name="permissions" type="checkbox" class="checkbox" value="<%=permission.PermissionID %>"
                                            checked="checked" />
                                        <%}
                                           else
                                           { %>
                                        <input name="permissions" type="checkbox" class="checkbox" value="<%=permission.PermissionID %>" />
                                        <%} %>
                                    </td>
                                    <td>
                                        <%=permission.Name %>
                                    </td>
                                    <td>
                                        <%=permission.Descritption %>
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
                   if (Request.Form["permissions"] != null)
                   {
                       string[] ids = Request.Form["permissions"].Split(',');
                       List<int> permissionIDList = new List<int>();
                       foreach (string s in ids)
                       {
                           permissionIDList.Add(Libs.LibConvert.ConvertToInt(s, 0));
                       }
                       int groupID = Libs.LibConvert.ConvertToInt(this.ddlGroupList.SelectedValue, 0);
                       if (filePermissionRepository.DecentralizeGroupWithPermission(groupID, permissionIDList))
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
