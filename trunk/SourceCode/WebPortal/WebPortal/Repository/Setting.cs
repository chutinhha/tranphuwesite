using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class Setting
    {
        public Model.Setting Single(int settingID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Settings.Single(setting => setting.SettingID == settingID);
            }
        }

        public List<Model.Setting> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Settings.ToList();
            }
        }

        public int Add(Model.Setting setting)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToSettings(setting);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.Setting setting)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newSetting = dataEntities.Settings.Single(s => s.SettingID == setting.SettingID);
                newSetting.Setting_Name = setting.Setting_Name;
                newSetting.Setting_Description = setting.Setting_Description;
                newSetting.Setting_DateCreate = setting.Setting_DateCreate;
                newSetting.Value = setting.Value;
                newSetting.Active = setting.Active;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.Setting setting)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(setting);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.Setting> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Settings.Skip(start).Take(numberRecords).ToList();
            }
        }

        //Ham viet them tai day
    }
}