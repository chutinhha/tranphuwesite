<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminPermissionPanel.aspx.cs" Inherits="WebPortal.AdminPermissionPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<div>
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý Permission</span>
    </p>
    
    <table class="style1">
        <thead>
        <tr>
           <td> <asp:ImageButton ImageUrl="../images/ico_page_64.png" ID="ThemPermission" 
                   runat="server" AlternateText="Thêm Permission" 
                   onclick="ThemPermission_Click" /><a href="../AdminPermissionManager.aspx?id=0&type=new">Thêm Permission</a>
                   </td>
        </tr>
         <tr>
           <td> 
               <asp:ImageButton ImageUrl="../images/ico_folder_64.png" ID="QuanLyPermission" 
                   runat="server" AlternateText="Thêm Nhóm" onclick="QuanLyPermission_Click"/>
           <a id="A1" href="../AdminPermissionManager.aspx" runat="server">Quản Lý Thông Tin Permission</a>
           </td>
        </tr>
        </thead>
        </table>
    </div>
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
