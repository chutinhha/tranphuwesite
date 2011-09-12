<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="AdminGiaoVienPanel.aspx.cs" Inherits="WebPortal.AdminGiaoVienPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <div>
        <p>
            <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý giáo viên</span>
        </p>
        <table class="style1">
            <thead>
                <tr>
                    <td>
                        <asp:ImageButton ImageUrl="../images/ico_page_64.png" ID="ThemGiaoVien" runat="server"
                            AlternateText="Thêm Giáo Viên" onclick="ThemGiaoVien_Click" /><a href="../AdminGiaoVienManager.aspx?id=0&type=new">Thêm Giáo Viên</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ImageButton ImageUrl="../images/ico_folder_64.png" ID="QuanLyApplication" runat="server"
                            AlternateText="Quản Lý Giáo Viên" onclick="QuanLyApplication_Click" />
                        <a id="A1" href="../AdminGiaoVienManager.aspx" runat="server">Quản Lý Thông Tin Giáo Viên</a>
                    </td>
                </tr>
            </thead>
        </table>
    </div>
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
