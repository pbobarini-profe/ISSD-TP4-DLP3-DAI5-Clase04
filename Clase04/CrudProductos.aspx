<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrudProductos.aspx.cs" Inherits="Clase04.CrudProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombreCategoria" DataValueField="idCategoria">
            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Modificar" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Eliminar" OnClientClick="return Confirmar();" />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombreCategoria" DataValueField="idCategoria">
            </asp:DropDownList>
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Filtrar" />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Desfiltrar" />
            <asp:GridView ID="GridView1"
                EmptyDataText="No hay registros"
                CssClass="table" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSourceProductos" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/seleccionar.png" ControlStyle-Width="20" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                    <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                    <asp:BoundField DataField="idCategoria" HeaderText="idCategoria" SortExpression="idCategoria" />
                    <asp:BoundField DataField="nombreCategoria" HeaderText="nombreCategoria" SortExpression="nombreCategoria" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" ProviderName="<%$ ConnectionStrings:cadena.ProviderName %>" SelectCommand="SELECT * FROM [Categorias]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Productos] WHERE [id] = @id" InsertCommand="INSERT INTO [Productos] ([descripcion], [precio], [idCategoria]) VALUES (@descripcion, @precio, @idCategoria)" SelectCommand="SELECT Productos.id, Productos.descripcion, Productos.precio, Productos.idCategoria, Categorias.nombreCategoria FROM Productos INNER JOIN Categorias ON Productos.idCategoria = Categorias.idCategoria" UpdateCommand="UPDATE [Productos] SET [descripcion] = @descripcion, [precio] = @precio, [idCategoria] = @idCategoria WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="precio" Type="Int32" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="descripcion" Type="String" />
                    <asp:Parameter Name="precio" Type="Int32" />
                    <asp:Parameter Name="idCategoria" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
    <script>
        function Confirmar() {
            return confirm("¿Desea eliminar el registro?");
        }
    </script>
</body>
</html>
