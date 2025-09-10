using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clase04
{
    public partial class CurdCategorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["nombreCategoria"].DefaultValue = TextBox1.Text;
            int result = SqlDataSource1.Insert();
            if (result > 0)
            {
                Label1.Text = "Se ha insertado el registro.";
                GridView1.DataBind();
            }
        }
    }
}