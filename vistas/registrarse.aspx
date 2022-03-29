<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="allbim.vistas.registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label Text="REGISTRARSE" runat="server" /><br />
            <br />

            <asp:Label Text="Correo" runat="server" ID="lbIdCorreo" ToolTip="Ingrese el correo" /><br />
            <asp:TextBox runat="server" ID="txtIdCorreo" TextMode="Email" /><br />
            <br />

            <asp:Label Text="Nombres" runat="server" ID="lbIdNombres" ToolTip="Ingrese nombre" /><br />
            <asp:TextBox runat="server" ID="txtIdNombres" /><br />

            <asp:Label Text="Apellidos" runat="server" ID="lbIDApellidos" ToolTip="Ingrese apellido" /><br />
            <asp:TextBox runat="server" ID="txtIDApellidos" /><br />
            <br />

            <asp:Label Text="Contraseña" runat="server" ID="lbIdContrasena" ToolTip="Ingrese contraseña" /><br />
            <asp:TextBox runat="server" ID="txtIdContrasena" TextMode="Password" /><br />
            <br />

            <asp:Label Text="Repetir contraseña" runat="server" ID="lbIdRepetirContrasena" ToolTip="Repita la contraseña" /><br />
            <asp:TextBox runat="server" ID="txtIdRepetirContrasena" TextMode="Password" /><br />
            <br />

            <asp:CheckBox Text="Recibir correos de actualizaciones" runat="server" ID="chkCorreo" /><br />
            <asp:CheckBox Text="Acepto terminos y condicciones" runat="server" ID="chkTerminoCondiciones" /><br />
            <br />

            <asp:Button Text="REGISTRARSE" runat="server" OnClick="Registrarse_Click" />
        </div>
    </form>
</body>
</html>
