﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebPortal.Model;

namespace WebPortal.AdminUsercontrols
{
    public partial class UCAdminGroupsDetail : System.Web.UI.UserControl
    {
        public WebPortal.Repository.Group groupDA = new Repository.Group();
        public bool UpdateGroups(ref string notice)
        {
            WebPortal.Model.Group g = new WebPortal.Model.Group();
            try
            {
                g.GroupID = Libs.LibConvert.ConvertToInt(Request.Form["groupID"],0);
                if (g.GroupID == 0)
                {
                    notice = "Không tồn tại group có id này!";
                    return false;
                }
                else
                {
                    g.Group_Name = Request.Form["groupName"];
                    g.Group_Description = Request.Form["groupDescription"];
                    g.Group_ToString = Request.Form["groupToString"];
                    g.Group_DateCreate =Libs.LibConvert.ConvertToDateTime(DateTime.Now);
                    g.User_Create = Libs.LibConvert.ConvertToInt(Request.Form["userCreate"],0);
                    if (Request.Form["active"] != null)
                    {
                        g.Active = true;
                    }
                    else
                        g.Active = false;
                    if (groupDA.Update(g) != -1)
                        return true;
                    else
                    {
                        notice = "Có lỗi xảy ra! Không thể cập nhật thông tin cho group này được!";
                        return false;
                    }
                }
            }
            catch
            {
                notice = "Có lỗi xảy ra! Không thể cập nhật thông tin cho group này được!";
                return false;
            }
           
               
        }
        public bool DeleteGroups(ref string notice)
        {
            int groupID = Libs.LibConvert.ConvertToInt(Request.Form["groupID"],0);
            if (groupID != 0)
            {
                if (groupDA.Delete(groupID) != 1)
                {
                    notice = "Có lỗi xảy ra trong quá trình xóa nhóm này!";
                    return false;
                }
                else
                    return true;
            }
            else
            {
                notice = "Có lỗi xảy ra trong quá trình xóa nhóm này!";
                return false;
            }
        }
        public bool AddGroups(ref string notice)
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
                newG.Group_DateCreate = Libs.LibConvert.ConvertToDateTime(DateTime.Now);
                string userName = Libs.LibSession.Get(Libs.Constants.ACCOUNT_LOGIN).ToString();
                WebPortal.Repository.User userDA = new WebPortal.Repository.User();
                newG.User_Create = userDA.GetUserIDByUsername(userName);
                if (groupDA.Add(newG) != 1)
                {
                    notice = "Có lỗi xảy ra trong quá trình thêm nhóm này!";
                    return false;
                }
                else
                    return true;
            }
            catch
            {
                notice = "Có lỗi xảy ra trong quá trình thêm nhóm này!";
                return false;
            }
        }
    }
    
}