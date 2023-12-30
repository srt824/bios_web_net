using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace articulos_web_app
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtEmail.Text != "" && txtPassword.Text != "")
                {
                    Usuario usuario = new Usuario();
                    UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                    EmailService emailService = new EmailService();

                    usuario.Email = txtEmail.Text;
                    usuario.Pass = txtPassword.Text;
                    usuario.Id = usuarioNegocio.insertarNuevo(usuario);
                    Session.Add("usuario", usuario);

                    emailService.armarCorreo(usuario.Email, "¡gracias por registrarte!", "Hola, te damos la bienvenida a la aplicación");
                    emailService.enviarEmail();
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    Session.Add("error", "Debes completar ambos los campos.");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}