<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminNewsManager.aspx.cs" Inherits="WebPortal.AdminNewsManager" %>

<%@ Register Src="AdminUsercontrols/UCAdminNewsList.ascx" TagName="UCAdminNewsList"
    TagPrefix="uc1" %>
<%@ Register Src="AdminUsercontrols/UCAdminNewsDetail.ascx" TagName="UCAdminNewsDetail"
    TagPrefix="uc2" %>
<%@ Register Src="AdminUsercontrols/UCAdminNewsCreate.ascx" TagName="UCAdminNewsCreate"
    TagPrefix="uc3" %>
<%@ Register Src="AdminUsercontrols/UCAdminUploadFile.ascx" TagName="UCAdminUploadFile"
    TagPrefix="uc4" %>
<%@ Register Src="AdminUsercontrols/UCAdminNewsEdit.ascx" TagName="UCAdminNewsEdit"
    TagPrefix="uc5" %>
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
                    <uc1:UCAdminNewsList ID="UCAdminNewsList" runat="server" />
                    <%}
                    else
                    {
                        if (Request.QueryString["type"] == "edit")
                        {%>
                        <uc5:UCAdminNewsEdit ID="UCAdminNewsEdit1" runat="server" />
                        <%}
                        if (Request.QueryString["type"] == "new")
                        {%>
                        <uc3:UCAdminNewsCreate ID="UCAdminNewsCreate" runat="server" />
                        <%}
                        if (Request.QueryString["type"] == "attach")
                        { %>
                        <uc4:UCAdminUploadFile ID="UCAdminUploadFile1" runat="server" />
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
