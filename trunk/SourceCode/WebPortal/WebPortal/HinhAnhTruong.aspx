<%@ Page Title="" Language="C#" MasterPageFile="~/FontendSite.Master" AutoEventWireup="true"
    CodeBehind="HinhAnhTruong.aspx.cs" Inherits="WebPortal.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rightColumn grid_19 omega">
        <div class="rightColumn grid_19 omega">
            <div class="titleBox">
                <div class="title">
                    <div class="titleGrad">
                        Hình ảnh trường</div>
                </div>
                <div class="trangTin">
                    <div class="tinTuc">
                        <div class="clear">
                        </div>
                        <div class="noiDungTin" id="data-table">
                            <table class="style1" border="4" cellspacing="10" width="95%">
                                <%List<string> listHinh = LayHinhAnh();
                                  int index = 0;
                                  for (int i = 0; i < 5; i++)
                                  { %>
                                <tr>
                                    <%for (int j = 0; j < 3; j++)
                                      {
                                          if (index < listHinh.Count)
                                          {%>
                                    <td>
                                        <a href="<%=listHinh[index] %>" title="preview" rel="group1">
                                            <img width="200" height="143" src="<%=listHinh[index] %>" alt="" class="thumb fl-space" />
                                        </a>
                                    </td>
                                    <%
                                        index++;
                                          }
                                      }
                                    %>
                                </tr>
                                <%} %>
                            </table>
                        </div>
                    </div>
                </div>
                <!--end nội dung-->
            </div>
            <!--end tin tức sự kiện-->
            <!--end thông báo-->
        </div>
        <!--end tin tức sự kiện-->
        <!--end thông báo-->
    </div>
</asp:Content>
