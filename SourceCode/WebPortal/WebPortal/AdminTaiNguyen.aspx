<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminTaiNguyen.aspx.cs" Inherits="WebPortal.WebForm3" %>
<%@ Register Src="~/AdminUsercontrols/UCAdminTaiNguyenList.ascx" TagName="UCAdminTaiNguyenList"
    TagPrefix="uc1" %>
<%@ Register Src="~/AdminUsercontrols/UCAdminTaiNguyenCreate.ascx" TagName="UCAdminTaiNguyenCreate"
    TagPrefix="uc2" %>

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
                <%
                    if (Request.QueryString["type"] == null)
                    { %>
                    <uc1:UCAdminTaiNguyenList ID="UCAdminTaiNguyenList" runat="server" />
                    <%}
                    else
                    {
                        if (Request.QueryString["type"] == "delete")
                        {%>
                        <uc1:UCAdminTaiNguyenList ID="UCAdminTaiNguyenList1" runat="server" />
                        <%}
                        if (Request.QueryString["type"] == "new")
                        {%>
                        <uc2:UCAdminTaiNguyenCreate ID="UCAdminTaiNguyenCreate" runat="server" />
                        <%}
                        
                    }%>
                <!-- end of box-wrap -->
            </div>
        </div>
        <!-- end of box-wrap -->
    </div>
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
