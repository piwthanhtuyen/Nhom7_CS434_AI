<%@ Page Title="Quản lý đơn hàng" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="DoAn.QuanLyDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .input-field:focus {
            border-color: #009688;
            outline: none;
        }

        .btnAction {
            background-color: #009688;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btnAction:hover {
            background-color: #00796b;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .grid th, .grid td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .grid th {
            background-color: #f8f8f8;
            font-weight: bold;
            color: dodgerblue;
        }

        .grid td {
            color: #555;
        }
    </style>

    <div class="container">
        <h1>Quản lý đơn hàng</h1>

        <!-- Form nhập liệu -->
        <asp:TextBox ID="txtMaDH" runat="server" CssClass="input-field" Placeholder="Mã đơn hàng" />
        <asp:TextBox ID="txtTenKH" runat="server" CssClass="input-field" Placeholder="Tên khách hàng" />
        <asp:TextBox ID="txtNgayDat" runat="server" CssClass="input-field" Placeholder="Ngày đặt" />
        <asp:TextBox ID="txtTongTien" runat="server" CssClass="input-field" Placeholder="Tổng tiền" />
        <asp:Button ID="btnAdd" runat="server" Text="Thêm đơn hàng" CssClass="btnAction" />

        <!-- GridView hiển thị danh sách đơn hàng -->
        <asp:GridView ID="gvDonHang" runat="server" AutoGenerateColumns="False" CssClass="grid">
            <Columns>
                <asp:BoundField DataField="MaDonHang" HeaderText="Mã đơn hàng" />
                <asp:BoundField DataField="TenKhachHang" HeaderText="Tên khách hàng" />
                <asp:BoundField DataField="NgayDat" HeaderText="Ngày đặt" />
                <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" DataFormatString="{0:#,##0}đ" />

                <asp:TemplateField HeaderText="Hành động">
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Sửa" CssClass="btnAction" />
                        <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnAction" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
