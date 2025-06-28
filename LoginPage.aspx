<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ProjectSixthSemester.LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Make sure the CSS path is correct relative to root -->
   <!-- <link href="/Content/login.css" rel="stylesheet" /> -->
    <asp:HiddenField ID="hdnPanelState" runat="server" />


    <div class="container">
        <div class="form-box login">
    <h1>Login</h1>
    <div class="input-box">
        <input type="email" ID="txtUsername" placeholder="Email" runat="server" />
        <i class='bx bxs-user'></i>
    </div>
    <div class="input-box">
        <input type="password" ID="txtPassword" placeholder="Password" runat="server" />
        <i class='bx bxs-lock-alt'></i>
    </div>
    <div class="forget-link">
        <a href="#">Forgot Password?</a>
    </div>
    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
    <p>Or login with social platforms</p>
    <div class="social-icons">
        <a href="#"><i class='bx bxl-google'></i></a>
        <a href="#"><i class='bx bxl-facebook-circle'></i></a>
    </div>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Size="Small" />
</div>

<div class="form-box register">
    <h1>Registration</h1>
    <div class="input-box">
        <input type="text" ID="txtRegUsername" placeholder="Username" runat="server" />
        <i class='bx bxs-user'></i>
    </div>
    <div class="input-box">
        <input type="email" ID="txtRegEmail" placeholder="Email" runat="server" />
        <i class='bx bxs-envelope'></i>
    </div>
    <div class="input-box">
        <input type="password" ID="txtRegPassword" placeholder="Password" runat="server" />
        <i class='bx bxs-lock-alt'></i>
    </div>
    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" UseSubmitBehavior="false" 
    CausesValidation="false"/>
    <asp:Label ID="lblRegisterMessage" runat="server" ForeColor="Red" Font-Size="Small" />
    <p>Or register with social platforms</p>
    <div class="social-icons">
        <a href="#"><i class='bx bxl-google'></i></a>
        <a href="#"><i class='bx bxl-facebook-circle'></i></a>
    </div>
</div>
       
        <div class="toggle-box">
            <div class="toggle-panel toggle-left">
                <h1>Hello, Welcome!</h1>
                <p>Don't have an account?</p>
                <button type="button" class="btn register-btn">Register</button>
            </div>
            <div class="toggle-panel toggle-right">
                <h1>Welcome Back!</h1>
                <p>Already have an account?</p>
                <button type="button" class="btn login-btn">Login</button>
            </div>
        </div>
    </div>

    <!-- Link to JS (ensure path is correct) -->
    <script>
         window.onload = function () {
        const container = document.querySelector('.container');
        const register = document.querySelector('.register-btn');
        const login = document.querySelector('.login-btn');

        register.addEventListener("click", () => {
            container.classList.add("active");
            document.getElementById('<%= hdnPanelState.ClientID %>').value = 'register';
        });

        login.addEventListener("click", () => {
            container.classList.remove("active");
            document.getElementById('<%= hdnPanelState.ClientID %>').value = 'login';
        });
    };
    </script>
</asp:Content>
