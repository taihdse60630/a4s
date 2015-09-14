using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(a4s.Startup))]
namespace a4s
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
