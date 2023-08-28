using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrudInModel
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void modal_Click(object sender, EventArgs e)
        {
            string script = "$('#mymodal').modal('show');";
            ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["connection_"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlCommand cmd;
                if (!string.IsNullOrEmpty(hdid.Value))
                {
                    string id = hdid.Value;
                    cmd = new SqlCommand("Update test set name_=@name, email=@email,contact=@contact," +
                        "address_=@address,status_=@status where t_id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                }
                else
                {
                    cmd = new SqlCommand("insert into test(name_,email,contact,address_,status_)" +
                        " values(@name,@email,@contact,@address,@status)", conn);
                }

                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@email", txtmail.Text);
                cmd.Parameters.AddWithValue("@contact", txtcontact.Text);
                cmd.Parameters.AddWithValue("@address", txtaddress.Text);
                cmd.Parameters.AddWithValue("@status", dllstatus.SelectedItem.ToString());

                int rowsaffected = cmd.ExecuteNonQuery();
                conn.Close();
                if (rowsaffected > 0)
                {
                    lblmsg.Text = "Data Insert Successfully";
                }
                else
                {
                    lblmsg.Text = "Error While inserting Data";

                }
                string script = "$('#mymodal').modal('show');";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
                rptr1.DataBind();
            }
        }

        protected void btndlt_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            string connectionstring = ConfigurationManager.ConnectionStrings["connection_"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from test where t_id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();

            }
            rptr1.DataBind();
        }

        protected void btnupdate_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            hdid.Value = id;

            string connectionstring = ConfigurationManager.ConnectionStrings["connection_"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select *  from test where t_id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dataReader = cmd.ExecuteReader();

                if (dataReader.Read())
                {
                    txtname.Text = dataReader["name_"].ToString();
                    txtmail.Text = dataReader["email"].ToString();
                    txtcontact.Text = dataReader["contact"].ToString();
                    txtaddress.Text = dataReader["address_"].ToString();
                    dllstatus.SelectedValue = dataReader["status_"].ToString();
                }
                dataReader.Close();
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "OpenModalScript", "$('#mymodal').modal('show');", true);
        }
    }
}