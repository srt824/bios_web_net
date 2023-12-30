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
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
            if (id != "" && !IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                Articulo seleccionado = (negocio.listar(id)[0]);

                txtUrlImagen.Text = seleccionado.ImagenUrl;
                txtUrlImagen_TextChanged(sender,e);
                txtNombre.Text = seleccionado.Nombre;
                txtNombre.ReadOnly = true;
                txtDescripcion.Text = seleccionado.Descripcion;
                txtDescripcion.ReadOnly = true;
                txtPrecio.Text = seleccionado.Precio.ToString("$0.000");
                txtPrecio.ReadOnly = true;
            }
        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulos.ImageUrl = txtUrlImagen.Text;
        }
    }
}