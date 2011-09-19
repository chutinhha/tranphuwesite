<%@ Page Title="" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true"
    CodeBehind="AdminLoaiTinManager.aspx.cs" Inherits="WebPortal.AdminLoaiTinManager" %>
<%@ Register Src="AdminUsercontrols/UCAdminLoaiTinList.ascx" TagName="UCAdminLoaiTinList"
    TagPrefix="uc1" %>
<%@ Register Src="AdminUsercontrols/UCAdminLoaiTinCreate.ascx" TagName="UCAdminLoaiTinCreate"
    TagPrefix="uc2" %>
<%@ Register Src="AdminUsercontrols/UCAdminLoaiTinCreateChild.ascx" TagName="UCAdminLoaiTinCreateChild"
    TagPrefix="uc3" %>
<%@ Register Src="AdminUsercontrols/UCAdminLoaiTinEdit.ascx" TagName="UCAdminLoaiTinEdit"
    TagPrefix="uc4" %>
<%@ Register Src="AdminUsercontrols/UCAdminLoaiTinListChild.ascx" TagName="UCAdminLoaiTinListChild"
    TagPrefix="uc6" %>
<%@ Register Src="AdminUsercontrols/UCAdminLoaiTinEditChild.ascx" TagName="UCAdminLoaiTinEditChild"
    TagPrefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content-box">
        <div class="box-body">
            <div class="box-header clear">
                <h2>
                    Admin Site</h2>
            </div>
            <div class="box-wrap clear">
                <%
                    if (Request.QueryString["type"] == null)
                    { %>
                <uc1:UCAdminLoaiTinList ID="UCAdminLoaiTinList1" runat="server" />
                <%}
                    else
                    {
                        if (Request.QueryString["type"] == "delete")
                        {%>
                <div>
                    <uc1:UCAdminLoaiTinList ID="UCAdminLoaiTinList2" runat="server" />
                </div>
                <%}

                        if (Request.QueryString["type"] == "edit")
                        {%>
                <uc4:UCAdminLoaiTinEdit ID="UCAdminLoaiTinEdit1" runat="server" />
                <%}
                        if (Request.QueryString["type"] == "new")
                        {%>
                <uc2:UCAdminLoaiTinCreate ID="UCAdminLoaiTinCreate1" runat="server" />
                <%}
                        if (Request.QueryString["type"] == "createChild")
                        { %>
                <uc3:UCAdminLoaiTinCreateChild ID="UCAdminLoaiTinCreateChild1" runat="server" />
                <%}
                            if (Request.QueryString["type"] == "listChild")
                            {%>
                <div>
                    <uc6:UCAdminLoaiTinListChild ID="UCAdminLoaiTinListChild1" runat="server" />
                </div>
                <%}
                        if (Request.QueryString["type"] == "editChild")
                        {%>
                <div>
                    <uc7:UCAdminLoaiTinEditChild ID="UCAdminLoaiTinEditChild1" runat="server" />
                </div>
                <%}
                        if (Request.QueryString["type"] == "deleteLv1")
                        {
                            string mess = string.Empty;
                            int id = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
                            if (DeleteLoaiTinLv1(id, ref mess))
                            {%>
                                <!-- NOTIFICATIONS (Thong bao)-->
                                <div class="notification note-success">
                                    <a href="#" class="close" title="Close notification">close</a>
                                    <p>
                                        <strong>
                                            <%=mess%></strong></p>
                                </div>
                                <%}
                            else
                            {%>
                                <!-- NOTIFICATIONS (Thong bao)-->
                                <div class="notification note-error">
                                    <a href="#" class="close" title="Close notification">close</a>
                                    <p>
                                        <strong>
                                            <%=mess%></strong></p>
                                </div>
                                <%}
                                    %>
                                 <uc1:UCAdminLoaiTinList ID="UCAdminLoaiTinList3" runat="server" />
                    <%}
                        if (Request.QueryString["type"] == "deleteChild")
                        {
                            string messLoaiTin = string.Empty;
                            int id = Libs.LibConvert.ConvertToInt(Request.QueryString["id"], 0);
                            if (DeleteLoaiTin(id, ref messLoaiTin))
                            {%>
                                <!-- NOTIFICATIONS (Thong bao)-->
                                <div class="notification note-success">
                                    <a href="#" class="close" title="Close notification">close</a>
                                    <p>
                                        <strong>
                                            <%=messLoaiTin%></strong></p>
                                </div>
                                <%}
                            else
                            {%>
                                <!-- NOTIFICATIONS (Thong bao)-->
                                <div class="notification note-error">
                                    <a href="#" class="close" title="Close notification">close</a>
                                    <p>
                                        <strong>
                                            <%=messLoaiTin%></strong></p>
                                </div>
                                <%}
                                    %>
                                 <uc6:UCAdminLoaiTinListChild ID="UCAdminLoaiTinListChild2" runat="server" />
                    <%}


                    }%>
                <!-- end of box-wrap -->
            </div>
        </div>
        <!-- end of box-wrap -->
    </div>
</asp:Content>
