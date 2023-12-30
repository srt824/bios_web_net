<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="articulos_web_app.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Mis Favoritos</h1>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <asp:Repeater runat="server" ID="repRepetidorFav">
            <ItemTemplate>
                <div class="col">
                    <div class="card images">
                        <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="img articulo">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Precio") %></p>
                            <a href="DetalleArticulo.aspx?id=<%#Eval("Id")%>" class="badge text-bg-success">Ver Detalle</a>
                            <asp:button Text="❌" CssClass="btn btn-primary" runat="server" id="btnEliminarFavorito" CommandArgument='<%#Eval("Id") %>' CommandName="ArticuloId" OnClick="btnEliminarFavorito_Click" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <br />
    <a href="Default.aspx" class="btn btn-primary">Volver</a>
</asp:Content>
