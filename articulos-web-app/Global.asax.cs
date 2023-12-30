using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace articulos_web_app
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        void Aplication_Error(Object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();

            Session.Add("error", exc.ToString());
            //Response.Redirect("Error.aspx");
            Server.Transfer("Error.aspx");
        }
    }
}