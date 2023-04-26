using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBanHangGiaDung
{
    public partial class HoaDon : System.Web.UI.Page
    {
        public static string total;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadInfoKH();

                total = Request.QueryString["total"];
                if (Request.QueryString["idBill"] !=null)
                {
                    LoadBill();
                    buttonsubmit.InnerText = "Trở lại";
                }
                else
                {
                    LoadCarts();
                    buttonsubmit.InnerText = "Đặt hàng";
                }
            }
        }
        protected void LoadInfoKH()
        {
            SqlConnection cnn = model.SqlConnectionData.Connect();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getInfo";
            cmd.Parameters.AddWithValue("@matk", Int32.Parse(Session["userid"].ToString()));
            cmd.Connection = cnn;
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    hotenkh.Text = rd.GetString(6);
                    diachi.Text = rd.GetString(7);
                    sodienthoai.Text  = rd.GetString(8);
                }
                rd.Close();
            }
        }
        protected void LoadCarts()
        {
            SqlConnection cnn = model.SqlConnectionData.Connect();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getCheckedProductInCart";
            cmd.Connection = cnn;
            cmd.Parameters.AddWithValue("@idcustomer", Session["userid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpDonHang.DataSource = dt;
            rpDonHang.DataBind();
        }
        protected void LoadBill()
        {
            SqlConnection cnn = model.SqlConnectionData.Connect();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "selectDetailBillsProduct";
            cmd.Connection = cnn;
            cmd.Parameters.AddWithValue("@idbill", Request.QueryString["idBill"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpDonHang.DataSource = dt;
            rpDonHang.DataBind();
        }

        protected void buttonSubmit(object sender, EventArgs e)
        {
            if (Request.QueryString["idBill"] == null)
            {
                SqlConnection cnn = model.SqlConnectionData.Connect();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "createBill";
                cmd.Connection = cnn;
                cmd.Parameters.AddWithValue("@iProductPayment", total);
                cmd.Parameters.AddWithValue("@idcustomer", Session["userid"]);
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("DonHang.aspx");

        }
    }
}