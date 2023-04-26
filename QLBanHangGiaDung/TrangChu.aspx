<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="QLBanHangGiaDung.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Trang chủ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <div class="row">
            <!-- Wrapper for slides -->
            <div class="col-md-6">
                <img src="images/trangchu1.png" alt="Chania" width="100%" height="100%">
            </div>
            <div class="col-md-6">
                <div class="text-center">
                    <h1 style="font-size: 70px;">Kinh doanh đồ gia dụng</h1>
                    <p>Hàng ngàn Ưu đãi từ Gói Chào Mừng hiện chỉ có trên ứng dụng Gia Dụng DT. sản phẩm giảm giá 66% và những phần quà hấp dẫn</p>
                </div>
            </div>
        </div>
        <div id="main-content">
            <div class="container">
                <center><h2>Hàng đang được bán chạy nhất</h2></center>
                <center><p>Sản phẩm HOT nhất năm 2023</p></center>
                <div class="row">
                    <asp:Repeater ID="rpSpMoi" runat="server">
                        <ItemTemplate>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 product">
                                <div class="anhproduct">
                                    <img src="images/<%# Eval("sImage") %>" width="100%" alt="">
                                </div>
                                <div class="infoproduct">
                                    <center><p><%# Eval("fPromotion") %>%</p></center>
                                </div>
                                <div class="infonew">
                                    <center><p>Sale</p></center>
                                </div>
                                <div class="addclass">
                                    <center>
                                        <div class="iconadd">
                                            <button type="button" onclick="addCart('<%# Eval("PK_iProductID") %>')" class="btn" value="<%# Eval("PK_iProductID") %>" name="btnAddCart">
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            </button> 
                                        </div>
                                    </center>
                                    <center>
                                        <a href="ChiTietMatHang.aspx?masp=<%# Eval("PK_iProductID") %>">

                                        <h4><%# Eval("sName") %></h4>
                                                                        </a>
                                        <h5 class="colorprice">

                                            <b><%# Eval("iPrice") %></b> 
                                            </h5>

                                    </center>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="container">
                <div class="row" style="margin-top: 40px; margin-bottom: 40px">
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="anhproduct">
                            <img src="images/Banner-2l.jpg" width="100%" alt="">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <div class="anhproduct">
                            <img src="images/Banner_2r.jpg" width="100%" alt="">
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="row">
                    <center><h2>Sản Phẩm Nổi Bật</h2></center>
                    <center><p>Có lượt yêu thích nhiều nhất tháng</p></center>
                </div>
                <div class="row">
                    <asp:Repeater ID="rpSpNoiBat" runat="server">
                        <ItemTemplate>
                            <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 product">

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
                                            <button type="button" onclick="addCart('<%# Eval("PK_iProductID") %>')" class="btn" value="<%# Eval("PK_iProductID") %>" name="btnAddCart" >
                                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                            </button> 
                                        </div>
                                    </center>
                                    <center>
                                        <a href="ChiTietMatHang.aspx?masp=<%# Eval("PK_iProductID") %>">
                                        <h4><%# Eval("sName") %></h4>
                                            </a>
                                        <h5 class="colorprice">

                                            <b><%# Eval("iPrice") %></b> 
                                            </h5>

                                    </center>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
       
</asp:Content>
