﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminUserManager.aspx.cs" Inherits="WebPortal.AdminIndex" %>

<%@ Register TagPrefix="UC" TagName="UserList" Src="~/AdminUsercontrols/UCAdminUserList.ascx" %>
<%@ Register TagPrefix="UC" TagName="UserDetail" Src="~/AdminUsercontrols/UCAdminUserDetail.ascx" %>
<%@ Register TagPrefix="UC" TagName="ProfileDetail" Src="~/AdminUsercontrols/UCAdminProfileDetail.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/admin-usermanager.css" rel="Stylesheet" />
    <script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    username: {
                        required: true,
                        rangelength: [6, 10]
                    },
                    password: {
                        required: true,
                        rangelength: [6, 10]
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    firstname: {
                        required: true
                    },
                    lastname: {
                        required: true
                    }
                }
            });

            $('input[name="birthday"]').datepicker({
                dateFormat: 'dd/mm/yy'
            });

            $("#back").click(function () {
                document.location.href = "AdminUserManager.aspx";
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
                <% if (Request.QueryString.Count == 0)
                   {%>
                <UC:UserList runat="server" ID="UCUserList" />
                <%}
                   else if (Request.QueryString["type"] != null)
                   {
                       if (Request.QueryString["id"] != null && Request.QueryString["type"].ToString() == "delete")
                       { %>
                <UC:UserList runat="server" ID="UserList" />
                <br />
                <br />
                <%
string mess = string.Empty;
int id = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
if (DeleteUser(id, ref mess))
{%>
                <!-- NOTIFICATIONS (Thong bao)-->
                <div class="notification note-success">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>
                            <%=mess%></strong></p>
                </div>
                <%}
                            else
                            {%>
                <!-- NOTIFICATIONS (Thong bao)-->
                <div class="notification note-error">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>
                            <%=mess%></strong></p>
                </div>
                <%}
                %>
                <%}
                       else if (Request.QueryString["id"] != null && Request.QueryString["type"].ToString() == "edit" || Request.QueryString["type"].ToString() == "new")
                       {%>
                <UC:UserDetail runat="server" />
                <%}
                       else if (Request.QueryString["id"] != null && (Request.QueryString["type"].ToString() == "editprofile" || Request.QueryString["type"].ToString() == "newprofile"))
                       {%>
                <UC:ProfileDetail runat="server" ID="UCProfileDetail" />
                <%}
                       else if (Request.QueryString["id"] != null && Request.QueryString["type"].ToString() == "deleteprofile" && Request.QueryString["profileID"] != null)
                       { %>
                <UC:UserDetail runat="server" />
                <%
string mess = string.Empty;
int id = Libs.LibConvert.ConvertToInt(Request.QueryString["profileID"], 0);
if (DeleteProfile(id, ref mess))
{%>
                <!-- NOTIFICATIONS (Thong bao)-->
                <div class="notification note-success">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>
                            <%=mess%></strong></p>
                </div>
                <%}
                            else
                            {%>
                <!-- NOTIFICATIONS (Thong bao)-->
                <div class="notification note-error">
                    <a href="#" class="close" title="Close notification">close</a>
                    <p>
                        <strong>
                            <%=mess%></strong></p>
                </div>
                <%}
                %>
                <%} %>
                <%} %>
                <!-- end of box-wrap -->
            </div>
        </div>
        <!-- end of box-wrap -->
        <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
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
