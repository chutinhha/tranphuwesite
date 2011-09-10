<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminToChuc.aspx.cs" Inherits="WebPortal.AdminToChuc" %>
<%@ Register src="AdminUsercontrols/UCToChuc.ascx" tagname="UCToChuc" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <uc1:UCToChuc ID="UCToChuc1" runat="server" />
</asp:Content>
