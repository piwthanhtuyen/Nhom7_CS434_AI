<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DoAn.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .cart-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .cart-container h1 {
            font-size: 28px;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .table th, .table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #f1f1f1;
            color: #555;
            font-weight: bold;
        }

        .table td {
            color: #666;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        .btnRemove {
            background-color: #f44336;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .btnRemove:hover {
            background-color: #e53935;
        }

        .cart-summary {
            text-align: right;
            margin-top: 30px;
            font-size: 18px;
        }

        .cart-summary h3 {
            color: #333;
        }

        .cart-summary .total-price {
            font-size: 24px;
            font-weight: bold;
            color: #e53935;
            margin-top: 10px;
        }

        .cart-summary .btnUpdate, .cart-summary .btnCheckout {
            background-color: dodgerblue;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            margin-right: 10px;
        }

        .cart-summary .btnUpdate:hover, .cart-summary .btnCheckout:hover {
            background-color: #45a049;
        }

        .alert {
            padding: 10px;
            background-color: #f44336;
            color: white;
            margin-top: 15px;
            border-radius: 4px;
            text-align: center;
            font-size: 16px;
        }

        .order-history-link {
            margin-top: 30px;
            text-align: left;
        }

        .order-history-link a {
            background-color: #2196F3;
            color: white;
            padding: 10px 16px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
        }

        .order-history-link a:hover {
            background-color: #1976D2;
        }
    </style>

    <div class="cart-container">
        <h1>Giỏ hàng của bạn</h1>
        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" CssClass="table" OnRowCommand="gvCart_RowCommand" DataKeyNames="CartItemId">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" SortExpression="ProductName" />
                <asp:BoundField DataField="Price" HeaderText="Giá" SortExpression="Price" DataFormatString="{0:#,##0}đ" />
                <asp:TemplateField HeaderText="Số lượng">
                    <ItemTemplate>
                        <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>' CssClass="quantity-input" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TotalPrice" HeaderText="Tổng" SortExpression="TotalPrice" DataFormatString="{0:#,##0}đ" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnRemove" runat="server" Text="Xóa" CommandName="Remove" CommandArgument='<%# Eval("CartItemId") %>' CssClass="btnRemove" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="cart-summary">
            <h3>Tổng giá trị giỏ hàng:</h3>
            <asp:Label ID="lblTotal" runat="server" Text="0đ" CssClass="total-price" />
            <br />
            <asp:Button ID="btnUpdateCart" runat="server" Text="Cập nhật giỏ hàng" OnClick="btnUpdateCart_Click" CssClass="btnUpdate" />
            <asp:Button ID="btnCheckout" runat="server" Text="Thanh toán" OnClick="btnCheckout_Click" CssClass="btnCheckout" />
        </div>

        <div class="order-history-link">
            <asp:HyperLink ID="hlOrderHistory" runat="server" NavigateUrl="OrderConfirmation.aspx" Text="🛒 Đơn đã đặt" />
        </div>
    </div>
</asp:Content>
