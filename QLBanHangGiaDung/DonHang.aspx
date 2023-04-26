<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="QLBanHangGiaDung.DonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Danh sách hóa đơn</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
     <div class="row">
         <center><h2>Danh sách hóa đơn đã lập</h2></center>
             <table class="table table-bordered">
                        <thead>
                            <td>STT</td>
                            <td>Mã hóa đơn</td>
                            <td>Ngày tạo</td>
                            <td>Số lượng</td>
                            <td>Tổng tiền</td>
                            <td>Tác vụ</td>
                        </thead>
                            <tbody>
                         <asp:Repeater runat="server" ID="rpDanhSachHD">                    
                             <ItemTemplate>
                                 <tr>
                                    <td><%# Container.ItemIndex + 1 %> </td>
                                    <td><%# Eval("PK_iBillID") %></td>
                                    <td><%# Eval("dDateCreated") %></td>            
                                     <td><%# Eval("Soluong") %></td>
                                     <td><%# Eval("iProductPayment") %></td>
                                    <td>
                                        <a href="HoaDon.aspx?idBill=<%# Eval("PK_iBillID") %>&total=<%# Eval("iProductPayment") %>">Xem Chi Tiết</a>
                                    </td>
                                </tr>
                             </ItemTemplate>
                         </asp:Repeater> 
                      </tbody>
            </table>
         </div>
     </div>
</asp:Content>
