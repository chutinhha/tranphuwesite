<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminHomepage.aspx.cs" Inherits="WebPortal.AdminHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p> Chào mừng các bạn đến với trang admin của website trường THPT Trần Phú</p>
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
