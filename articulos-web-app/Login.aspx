<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="articulos_web_app.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>

        function validar() {
            const txtPassword = document.getElementById("txtPassword");
            
            if (txtPassword.value == "") {
                txtPassword.classList.add("is-invalid");
                txtPassword.classList.remove("is-valid");
                
                return false;
            }
            txtPassword.classList.remove("is-invalid");
            txtPassword.classList.add("is-valid");
            return true;
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="col-md-6">
        <h2>Login</h2>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <asp:TextBox runat="server" id="txtEmail" placeholder="Email" CssClass="form-control" />
            <asp:RegularExpressionValidator ErrorMessage="Formato de email inválido" CssClass="validator" ControlToValidate="txtEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" runat="server" />
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <asp:TextBox runat="server" id="txtPassword" placeholder="*****" TextMode="Password" CssClass="form-control" ClientIDMode="Static" />
        </div>
        <div class="mb-3">
            <asp:Button Text="Ingresar" runat="server" ID="btnIngresar" OnClientClick="return validar()" onclick="btnIngresar_Click" CssClass="btn btn-outline-success"/>
            <a href="/">Cancelar</a>
        </div>
    </div>
</asp:Content>
