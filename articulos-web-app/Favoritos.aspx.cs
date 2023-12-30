using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;



namespace articulos_web_app
{
    public partial class Favoritos : System.Web.UI.Page
    {
        private int IdUser;
        private int IdArticulo;
        public List<Articulo> ListaArticulo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Usuario user = (Usuario)Session["usuario"];
                string id = Request.QueryString["id"];
                if(!string.IsNullOrEmpty(id) && int.TryParse(id, out int idArticulo))
                {
                    FavoritosNegocio negocio = new FavoritosNegocio();
                    Favoritos nuevo = new Favoritos();

                    nuevo.IdUser = user.Id;
                    nuevo.IdArticulo = int.Parse(id);

                    //negocio.insertarNuevoFavorito(nuevo); 
                }

                ListaArticulo = new List<Articulo>();

                if(user != null)
                {
                    FavoritosNegocio negocioart = new FavoritosNegocio();
                    List<int> idArticulosFavoritos = negocioart.listarFavUserId(user.Id);
                    if(idArticulosFavoritos.Count > 0)
                    {
                        ArticuloNegocio art = new ArticuloNegocio();
                        ListaArticulo = art.listarArticuloId(idArticulosFavoritos);
                        repRepetidorFav.DataSource = ListaArticulo;
                        repRepetidorFav.DataBind();
                    }

                }
                else
                {
                    
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnEliminarFavorito_Click(object sender, EventArgs e)
        {
            Usuario user = (Usuario)Session["user"];
            FavoritosNegocio negocio = new FavoritosNegocio();

            int idArticulo = int.Parse(((Button)sender).CommandArgument);
            int idUser = user.Id;

            negocio.eliminarFavorito(idUser, idArticulo);
            Session.Add("Articulo eliminado", "Se eliminó el articulo de los favoritos.");
            Response.Redirect("~/Favoritos.aspx", false);

            Page_Load(sender, e);
        }
    }
}
    

      



