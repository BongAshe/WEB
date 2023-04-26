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
    public partial class UaThich : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            LoadAllProduct(0, 0);
            if (Request.QueryString["maloai"] != null)
            {
                int ma = Int32.Parse(Request.QueryString["maloai"]);
                if (Request.Form["filter"] != null)
                {
                    float giatu = float.Parse(txtgiatu.Value);
                    float giaden = float.Parse(txtgiaden.Value);
                    if (giatu > 0 && giaden > 0)
                    {
                        LoadProductByType(ma, giatu, giaden);
                    }
                }
                else if (Request.Form["search"] != null)
                {
                    String keySearch = keysearch.Value;
                    LoadProductSearch(keySearch);
                }
                else
                {
                    LoadProductByType(ma, 0, 0);
                }
            }
            else
            {
                if (Request.Form["filter"] != null)
                {
                    try
                    {
                        float giatu = float.Parse(txtgiatu.Value);
                        float giaden = float.Parse(txtgiaden.Value);
                        if (giatu > 0 && giaden > 0)
                        {
                            LoadAllProduct(giatu, giaden);
                        }
                    }
                    catch (Exception ex)
                    {

                    }
                }
                if (Request.Form["search"] != null)
                {
                    String keySearch = keysearch.Value;
                    if (keySearch.Trim() != "")
                    {
                        LoadProductSearch(keySearch);
                    }
                    else
                    {
                        LoadAllProduct(0, 0);
                    }
                }
            }
        }
        //}
        protected void LoadProductByType(int ma, float giatu, float giaden)
        {
            SqlConnection cnn = model.SqlConnectionData.Connect();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getProductByIDType";
            cmd.Parameters.AddWithValue("@ma", ma);
            cmd.Parameters.AddWithValue("@giatu", giatu);
            cmd.Parameters.AddWithValue("@giaden", giaden);
            cmd.Connection = cnn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpProduct.DataSource = dt;
            rpProduct.DataBind();
        }
        protected void LoadProductSearch(String keySearch)
        {
            SqlConnection cnn = model.SqlConnectionData.Connect();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getProductSearch";
            cmd.Parameters.AddWithValue("@keySearch", keySearch);
            cmd.Connection = cnn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpProduct.DataSource = dt;
            rpProduct.DataBind();
        }
        protected void LoadAllProduct(float giatu, float giaden)
        {
            SqlConnection cnn = model.SqlConnectionData.Connect();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "getAllProduct";
            cmd.Parameters.AddWithValue("@giatu", giatu);
            cmd.Parameters.AddWithValue("@giaden", giaden);
            cmd.Connection = cnn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpProduct.DataSource = dt;
            rpProduct.DataBind();
        }
    }
}