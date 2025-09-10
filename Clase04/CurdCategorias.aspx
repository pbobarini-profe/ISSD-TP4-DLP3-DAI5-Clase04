<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurdCategorias.aspx.cs" Inherits="Clase04.CurdCategorias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Filtrar" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Desfiltrar" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idCategoria" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ButtonType="Button" DeleteText="Borrar" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="idCategoria" HeaderText="idCategoria" InsertVisible="False" ReadOnly="True" SortExpression="idCategoria" />
                    <asp:BoundField DataField="nombreCategoria" HeaderText="nombreCategoria" SortExpression="nombreCategoria" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Categorias] WHERE [idCategoria] = @idCategoria" InsertCommand="INSERT INTO [Categorias] ([nombreCategoria]) VALUES (@nombreCategoria)" SelectCommand="SELECT * FROM [Categorias]" UpdateCommand="UPDATE [Categorias] SET [nombreCategoria] = @nombreCategoria WHERE [idCategoria] = @idCategoria">
                <DeleteParameters>
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombreCategoria" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombreCategoria" Type="String" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
