<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HinhAnhTruong.aspx.cs"
    Inherits="WebPortal.HinhAnhTruong" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="robots" content="ALL,FOLLOW" />
<meta name="Author" content="AIT" />
<meta http-equiv="imagetoolbar" content="no" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link href="css/960_24_col.css" rel="stylesheet" type="text/css" />
    <%--<link href="css/reset.css" rel="stylesheet" type="text/css" />--%>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/reset.css" type="text/css" />
   <%-- <link rel="stylesheet" href="css/screen.css" type="text/css" />--%>
    <link rel="stylesheet" href="css/fancybox.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery.wysiwyg.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery.ui.css" type="text/css" />
    <link rel="stylesheet" href="css/visualize.css" type="text/css" />
    <link rel="stylesheet" href="css/visualize-light.css" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.visualize.js"></script>
    <script type="text/javascript" src="js/jquery.wysiwyg.js"></script>
    <script type="text/javascript" src="js/tiny_mce/jquery.tinymce.js"></script>
    <script type="text/javascript" src="js/jquery.fancybox.js"></script>
    <script type="text/javascript" src="js/jquery.idtabs.js"></script>
    <script type="text/javascript" src="js/jquery.datatables.js"></script><script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/jquery.jeditable.js"></script>
    <script type="text/javascript" src="js/jquery.ui.js"></script>
    <script type="text/javascript" src="js/jquery.jcarousel.js"></script>
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    <script type="text/javascript" src="js/excanvas.js"></script>
    <script type="text/javascript" src="js/cufon.js"></script>
    <script type="text/javascript" src="js/Zurich_Condensed_Lt_Bd.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-12958851-8']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    
        function time() {
            days = new Array("Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy");
            months = new Array("tháng 01 năm", "tháng 02 năm", "tháng 03 năm", "tháng 04 năm", "tháng 05 năm", "tháng 06 năm", "tháng 07 năm", "tháng 08 năm", "tháng 09 năm", "tháng 10 năm", "tháng 11 năm", "tháng 12 năm");
            today = new Date();

            thisDay = today.getDay();
            thisDate = today.getDate();
            thisMonth = today.getMonth();
            thisYear = today.getFullYear();
            todayDay = days[thisDay];
            todayMonth = months[thisMonth];
            document.getElementById('txt').innerHTML = '<b>' + todayDay + "," + " " + thisDate + " " + todayMonth + " " + thisYear + '</b>';
        }
	
		
    </script>
</head>
<body onload="time()">
    <form id="form1" runat="server">
    <div class="shadow">
        <div class="bigWhite">
            <div id="wrapper" class="container_24">
                <div class="banner" style="margin: 10px 0; height: 143px;">
                    <div class="grid_24">
                        <a href="TrangChu.aspx">
                            <object id="flash1" data="images/banner.swf" height="138" type="application/x-shockwave-flash"
                                width="950">
                                <param name="movie" value="images/banner.swf" />
                            </object>
                        </a>
                    </div>
                </div>
                <!--end banner-->
                <div class="menuBar grid_24" style="">
                    <ul id="nav">
                        <li class="active"><a href="TrangChu.aspx">Trang chủ</a></li>
                        <li><a href="#">Liên hệ</a></li>
                        <li><a href="GioiThieuTruong.aspx">Giới thiệu trường</a></li>
                    </ul>
                    <div class="time">
                        <span id="txt" class="white" style="display: inline-block;"></span>
                    </div>
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
                        <div class="menu">
                            <div class="menuTitle">
                                <div class="menuTitleGrad">
                                    Tổ chức</div>
                            </div>
                            <div class="menuItem">
                                <ul>
                                    <%WebPortal.ToChuc apptochu = new WebPortal.ToChuc();
                                      List<WebPortal.Model.ToChuc> listtochuc = apptochu.All();
                                      foreach (WebPortal.Model.ToChuc tc in listtochuc)
                                      {
                                    %>
                                    <li><a href="ToChuc.aspx?idToChuc=<%=tc.IDToChuc %>">
                                        <%=tc.TenTC%></a></li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>
                        <%-------------------%>
                        <%WebPortal.Repository.LoaiTinLV1 appltLV1 = new WebPortal.Repository.LoaiTinLV1();
                          List<WebPortal.Model.LoaiTin_Lv1> listLTLV1 = new List<WebPortal.Model.LoaiTin_Lv1>();
                          listLTLV1 = appltLV1.All();

                          int idlt;
                          foreach (WebPortal.Model.LoaiTin_Lv1 lt in listLTLV1)
                          {
                              idlt = lt.IDLoaiTin_Lv1;
                              if (idlt != null)
                              {
                        %>
                        <div class="menu">
                            <div class="menuTitle">
                                <div class="menuTitleGrad">
                                    <%=lt.TenLoai%></div>
                            </div>
                            <div class="menuItem">
                                <ul>
                                    <%
WebPortal.LoaiTin appLoaiTin = new WebPortal.LoaiTin();
List<WebPortal.Model.LoaiTin> listLoaiTin = appLoaiTin.ListNews(idlt);
foreach (WebPortal.Model.LoaiTin lt2 in listLoaiTin)
{%>
                                    <li><a href="News2.aspx?idLoaiTin=<%=lt2.IDLoaiTin %>">
                                        <%=lt2.TenLoai %></a></li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>
                        <%}
                  } %>
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
                                    <a href="#">
                                        <img alt="" src="images/CLB_KhoaHocXaHoi.jpg" width="137" height="140" style="margin-bottom: 6px;" /></a>
                                    <a href="#">
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
					                <td><a href="HinhAnhTruong.aspx">
					                <img style="margin:4px;" height="100" src="images/images656900_6.jpg" width="120" /><br />
					                </a></td>
                                   <td><a href="HinhAnhTruong.aspx">
					                <img style="margin:4px;" height="100" src="images/images.jpg" width="120" /><br />
					                </a></td>
                                    <td><a href="HinhAnhTruong.aspx">
					                <img style="margin:4px;" height="100" src="images/images (1).jpg" width="120" /><br />
					                </a></td>
                                     <td><a href="HinhAnhTruong.aspx">
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
                                                <tr>
                                                    <td>
                                                        <a href="images/tranphu9eg6.jpg" title="preview" rel="group1">
                                                            <img width="200" height="143" src="images/tranphu9eg6.jpg" alt="" class="thumb fl-space" />
                                                        </a>
                                                        <%-- <a href="images/tranphu9eg6.jpg" rel="lightbox[roadtrip]">
                                                    <img src="images/tranphu9eg6.jpg" border="0" width="200" height="143" alt="fd" /></a>--%>
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
                        <!--end tin tức sự kiện-->
                        <!--end thông báo-->
                    </div>
                    <!--end right column-->
                </div>
                <!--end content-->
            </div>
            <div class="footer">
                Copyright 2011<br />
                Trường THPT Trần Phú<br />
                Số 1 Hùng Vương ,Phường 10 -Đà Lạt ,Lâm Đồng.
            </div>
        </div>
    </div>
    </form>
</body>
</html>
