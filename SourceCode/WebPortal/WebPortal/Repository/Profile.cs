using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebPortal.Model;

namespace WebPortal.Repository
{
    public partial class Profile
    {
        public Model.Profile Single(int profileID)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Profiles.Single(pro => pro.ProfileID == profileID);
            }
        }

        public List<Model.Profile> All()
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Profiles.ToList();
            }
        }

        public int Add(Model.Profile profile)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.AddToProfiles(profile);
                return dataEntities.SaveChanges();
            }
        }

        public int Update(Model.Profile profile)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                var newProfile = dataEntities.Profiles.Single(pro => pro.ProfileID == profile.ProfileID);
                newProfile.UserID = profile.UserID;
                newProfile.FirstName = profile.FirstName;
                newProfile.LastName = profile.LastName;
                newProfile.Department = profile.Department;
                newProfile.Position = profile.Position;
                newProfile.Image = profile.Image;
                newProfile.Address = profile.Address;
                newProfile.Phone = profile.Phone;
                newProfile.Birdthday = profile.Birdthday;
                newProfile.LastUpdateProfile = profile.LastUpdateProfile;
                newProfile.Country = profile.Country;
                newProfile.Genre = profile.Genre;
                newProfile.Ethnic = profile.Ethnic;
                newProfile.Religion = profile.Religion;
                newProfile.Active = profile.Active;
                newProfile.CodeStaff = profile.CodeStaff;
                return dataEntities.SaveChanges();
            }
        }

        public int Delete(Model.Profile profile)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                dataEntities.DeleteObject(profile);
                return dataEntities.SaveChanges();
            }
        }

        public List<Model.Profile> Paging(int start, int numberRecords)
        {
            using (WebPortalEntities dataEntities = new WebPortalEntities())
            {
                return dataEntities.Profiles.Skip(start).Take(numberRecords).ToList();
            }
        }
        
        //Ham viet them tai day
    }
}