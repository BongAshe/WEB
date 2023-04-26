<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QLBanHangGiaDung.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Đăng nhập</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg">
    <div id="formLogin">
    <div class="wrapper">
  <div id="formContent">
    <!-- Login Form -->
        <h2>Đăng nhập</h2>
        <input type="text" id="login" class="form-control" name="login" placeholder="Tên đăng nhập" runat="server">
        <input type="password" id="password" class="form-control" name="login" placeholder="Mật khẩu" runat="server">

      <%--<asp:RequiredFieldValidator ID="rqPass" runat="server" ErrorMessage="Vui lòng nhập mật khẩu"  ControlToValidate="password" ></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="password"
ErrorMessage="Mật khẩu phải lớn hơn 5 kí tự và có 1 chữ Hoa"
ValidationExpression="^(?=.*[A-Z]).{6,}$"></asp:RegularExpressionValidator>--%>
     

        <input type="submit" class="btn btn-success btn-block" value="Đăng nhập" runat="server" onserverclick="submitLogin">
    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a id="noAccount" class="underlineHover" href="Signup.aspx">Bạn chưa có tài khoản?</a>
    </div>

  </div>
</div>
        </div>
    </div>
    
</asp:Content>
