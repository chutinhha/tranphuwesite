<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminGroupsDetail.ascx.cs"
    Inherits="WebPortal.AdminUsercontrols.UCAdminGroupsDetail" %>
<form method="post" action="../AdminGroupsManager.aspx">
<p>
    <%if (Request.QueryString["type"].ToString() == "edit")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Sửa thông tin
        nhóm</span>
    <%}
      else if (Request.QueryString["type"].ToString() == "delete")
      { %>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Bạn có muốn xóa
        thông tin của nhóm này không?</span>
    <%}
      else
      {%>
    <span style="font-family: Arial; font-weight: bold; font-size: 18px;">Nhập thông tin
        để tạo nhóm mới</span>
    <%} %>
</p>
<table class="style1">
    <%WebPortal.Repository.Group groupDA = new WebPortal.Repository.Group(); %>
    <thead>
        <tr>
            <th>
                Thông số
            </th>
            <th class="full">
                Giá trị
            </th>
        </tr>
    </thead>
    <%  WebPortal.Model.Group group = groupDA.Single(int.Parse(Request.QueryString["id"]));
        if (group != null)
        {
            if (Request.QueryString["type"].ToString() == "edit")
            {
    %>
    <tbody>
        <tr>
            <th>
                GroupID
            </th>
            <td>
                <input style="width: 50%;" readonly="readonly" name="groupID" type="text" value="<%=group.GroupID%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupName
            </th>
            <td>
                <input style="width: 50%;" name="groupName" type="text" value="<%=group.Group_Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupDescription
            </th>
            <td>
                <input style="width: 50%;" name="groupDescription" type="text" value="<%=group.Group_Description%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupToString
            </th>
            <td>
                <input style="width: 50%;" name="groupToString" type="text" value="<%=group.Group_ToString%>" />
            </td>
        </tr>
        <tr>
            <th>
                Group DateCreate
            </th>
            <td>
                <input style="width: 50%;" disabled="disabled" name="groupDateCreate" type="text"
                    value="<%=group.Group_DateCreate%>" />
            </td>
        </tr>
        <tr>
            <th>
                User Create
            </th>
            <td>
                <input style="width: 50%;" readonly="readonly" name="userCreate" type="text" value="<%=group.User_Create%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (group.Active == true)
                  { %>
                <input name="active" type="checkbox" checked="checked" value="True" />
                <%}
                  else
                  {%>
                <input name="active" type="checkbox" value="False" />
                <%} %>
            </td>
        </tr>
    </tbody>
    <%}
            else if (Request.QueryString["type"].ToString() == "delete")
            {
    %>
    <tbody>
        <tr>
            <th>
                GroupID
            </th>
            <td>
                <input readonly="readonly" name="groupID" type="text" value="<%=group.GroupID%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupName
            </th>
            <td>
                <input style="width: 50%;" disabled="disabled" name="groupName" type="text" value="<%=group.Group_Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupDescription
            </th>
            <td>
                <input style="width: 50%;" disabled="disabled" name="groupDescription" type="text"
                    value="<%=group.Group_Description%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupToString
            </th>
            <td>
                <input style="width: 50%;" disabled="disabled" name="groupToString" type="text" value="<%=group.Group_ToString%>" />
            </td>
        </tr>
        <tr>
            <th>
                Group DateCreate
            </th>
            <td>
                <input style="width: 50%;" disabled="disabled" name="groupDateCreate" type="text"
                    value="<%=group.Group_DateCreate%>" />
            </td>
        </tr>
        <tr>
            <th>
                User Create
            </th>
            <td>
                <input style="width: 50%;" disabled="disabled" name="userCreate" type="text" value="<%=group.User_Create%>" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <%if (group.Active == true)
                  { %>
                <input disabled="disabled" name="active" type="checkbox" checked="checked" />
                <%}
                  else
                  {%>
                <input disabled="disabled" name="active" type="checkbox" />
                <%} %>
            </td>
        </tr>
    </tbody>
    <%}
        }
        else if (Request.QueryString["type"].ToString() == "new")
        {
    %>
    <tbody>
        <tr>
            <th>
                GroupName
            </th>
            <td>
                <input style="width: 50%;" name="groupName" type="text" />
            </td>
        </tr>
        <tr>
            <th>
                GroupDescription
            </th>
            <td>
                <input style="width: 50%;" name="groupDescription" type="text" />
            </td>
        </tr>
        <tr>
            <th>
                GroupToString
            </th>
            <td>
                <input style="width: 50%;" name="groupToString" type="text" />
            </td>
        </tr>
        <tr>
            <th>
                Active
            </th>
            <td>
                <input name="active" type="checkbox" checked="checked" value="True" />
            </td>
        </tr>
    </tbody>
    <%}%>
</table>
<div class="tab-footer clear">
    <div class="fr">
        <% if (Request.QueryString["type"].ToString() == "edit")
           {%>
        <input type="submit" value="Lưu thay đổi" id="save" name="save" class="button" />
        <%} %>
        <% else if (Request.QueryString["type"].ToString() == "new")
            {%>
        <input type="submit" value="Tạo mới" id="create" name="new" class="button" />
        <%}
            else
            { %>
        <input type="submit" value="Xóa" id="delete" name="delete" class="button" />
        <%} %>
        <input type="submit" value="Quay về trang chính" id="back" name="back" class="button" />
    </div>
</div>
<% if (Request.Form["save"] != null)
   {
       string notice = "";
       if (UpdateGroups(ref notice))
           Response.Redirect("AdminGroupsManager.aspx");
       else
       { %>
        <div class="notification note-error">
         <a href="#" class="close" title="Close notification">close</a>
         <p>
        <strong>
            <%=notice%></strong></p>
        </div>
       <%}
%>
<%}
   else if (Request.Form["back"] != null)
   {
       Response.Redirect("AdminGroupsManager.aspx");
   }
   else if (Request.Form["delete"] != null)
   {
       string notice = "";
       if (!DeleteGroups(ref notice))
       { %>
       <div class="notification note-error">
         <a href="#" class="close" title="Close notification">close</a>
         <p>
        <strong>
            <%=notice%></strong></p>
        </div>
       <%
       }
       else
           Response.Redirect("AdminGroupsManager.aspx");
   } if (Request.Form["new"] != null)
   {
       string notice = "";
       if (!AddGroups(ref notice))
       { %>
       <div class="notification note-error">
         <a href="#" class="close" title="Close notification">close</a>
         <p>
        <strong>
            <%=notice%></strong></p>
        </div>
       <%
       }
       else
           Response.Redirect("AdminGroupsManager.aspx");
               
   }
%>
</form>
