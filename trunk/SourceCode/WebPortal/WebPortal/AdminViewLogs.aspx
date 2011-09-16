<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminViewLogs.aspx.cs" Inherits="WebPortal.AdminViewLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
            <div class="box-header clear">
                <h2>
                    Admin Site</h2>
            </div>
            <div class="box-wrap clear">
                <asp:DropDownList runat="server" ID="ddlUserList" AutoPostBack="true">
                </asp:DropDownList>
                <br />
                <br />
                <% 
                    List<WebPortal.Model.Log> logList = null;
                    if (ddlUserList.SelectedValue != null)
                    {
                        int userID = Libs.LibConvert.ConvertToInt(ddlUserList.SelectedValue, 0);
                        logList = logRepository.GetAllByUserID(userID);
                    } %>
                <table class="style1 datatable">
                    <thead>
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                Ngày ghi log
                            </th>
                            <th>
                                Trang truy cập
                            </th>
                            <th>
                                Địa chỉ IP
                            </th>
                            <th>
                                Thao tác
                            </th>
                            <th>
                                Đăng nhập vào
                            </th>
                            <th>
                                Đăng xuất vào
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            if (logList != null)
                            {
                                foreach (var log in logList)
                                { %>
                        <tr>
                            <td>
                                <%=log.LogID %>
                            </td>
                            <td>
                                <%=log.Date %>
                            </td>
                            <td>
                                <%=log.Trace%>
                            </td>
                            <td>
                                <%=log.IP%>
                            </td>
                            <td>
                                <%=log.Action%>
                            </td>
                            <td>
                                <%=log.Time_Login %>
                            </td>
                            <td>
                                <%=log.Time_Logout %>
                            </td>
                        </tr>
                        <%} %>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
