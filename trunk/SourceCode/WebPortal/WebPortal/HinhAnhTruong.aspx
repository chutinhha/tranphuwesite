<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HinhAnhTruong.aspx.cs" Inherits="WebPortal.HinhAnhTruong" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Trường THPT Trần Phú</title>
    <link href="css/960_24_col.css" rel="stylesheet" type="text/css" />
    <link href="css/reset.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/lightbox.css" rel="stylesheet" type="text/css" />
    <%--//trytytr--%>
    <script src="js/prototype.js" type="text/javascript"></script>
    <script src="js/scriptaculous.js" type="text/javascript"></script>
    <script src="js/effects.js" type="text/javascript"></script>
    <script src="js/lightbox.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="wrapper" class="container_24">
        <div class="banner" style="margin: 10px 0; height: 143px;">
            <a href=TrangChu.aspx><div class="grid_24">
                <object id="flash1" data="images/banner.swf" height="138" type="application/x-shockwave-flash"
                    width="950">
                    <param name="movie" value="images/banner.swf" />
                </object>
            </div></a>
        </div>
        <!--end banner-->
        <div class="menuBar grid_24" style="display: none;">
            <ul id="nav">
                <li class="active"><a href="#">Trang chủ</a></li>
                <li><a href="#">Forum</a></li>
                <li><a href="#">Tin tức</a></li>
            </ul>
        </div>
        <!--end menubar-->
        <div class="clear">
        </div>
        <div class="content grid_24">
            <div class="leftColumn grid_5 alpha">
                <div class="menu">
                    <div class="menuTitle">
                        <div class="menuTitleGrad">
                            Giới thiệu trường</div>
                    </div>
                    <div class="noiDungGioiThieuTruong" style="font-size: 13px;">
                        <a href="#">
                            <img alt="" height="105" src="images/images.gif" width="170" style="margin-bottom: 6px;" /></a>
                        Trường Trần Phú có lịch sử là một tu viện cổ, sau này được sửa sang và nâng cấp
                        thành trường học. Bên hông trường hiện nay vẫn còn một nhà nguyện cổ, nếu tinh ý
                        một chút bạn sẽ nhận ra....</div>
                    <div class="readmore" style="text-align: right; margin: 0 6px 6px 0; font-size: 11px;">
                        <a href="GioiThieuTruong.aspx" style="text-decoration: none;">Xem tiếp</a></div>
                </div>
                <!--end giới thiệu trường-->
                
              
                
                <!--end menu-->
                <div class="clear">
                </div>
                <div class="menu">
                    <div class="menuTitle">
                        <div class="menuTitleGrad">
                            Liên kết web</div>
                    </div>
                    <div class="webLinks">
                        <div>
                            <a href="">
                                <img alt="" src="images/CLB_KhoaHocXaHoi.jpg" width="137" height="140" style="margin-bottom: 6px;" /></a>
                            <a href="">
                                <img alt="" src="images/CLB_KhoaHocTuNhien.jpg" width="137" height="140" style="margin-bottom: 6px;" /></a>
                        </div>
                    </div>
                </div>
                <!--end liên kết web-->
                <div class="menu">
                    <div class="menuTitle">
                        <div class="menuTitleGrad">
                            Thống kê</div>
                    </div>
                    <div class="thongKeInfo">
                        Số lượt truy cập: <span>
                            <%=Application["count_visit"].ToString()%></span>
                        <br />
                        Số người online: <span>
                            <%=Application["count_online"].ToString() %></span>
                    </div>
                </div>
                <!--end thống kê-->
                <div class="menu">
                    <div class="menuTitle">
                        <div class="menuTitleGrad">
                            Hình ảnh</div>
                    </div>
                    <div class="thongKeInfo">
                        <marquee direction="left" onmouseout="this.start()" onmouseover="this.stop()" scrollamount="3"
                            style="width: 165px;">
			                <table bgcolor="white">
				                <tr>
					                <td><a href=HinhAnh.aspx>
					                <img style="margin:4px;" height="100" src="images/images656900_6.jpg" width="120" /><br />
					                </a></td>
                                   <td><a href="HinhAnh.aspx">
					                <img style="margin:4px;" height="100" src="images/images.jpg" width="120" /><br />
					                </a></td>
                                    <td><a href="HinhAnh.aspx">
					                <img style="margin:4px;" height="100" src="images/images (1).jpg" width="120" /><br />
					                </a></td>
                                     <td><a href=HinhAnh.aspx>
                                    <img style="margin:4px;" height="100" src="images/1.jpg" width="120" /><br />
					                </a></td>
				                </tr>
			                </table>
                          </marquee>
                    </div>
                </div>
            </div>
            <!--end left column-->
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
                            <div class="noiDungTin">
                                <table id="table1" border="4" cellspacing="10" width="95%">
                                    
                                        <tr>
                                            <td>
                                                <a href="images/tranphu9eg6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu9eg6.jpg" border="0" width="200" height="143" alt="fd" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu3tc8.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu3tc8.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu8ps6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu8ps6.jpg" border="0" width="200" height="143" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="images/1258126379.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/1258126379.jpg" border="0" width="200" height="143" /></a>
                                            </td>
                                            <td>
                                                <a href="images/BTDN (2).jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/BTDN (2).jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                            <td>
                                                <a href="images/BTDN (2).jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/BTDN (2).jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="images/BTDN (4).jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/BTDN (4).jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                            <td>
                                                <a href="images/BTDN (4)23.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/BTDN (4)23.jpg" border="0" width="200" height="143" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu8ps6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu8ps6.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="images/HOAT DONG CUA  DOAN TRUONG.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/HOAT DONG CUA  DOAN TRUONG.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                            <td>
                                                <a href="images/Hoi truong 30 nam(2).jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/Hoi truong 30 nam(2).jpg" border="0" width="200" height="143" /></a>
                                            </td>
                                            <td>
                                                <a href="images/IMG_1920.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/IMG_1920.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="images/tranphu11pm9.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu11pm9.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu2ll0.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu2ll0.jpg" border="0" width="200" height="143" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu7eg8.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu7eg8.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="images/tranphu7eg8.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu7eg8.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu8ps6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu8ps6.jpg" border="0" width="200" height="143" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu8ps6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu8ps6.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="images/tranphu3tc8.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu3tc8.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu8ps6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu8ps6.jpg" border="0" width="200" height="143" /></a>
                                            </td>
                                            <td>
                                                <a href="images/tranphu8ps6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu8ps6.jpg" width="200" height="143" border="0" /></a>
                                            </td>
                                        </tr>
                                    
                                </table>
                                
                            </div>
                        </div>
                    </div>
                    <!--end nội dung-->
                </div>
                <!--end tin tức sự kiện-->
                <!--end thông báo-->
            </div>
            <!--end right column-->
        </div>
        <!--end content-->
    </div>
    <div class="footer">
        Copyright 2011
    </div>
    </form>
</body>
</html>
