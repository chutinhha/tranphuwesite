<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminInGroupManager.aspx.cs" Inherits="WebPortal.AdminInGroupManager" %>

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
                    <b>Chọn tên đăng nhập</b>
                    <asp:DropDownList runat="server" ID="ddlUserList" AutoPostBack="true">
                    </asp:DropDownList>
                </p>
                <% List<WebPortal.Model.Group> currentGroupList = null;
                   if (ddlUserList.SelectedItem != null)
                   {
                       int userID = Libs.LibConvert.ConvertToInt(ddlUserList.SelectedValue, 0);
                       var user = userRepository.Single(userID);
                       currentGroupList = groupRepository.GetAllGroupByUserID(userID);
                %>
                <table class="style1">
                    <tbody>
                        <tr>
                            <th>
                                Tên đăng nhập
                            </th>
                            <td>
                                <%=user.UserName %>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Email
                            </th>
                            <td>
                                <%=user.Email %>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Mô tả thông tin
                            </th>
                            <td>
                                <%=user.Type %>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Ngày tạo tài khoản
                            </th>
                            <td>
                                <%=user.DateCreate %>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <%}%>
                <div>
                    <%  List<WebPortal.Model.Group> groupList = groupRepository.All();%>
                    <div id="table">
                        <p>
                            <b>Danh sách các nhóm người dùng</b></p>
                        <table class="style1">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" class="checkbox select-all" />
                                    </th>
                                    <th>
                                        Tên nhóm
                                    </th>
                                    <th>
                                        Mô tả nhóm
                                    </th>
                                    <th>
                                        Ngày tạo
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    foreach (var group in groupList)
                                    {
                                %>
                                <tr>
                                    <td>
                                        <% if (IsInsideGroupList(group.GroupID, currentGroupList))
                                           { %>
                                        <input name="groups" type="checkbox" class="checkbox" value="<%=group.GroupID %>"
                                            checked="checked" />
                                        <%}
                                           else
                                           { %>
                                        <input name="groups" type="checkbox" class="checkbox" value="<%=group.GroupID %>" />
                                        <%} %>
                                    </td>
                                    <td>
                                        <%=group.Group_Name %>
                                    </td>
                                    <td>
                                        <%=group.Group_Description %>
                                    </td>
                                    <td>
                                        <%=group.Group_DateCreate %>
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

                   if (Request.Form["groups"] != null)
                   {
                       string[] ids = Request.Form["groups"].Split(',');
                       List<int> groupIDList = new List<int>();
                       foreach (string s in ids)
                       {
                           groupIDList.Add(Libs.LibConvert.ConvertToInt(s, 0));
                       }
                       int userID = Libs.LibConvert.ConvertToInt(this.ddlUserList.SelectedValue, 0);
                       if (ingroupRepository.DecentralizeUserWithGroups(userID, groupIDList))
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
</asp:Content>
