<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="articulos_web_app.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card mb-3" style="max-width: 1000px;">
        <div class="row g-0">
            <div class="col">
                <asp:TextBox runat="server" ID="txtUrlImagen" Visible="false"
                AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" />
                <asp:Image ImageUrl="http://img2.wikia.nocookie.net/__cb20140518072131/towerofsaviors/images/4/47/Placeholder.png"
                runat="server" ID="imgArticulos" class="img-fluid rounded-start" />
            </div>
            <div class="col">
                <div class="card-body style="display:flex; justify-content:center">
                    <asp:TextBox runat="server" ID="txtNombre" class="btn fs-5" Columns="30" />
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" class="btn fs-6" Columns="41" Rows="4" />
                    <asp:TextBox runat="server" ID="txtPrecio" class="btn fs-3" />
                </div>
            </div>
        </div>
        <div class="d-grid gap-2">
            <a href="/" class="btn btn-outline-primary">Volver</a>
        </div>
    </div>

</asp:Content>
