<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="articulos_web_app.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        h1{
            text-align:center;
            color:burlywood;
            padding:30px;
        }

         .images{
             width:250px;
             padding: 10px;
             display:inline-block;
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Bienvenidos a BIOS-TEC</h1>
    <br />
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtFiltro_TextChanged" />
            </div>
        </div>
    </div>

    <div class="col-6">
        <div class="mb-3">
            <asp:CheckBox Text="Filtro Avanzado" runat="server" CssClass="" ID="chkAvanzado" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" />
        </div>
    </div>

     <% if (FiltroAvanzado)
       { %>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Campo" runat="server" />
                        <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Categoría" />
                            <asp:ListItem Text="Marca" />
                            <asp:ListItem Text="Código" />
                            <asp:ListItem Text="Precio" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server"  />
                        <asp:DropDownList runat="server" ID="ddlCriterio" cssclass="form-control"></asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" />
                        <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                    </div>
                </div>
            </div>
    <% } %>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
            </div>
        </div>
    </div>

    <%--<div class="row row-cols-1 row-cols-md-3 g-4">

        <%
            foreach (dominio.Articulo art in ListaArticulo)
            {
        %>
            <div class="col">
                <div class="card">
                    <img src="<%: art.ImagenUrl %>" class="card-img-top" alt="img articulo">
                    <div class="card-body">
                        <h5 class="card-title"><%: art.Nombre %></h5>
                        <p class="card-text"><%: art.Descripcion %></p>
                        <a href="DetalleArticulo.aspx?id=<%: art.Id %>.aspx">Ver Detalle</a>
                    </div>
                </div>
            </div>
          <% } %>

    </div>--%>

    <asp:Repeater id="repRepetidor" runat="server">
        <ItemTemplate>
            <div class="col images">
                <div class="card">
                    <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="img articulo">
                    <div class="card-body">
                        <h5 class="card-title"><%#Eval("Nombre") %></h5>
                        <p class="card-text"><%#Eval("Precio") %></p>
                        <a href="Detalle.aspx?id=<%#Eval("Id")%>" class="btn btn-outline-primary">Ver Detalle</a>
                        <%if (negocio.Seguridad.sesionActiva(Session["usuario"]))
                          {%>
                        <asp:Button Text="⭐" runat="server" ID="btnFavoritos" CssClass="btn btn-outline-warning" CommandArgument='<%#Eval("Id") %>' OnClick="btnFavoritos_Click" />
                        <%}%>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
