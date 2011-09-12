<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminApplicationPanel.aspx.cs" Inherits="WebPortal.AdminApplicationPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
        <p>
            <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Quản lý Application</span>
        </p>
        <table class="style1">
            <thead>
                <tr>
                    <td>
                        <asp:ImageButton ImageUrl="../images/ico_page_64.png" ID="ThemApplication" runat="server"
                            AlternateText="Thêm Application" onclick="ThemApplication_Click" /><a href="../AdminApplicationManager.aspx?id=0&type=new">Thêm Application</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ImageButton ImageUrl="../images/ico_folder_64.png" ID="QuanLyApplication" runat="server"
                            AlternateText="Quản Lý Application" onclick="QuanLyApplication_Click" />
                        <a id="A1" href="../AdminApplicationManager.aspx" runat="server">Quản Lý Thông Tin Application</a>
                    </td>
                </tr>
            </thead>
        </table>
    </div>
            <% 
            WebPortal.Repository.Log.WriteLog(Request);
            %>
</asp:Content>
