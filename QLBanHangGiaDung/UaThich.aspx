<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UaThich.aspx.cs" Inherits="QLBanHangGiaDung.UaThich" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Ưa thích</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row">
    <div class="col-md-3">
        <br />
        <h4><b>Tìm kiếm</b></h4>
        <div class="input-group">
            <input type="text" id="keysearch" runat="server" class="form-control" placeholder="Tìm kiếm...">
			    <span class="input-group-btn">
				    <button type="submit" name="search" id="search" runat="server" value="search" class="btn btn-default"><i class="fa fa-search" aria-hidden="true"></i></button>
                </span>
		</div>
       
		<h4 style="margin-top: 0px;"><b>LỌC THEO GIÁ</b></h4>
		<input type="number" step="0.1" id="txtgiatu" runat="server" placeholder="Từ..." class="form-control"> 
	    <input type="number" step="0.1" id="txtgiaden" runat="server" placeholder="Đến.." class="form-control">
		<button type="submit" name="filter" id="filter" runat="server" value="filter" class="btn btn-default"><i class="fa fa-filter" aria-hidden="true"></i></button>
		<hr>
        <%--<h4 style="margin-top: 0px;"><b>SẮP XẾP THEO GIÁ</b></h4>
        <a href="DanhSachSanPham.aspx?sort=ASC"><h4><i class="fa fa-arrow-up" aria-hidden="true"></i>
            Tăng dần</h4></a>
        <a href="DanhSachSanPham.aspx?sort=DESC"><h4><i class="fa fa-arrow-down" aria-hidden="true"></i>
            Giảm dần</h4></a>--%>
    </div>
    <div class="col-md-9">
        <br />
        <asp:Repeater ID="rpProduct" runat="server">
            <ItemTemplate>
            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 product">
                            <a href="ChiTietMatHang.aspx?masp=<%# Eval("PK_iProductID") %>">
                             <div class="anhproduct">
                               <img src="images/<%# Eval("sImage") %>" width="100%" alt="">
                             </div>
                            <div class="infoproduct">
                                <center><p><%# Eval("fPromotion") %>%</p></center>
                            </div>
                                <div class="infonew">
                                    <center><p>sale</p></center>
                                </div>
                            <div class="addclass">
                                    <center>
                                        <div class="iconadd">
                                            <button type="submit" class="btn" value="<%# Eval("PK_iProductID") %>" name="btnAddWish">
                                                <i class="fa fa-heart - o" aria-hidden="true" style="color:deeppink"></i>
                                            </button>
                                            <button type="submit" class="btn" value="<%# Eval("PK_iProductID") %>" name="btnAddCart">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            </button>
                                        </div>
                                    </center>
                                    <center>
                                        <h4><%# Eval("sName") %></h4>
                                        <h5 class="colorprice">
                                            <b><%# Eval("iAmount") %></b> 
                                            &nbsp<del><i><%# Eval("iPrice") %></i></del></h5>
                                    </center>
                                </div>
                            </a>
                         </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
  </div>
 </div>
</asp:Content>
