<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ArticulosLista.aspx.cs" Inherits="articulos_web_app.ArticulosLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <h1>Lista de Artículos</h1>

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChanged" />
            </div>
        </div>
    </div>

    <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contentTemplate>
            <asp:GridView ID="dgvArticulos" runat="server" DataKeyNames="Id" 
                CssClass="table" AutoGenerateColumns="false" 
                OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" 
                OnPageIndexChanging="dgvArticulos_PageIndexChanging" 
                AllowPaging="true" PageSize="10" >
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="Codigo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Categoría" DataField="Categoria.Descripcion" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:CommandField HeaderText="Editar" ShowSelectButton="true" SelectText="👉" />
                </Columns>
            </asp:GridView>
        </contentTemplate>
    </asp:UpdatePanel>
    <a href="FormularioArticulos.aspx" class="btn btn-success">Agregar</a>
</asp:Content>
