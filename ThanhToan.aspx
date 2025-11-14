<%@ Page Title="Thanh Toán" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="DoAn.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .header {
            background-color: #f8f8f8;
            border-bottom: 1px solid #ddd;
            padding: 25px 0;
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            max-width: 1000px;
            margin: 0 auto;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #009688;
            white-space: nowrap;
        }

            .logo a {
                display: flex;
                align-items: center;
                text-decoration: none;
                color: #009688;
            }

            .logo img {
                height: 40px;
                margin-right: 10px;
            }

        .checkout-container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

            .checkout-container h1 {
                font-size: 28px;
                color: #333;
                margin-bottom: 20px;
            }

            .checkout-container h3 {
                font-size: 20px;
                color: #333;
                margin-bottom: 15px;
            }

        .checkout-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

            .checkout-table th, .checkout-table td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: center;
            }

            .checkout-table th {
                background-color: #f8f8f8;
                font-weight: bold;
                color: dodgerblue;
            }

            .checkout-table td {
                color: #555;
            }

        .checkout-form {
            margin-bottom: 30px;
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

        .btnCheckout {
            background-color: #009688;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

            .btnCheckout:hover {
                background-color: #00796b;
            }

        .total-price {
            font-size: 20px;
            color: #009688;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .checkout-form {
            padding: 20px;
            background-color: #f8f8f8;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        /* QR panel giữ style nhẹ nhàng */
        .qr-panel {
            text-align: center;
            margin-top: 20px;
            padding: 15px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
    </style>

    <h1>Thông tin thanh toán</h1>

    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="checkout-table">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" SortExpression="ProductName" />
            <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" DataFormatString="{0:#,##0}đ" />
            <asp:BoundField DataField="Quantity" HeaderText="Số lượng" SortExpression="Quantity" />
            <asp:BoundField DataField="TotalPrice" HeaderText="Tổng" SortExpression="TotalPrice" DataFormatString="{0:#,##0}đ" />
        </Columns>
    </asp:GridView>

    <div class="checkout-form">
        <h3>Thông tin giao hàng</h3>
        <asp:TextBox ID="txtName" runat="server" Placeholder="Họ tên" CssClass="input-field" />
        <asp:TextBox ID="txtAddress" runat="server" Placeholder="Địa chỉ giao hàng" CssClass="input-field" />
        <asp:TextBox ID="txtPhone" runat="server" Placeholder="Số điện thoại" CssClass="input-field" />

        <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="input-field">
            <asp:ListItem Text="Chọn phương thức thanh toán" Value="" />
            <asp:ListItem Text="Tiền mặt khi nhận hàng" Value="COD" />
            <asp:ListItem Text="Chuyển Khoản QR" Value="QR" />
        </asp:DropDownList>
        <br />

        <asp:Label ID="lblTotal" runat="server" Text="Tổng giá trị giỏ hàng: 0đ" CssClass="total-price" />
        <br />
        <asp:Label ID="lblMessage" runat="server" CssClass="total-price" ForeColor="Red" EnableViewState="false" />
        <br />
        <asp:Button ID="btnConfirmOrder" runat="server" Text="Xác nhận thanh toán" OnClick="btnConfirmOrder_Click" CssClass="btnCheckout" />

        <!-- Panel QR: chỉ hiện khi chọn phương thức QR -->
        <asp:Panel ID="pnlQR" runat="server" CssClass="qr-panel" Visible="false">
            <h3>Quét mã QR để thanh toán</h3>
            <asp:Image ID="imgQR" runat="server" Width="250" Height="250" />
            <p>Ngân hàng: Vietcombank</p>
            <p>Số tài khoản: 1054904961</p>
            <p>Chủ tài khoản: Trần Thanh Thiên</p>
            <p>Nội dung: Đơn hàng #<asp:Label ID="lblOrderId" runat="server"></asp:Label></p>
        <!-- Nút khách xác nhận đã chuyển khoản -->
    <asp:Button ID="btnConfirmTransfer" runat="server" Text="Tôi đã chuyển khoản" CssClass="btnCheckout"
        OnClick="btnConfirmTransfer_Click" />
</asp:Panel>
    </div>
</asp:Content>
