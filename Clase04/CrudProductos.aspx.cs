using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clase04
{
    public partial class CrudProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSourceProductos.InsertParameters["descripcion"].DefaultValue = TextBox1.Text;
            SqlDataSourceProductos.InsertParameters["precio"].DefaultValue = TextBox2.Text;
            SqlDataSourceProductos.InsertParameters["idCategoria"].DefaultValue = DropDownList1.SelectedValue;

            int result = SqlDataSourceProductos.Insert();
            if(result > 0)
            {
                Label1.Text = "Se ha insertado el registro.";
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                GridView1.DataBind();
            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GridView1.SelectedRow.Cells[1].Text;
            string descripcion = GridView1.SelectedRow.Cells[2].Text;
            string precio = GridView1.SelectedRow.Cells[3].Text;
            string idCategoria = GridView1.SelectedRow.Cells[4].Text;
            TextBox1.Text = descripcion;
            TextBox2.Text = precio;
            DropDownList1.SelectedValue = idCategoria;
            Label2.Text = id;
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlDataSourceProductos.DeleteParameters["id"].DefaultValue = Label2.Text;

            int result = SqlDataSourceProductos.Delete();
            if (result > 0)
            {
                Label1.Text = "Se ha eliminado el registro.";
                GridView1.DataBind();
                Label2.Text = string.Empty;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string descripcion = TextBox1.Text;
            string precio = TextBox2.Text;
            string idCategoria = DropDownList1.SelectedValue;
            SqlDataSourceProductos.UpdateParameters["descripcion"].DefaultValue = descripcion;
            SqlDataSourceProductos.UpdateParameters["precio"].DefaultValue = precio;
            SqlDataSourceProductos.UpdateParameters["idCategoria"].DefaultValue = idCategoria;
            SqlDataSourceProductos.UpdateParameters["id"].DefaultValue = Label2.Text;

            int result = SqlDataSourceProductos.Update();
            if (result > 0)
            {
                Label1.Text = "Se ha modificado el registro.";
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                GridView1.DataBind();
                Label2.Text = string.Empty;
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowIndex == GridView1.SelectedIndex)
                {
                    e.Row.Attributes["style"] = "background-color:black !important; color:white !important;";
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataSourceProductos.FilterExpression = "idCategoria = '" + DropDownList2.SelectedValue+"'";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlDataSourceProductos.FilterExpression = string.Empty;
            SqlDataSourceProductos.FilterParameters.Clear();
        }
    }
}