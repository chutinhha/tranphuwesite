<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminChucVu.aspx.cs" Inherits="WebPortal.AdminChucVu" %>
<%@ Register src="AdminUsercontrols/UCAdminChucVu.ascx" tagname="UCAdminChucVu" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <uc1:UCAdminChucVu ID="UCAdminChucVu1" runat="server" />
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
