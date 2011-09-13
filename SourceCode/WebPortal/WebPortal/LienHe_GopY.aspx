<%@ Page Title="" Language="C#" MasterPageFile="~/FontendSite.Master" AutoEventWireup="true" CodeBehind="LienHe_GopY.aspx.cs" Inherits="WebPortal.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="titleBox">
                    <div class="title">
                        <div class="titleGrad">
                            Liên hệ - Góp ý
                        </div>
                    </div>
                     <div class="trangTin">
                        <div class="tinTuc">
                            <div class="tieuDe">
                                Trường trung học phổ thông Trần Phú
                            </div>
                            <div class="noiDungTin" style="padding:50px 0 0 50px">
                               Điạ chỉ: 20 Hùng Vương, TP Đà Lạt.<br />
                            Điện thoại: (0633) 3640297<br />
                            Email: tranphu.edu.vn<br />
                                <br />
                                <br />
                                Họ tên:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtTen" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtTen" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                <br />
                                Địa chỉ:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtDiaChi" runat="server" Width="200px"></asp:TextBox>
                                <br />
                                <br />
                                Số điện thoại:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtSoDT" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtSoDT" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                <br />
                                Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                <br />
                                Tiêu đề:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtTieuDe" runat="server" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="txtTieuDe" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                                Nội dung:<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtNoiDung" runat="server" Height="176px" Width="406px" 
                                    TextMode="MultiLine"></asp:TextBox>
                                <br />
                                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnGui" runat="server" onclick="btnGui_Click" Text="Gửi" 
                                    Width="40px" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnHuy" runat="server" onclick="btnHuy_Click" Text="Hủy" />
                                <br />
                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                   
                </div>
</asp:Content>
