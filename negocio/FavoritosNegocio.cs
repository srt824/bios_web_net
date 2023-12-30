
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;
using conexiones;

namespace negocio
{
    public  class FavoritosNegocio
    {
        public List<int> listarFavUserId(int idUser)
        {
            AccesoDatos datos = new AccesoDatos();
            List<int> lista = new List<int>();

            try
            {
                datos.setearConsulta("Select IdArticulo from FAVORITOS where IdUser = @idUser");
                datos.setearParametro("@idUser", idUser);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int aux = (int)datos.Lector["idArticulo"];
                    Favoritos favorito = new Favoritos();
                    favorito.IdArticulo = aux;
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void insertarNuevoFavorito(Favoritos nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                
                datos.setearConsulta("SELECT COUNT(*) FROM FAVORITOS WHERE IdUser = @idUser AND IdArticulo = @idArticulo");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("@idArticulo", nuevo.IdArticulo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidad = Convert.ToInt32(datos.Lector[0]);
                    if (cantidad > 0)
                    {
                        datos.cerrarConexion();
                        return;
                    }
                }

                datos.cerrarConexion();
                datos = new AccesoDatos();
                datos.setearConsulta("INSERT INTO FAVORITOS (IdUser, IdArticulo)VALUES(@idUser, @idArticulo)");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("@idArticulo", nuevo.IdArticulo);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        /*public List<Favoritos> listarFavoritos(int idUser)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT * FROM FAVORITOS WHERE IdUser = @idUser");
                datos.setearParametro("idUser", idUser);
                datos.ejecutarLectura();

                List<Favoritos> listaFavoritos = new List<Favoritos>();

                while (datos.Lector.Read())
                {
                    Favoritos favorito = new Favoritos();
                    favorito.Id = (int)datos.Lector["id"];
                    favorito.IdUser = (int)datos.Lector["idUser"];
                    favorito.IdArticulo = (int)datos.Lector["idArticulo"];

                    listaFavoritos.Add(favorito);
                }
                return listaFavoritos;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }*/

        public void agregarFavorito(Favoritos nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM FAVORITOS WHERE IdUser = @idUser AND IdArticulo = @idArticulo");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("@idArticulo", nuevo.IdArticulo);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    int cantidad = Convert.ToInt32(datos.Lector[0]);
                    if (cantidad > 0)
                    {
                        datos.cerrarConexion();
                        return;
                    }
                }

                datos = new AccesoDatos();
                datos.setearConsulta("INSERT INTO FAVORITOS (IdUser, IdArticulo)VALUES(@idUser, @idArticulo)");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("@idArticulo", nuevo.IdArticulo);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void eliminarFavorito(int idUser, int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("delete from FAVORITOS where IdArticulo = @idArticulo and IdUser = @idUser");
                datos.setearParametro("IdArticulo", id);
                datos.setearParametro("idUser", idUser);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void eliminarFv(int id)
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from FAVORITOS where IdArticulo = @idArticulo");
                datos.setearParametro("@idArticulo", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
