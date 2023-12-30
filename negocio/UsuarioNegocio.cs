using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using conexiones;
using dominio;

namespace negocio
{
    public class UsuarioNegocio
    {

        public int insertarNuevo(Usuario nuevo)
        {
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearProcedimiento("insertarNuevo");
				datos.setearParametro("@email", nuevo.Email);
				datos.setearParametro("@pass", nuevo.Pass);

				return datos.ejecutarAccionScalar();
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
        public void actualizar(Usuario user)
        {
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearConsulta("UPDATE USERS set urlImagenPerfil = @imagen, Nombre = @nombre, Apellido = @apellido Where Id = @id");
				datos.setearParametro("@imagen", user.ImagenPerfil != null ? user.ImagenPerfil : (object)DBNull.Value);
				//datos.setearParametro("@imagen", (object)user.ImagenPerfil ?? DBNull.Value); //null coalescing.
				datos.setearParametro("@nombre", user.Nombre);
				datos.setearParametro("@apellido", user.Apellido);
				datos.setearParametro("@id", user.Id);
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

		public bool Login(Usuario user)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearConsulta("select id, email, pass, admin, urlImagenPerfil, nombre, apellido from USERS Where email = @email AND pass = @pass");
				datos.setearParametro("@email", user.Email);
				datos.setearParametro("@pass", user.Pass);
				datos.ejecutarLectura();

				if(datos.Lector.Read())
				{
					user.Id = (int)datos.Lector["id"];
					user.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["nombre"] is DBNull))
                        user.Nombre = (string)datos.Lector["nombre"];
                    if (!(datos.Lector["apellido"] is DBNull))
                        user.Apellido = (string)datos.Lector["apellido"];
					if (!(datos.Lector["urlImagenPerfil"] is DBNull))
						user.ImagenPerfil = (string)datos.Lector["urlImagenPerfil"];

                    return true;
				}
				return false;
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
