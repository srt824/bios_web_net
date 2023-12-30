<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EnvioEmail.aspx.cs" Inherits="articulos_web_app.EnvioEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-2">
            <div class="col">
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox runat="server" id="txtEmail" CssClass="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Asunto</label>
                    <asp:TextBox runat="server" id="txtAsunto" CssClass="form-control"/>
                </div>
                <div class="mb-3">
                    <label class="form-label">Mensaje</label>
                    <asp:TextBox runat="server" TextMode="MultiLine" id="txtMensaje" CssClass="form-control"/>
                </div>
                <asp:Button Text="Enviar" CssClass="btn btn-primary" ID="btnEnviar" OnClick="btnEnviar_Click" runat="server" />
            </div>
            <div class="col"></div>
        </div>
    </div>

</asp:Content>
