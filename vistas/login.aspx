<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="allbim.vistas.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label Text="USER LOGIN" runat="server" /><br />
            <br />


            <asp:Label Text="Usuario: " runat="server" ID="lbIdUsuario" /><br />

            <asp:TextBox runat="server" ID="txtIdUsuario" ToolTip="Ingrese el correo" TextMode="Email" /><br />
            <br />


            <asp:Label Text="Contraseña: " runat="server" ID="lbIdContrasena" /><br />

            <asp:TextBox runat="server" ID="txtIdContrasena" ToolTip="Ingrese la contraseña" TextMode="Password" /><br />
            <br />


            <asp:CheckBox Text="Recordarme" runat="server" ID="chkIdRecordar" /><br />
            <br />


            <asp:Button Text="INICIAR" runat="server" OnClick="Iniciar_Sesion_Click" />

        </div>
    </form>
</body>
</html>
