<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminGroupsPanel.ascx.cs" Inherits="WebPortal.AdminUsercontrols.UCAdminGroupsPanel" %>
<div>
    <p>
        <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý Nhóm</span>
    </p>
    
    <table class="style1">
        <thead>
        <tr>
           <td> <asp:ImageButton ImageUrl="../images/ico_page_64.png" ID="ThemNhom" 
                   runat="server" AlternateText="Thêm Nhóm" onclick="ThemNhom_Click" /><a href="../AdminGroupsManager.aspx?id=0&type=new">Thêm Nhóm</a>
                   </td>
        </tr>
         <tr>
           <td> <asp:ImageButton ImageUrl="../images/ico_folder_64.png" ID="ImageButton1" 
                   runat="server" AlternateText="Thêm Nhóm" onclick="ImageButton1_Click" />
           <a href="../AdminGroupsManager.aspx" runat="server">Quản Lý Thông Tin Nhóm</a>
           </td>
        </tr>
        </thead>
        </table>
    </div>