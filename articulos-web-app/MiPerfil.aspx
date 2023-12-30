<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="articulos_web_app.MiPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mi Perfil</h1>

    <div class="row">
        <div class="col-md-4">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
                <asp:RequiredFieldValidator CssClass="validator" ErrorMessage="El nombre es requerido" ControlToValidate="txtNombre" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" MaxLength="30" />
                <!--<asp:RangeValidator ErrorMessage="Sólo letras." CssClass="validator" ControlToValidate="txtApellido" type="String" runat="server" />-->
            </div>
            <div class="mb-3">
                <label class="form-label">Imagen Perfil</label>
                <input type="file" id="txtImagen" runat="server" class="form-control" />
            </div>
            <asp:Button Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
            <a href="/">Regresar</a>
        </div>
        
            <div class="col-md-8">
                <div class="mb-3">
                    <asp:Image ID="imgNuevoPerfil" ImageUrl="https://investigacion.unimagdalena.edu.co/Content/Imagenes/userVacio.png" runat="server" CssClass="img-fluid mb-3" />
                </div>  
            </div>
        
    </div>

</asp:Content>
