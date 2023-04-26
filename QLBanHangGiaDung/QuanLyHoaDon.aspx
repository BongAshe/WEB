<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyHoaDon.aspx.cs" Inherits="QLBanHangGiaDung.QuanLyHoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Quản lý hóa đơn</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
     <div class="row">
         <center><h2>Danh sách hóa đơn trong hệ thống</h2></center>
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
                         <asp:Repeater runat="server" ID="rpDanhSachSP">                    
                             <ItemTemplate>
                                  <tr>
                                <td><%# Container.ItemIndex + 1 %></td>
                                <td><%# Eval("FK_iBillID") %></td>
                                <td><%# Eval("sName") %></td>
                                <td><%# Eval("iAmount") %></td>
                                <td><%# Eval("iPrice") %></td>
                                <td><%# Eval("fPromotion") %> %</td>
                                <td><%# String.Format("{0}",Convert.ToInt32(Eval("iPrice")) *Convert.ToInt32(Eval("iAmount"))* (100-Convert.ToInt32(Eval("fPromotion")))/100) %> vnd</td>
                            <td>
                                        <a href="HoaDon.aspx?idBill=<%# Eval("FK_iBillID") %>">Xem Chi Tiết</a>
                                    </td>
                             </ItemTemplate>
                         </asp:Repeater> 
                      </tbody>
            </table>
         </div>
     </div>
</asp:Content>
