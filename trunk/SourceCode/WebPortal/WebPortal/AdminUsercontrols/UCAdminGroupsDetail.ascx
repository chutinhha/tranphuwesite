﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAdminGroupsDetail.ascx.cs"
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
                <input readonly="readonly" name="groupID" type="text" value="<%=group.GroupID%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupName
            </th>
            <td>
                <input name="groupName" type="text" value="<%=group.Group_Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupDescription
            </th>
            <td>
                <input name="groupDescription" type="text" value="<%=group.Group_Description%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupToString
            </th>
            <td>
                <input name="groupToString" type="text" value="<%=group.Group_ToString%>" />
            </td>
        </tr>
        <tr>
            <th>
                Group DateCreate
            </th>
            <td>
                <input readonly="readonly" name="groupDateCreate" type="text" value="<%=group.Group_DateCreate%>" />
            </td>
        </tr>
        <tr>
            <th>
                User Create
            </th>
            <td>
                <input readonly="readonly" name="userCreate" type="text" value="<%=group.User_Create%>" />
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
                <input disabled="disabled" name="groupName" type="text" value="<%=group.Group_Name%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupDescription
            </th>
            <td>
                <input disabled="disabled" name="groupDescription" type="text" value="<%=group.Group_Description%>" />
            </td>
        </tr>
        <tr>
            <th>
                GroupToString
            </th>
            <td>
                <input disabled="disabled" name="groupToString" type="text" value="<%=group.Group_ToString%>" />
            </td>
        </tr>
        <tr>
            <th>
                Group DateCreate
            </th>
            <td>
                <input disabled="disabled" name="groupDateCreate" type="text" value="<%=group.Group_DateCreate%>" />
            </td>
        </tr>
        <tr>
            <th>
                User Create
            </th>
            <td>
                <input disabled="disabled" name="userCreate" type="text" value="<%=group.User_Create%>" />
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
                <input name="groupName" type="text" />
            </td>
        </tr>
        <tr>
            <th>
                GroupDescription
            </th>
            <td>
                <input name="groupDescription" type="text" style="width:50%" />
            </td>
        </tr>
        <tr>
            <th>
                GroupToString
            </th>
            <td>
                <input name="groupToString" type="text" style="width:50%" />
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
    </div> </div>
    <% if (Request.Form["save"] != null)
   {
       WebPortal.Model.Group g = new WebPortal.Model.Group();
       int isSuccess = 1;
       try
       {
           g.GroupID = int.Parse(Request.Form["groupID"]);
           g.Group_Name = Request.Form["groupName"];
           g.Group_Description = Request.Form["groupDescription"];
           g.Group_ToString = Request.Form["groupToString"];
           g.Group_DateCreate = DateTime.Parse(Request.Form["groupDateCreate"]);
           g.User_Create = int.Parse(Request.Form["userCreate"]);
           if (Request.Form["active"] != null)
           {
               g.Active = true;
           }
           else
               g.Active = false;
       }
       catch
       {
           isSuccess = 0;
       }
       if (isSuccess > 0)
           groupDA.Update(g);
       Response.Redirect("AdminGroupsManager.aspx");
    %>
    <%}
   else if (Request.Form["back"] != null)
   {
       Response.Redirect("AdminGroupsManager.aspx");
   }
   else if (Request.Form["delete"] != null)
   {
       int groupID = int.Parse(Request.Form["groupID"]);
       groupDA.Delete(groupID);
       Response.Redirect("AdminGroupsManager.aspx");
   } if (Request.Form["new"] != null)
       {
           WebPortal.Model.Group newG = new WebPortal.Model.Group();

           try
           {
               newG.Group_Name = Request.Form["groupName"];
               newG.Group_Description = Request.Form["groupDescription"];
               newG.Group_ToString = Request.Form["groupToString"];
               if (Request.Form["active"] != null)
               {
                   newG.Active = true;
               }
               else
                   newG.Active = false;
               newG.Group_DateCreate = DateTime.Today;
               string userName = Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN).ToString();
               WebPortal.Repository.User userDA = new WebPortal.Repository.User();
               newG.User_Create = userDA.GetUserIDByUsername(userName);
               groupDA.Add(newG);
           }
           catch
           {
               
                Response.Redirect("AdminGroupsManager.aspx");
           }
           Response.Redirect("AdminGroupsManager.aspx");   
       }
        %>
</form>