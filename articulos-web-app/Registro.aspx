﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="articulos_web_app.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .validator{
        color:red;
        font-size:12px
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-4">
            <h1>Creá tu usuario</h1>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" cssclass="form-control" ID="txtEmail" />
                <asp:RegularExpressionValidator ErrorMessage="Formato de email inválido" CssClass="validator" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <asp:TextBox runat="server" cssclass="form-control" ID="txtPassword" TextMode="Password" />
                <asp:RangeValidator ErrorMessage="Contraseña fuera de rango. 8 caracteres máximo." CssClass="validator" type="string" MinimumValue="1" MaximumValue="8"  ControlToValidate="txtPassword" runat="server" />
            </div>
            <asp:Button Text="Registrarse" CssClass="btn btn-primary" id="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
            <a href="/">Cancelar</a>
        </div>
    </div>

</asp:Content>
