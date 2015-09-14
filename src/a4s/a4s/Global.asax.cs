using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using a4s.Models;

namespace a4s
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Tạo role sẵn
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));

            List<string> roleNameList = new List<string> { "Admin"
                                                         , "Designer"
                                                         , "Mod"
                                                         , "Uploader"
                                                         , "Subteam"
                                                         , "Subber"
                                                         , "VIP"
                                                         , "Member" };
            foreach (string roleName in roleNameList)
            {
                if (!roleManager.RoleExists(roleName))
                {
                    var newRole = new IdentityRole();
                    newRole.Name = roleName;
                    roleManager.Create(newRole);
                }
            }
        }
    }
}
