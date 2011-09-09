<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="NoAccess.aspx.cs" Inherits="WebPortal.NoAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
         <div class="box-wrap clear">
            <div style="height: 300px; color:Red; font-size:18px;">
                <p>
                    <b>Bạn không có quyền truy cập trang này! </b>
                </p>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
