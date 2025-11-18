<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oder.aspx.cs" Inherits="WebApplication1.Oder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đơn hàng</title>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 8px 15px;
            background: #e0e0e0;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            color: black;
            font-size: 14px;
        }

        .container {
            width: 85%;
            margin: 0 auto;
            text-align: center;
        }

        .title {
            font-size: 28px;
            color: #2c6cd9;
            font-weight: bold;
            margin-top: 40px;
        }

        .subtitle {
            margin-bottom: 30px;
        }

        .order-title {
            font-weight: bold;
            margin: 20px 0 10px 0;
            display: block;
            text-align: left;
        }

        .box {
            margin-bottom: 40px;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid black;
        }

        .grid-view th {
            border: 1px solid black;
            padding: 10px;
            background: #f8f8f8;
            font-weight: bold;
        }

        .grid-view td {
            border: 1px solid black;
            padding: 12px;
            text-align: center;
        }

        .total {
            font-weight: bold;
            margin-top: 10px;
            text-align: right;
            display: block;
        }

        .line-divider {
            width: 100%;
            height: 2px;
            background: black;
            margin: 25px 0;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <!-- Nút quay lại -->
        <a href="javascript:history.back()" class="back-btn">← Quay lại</a>

        <div class="container">

            <asp:Label ID="lblHeader" runat="server"
                CssClass="title"
                Text="Đơn hàng của bạn đã được ghi nhận!" />

            <br />

            <asp:Label ID="lblSub" runat="server"
                CssClass="subtitle"
                Text="Cảm ơn bạn đã mua hàng tại BookStoreTV" />

            <br /><br />

            <!-- Đơn hàng 1 -->
            <div class="box">
                <asp:Label ID="lblOrder1" runat="server" CssClass="order-title" Text="Đơn Hàng #1" />

                <asp:GridView ID="GridView1" runat="server"
                    CssClass="grid-view"
                    AutoGenerateColumns="False"
                    ShowHeader="True">

                    <Columns>
                        <asp:BoundField HeaderText="Sản Phẩm" DataField="SanPham" />
                        <asp:BoundField HeaderText="Số Lượng" DataField="SoLuong" />
                        <asp:BoundField HeaderText="Đơn Giá" DataField="DonGia" />
                        <asp:BoundField HeaderText="Thành Tiền" DataField="ThanhTien" />
                    </Columns>

                </asp:GridView>

                <asp:Label ID="lblTotal1" runat="server" CssClass="total" />
            </div>

            <div class="line-divider"></div>

            <!-- Đơn hàng 2 -->
            <div class="box">
                <asp:Label ID="lblOrder2" runat="server" CssClass="order-title" Text="Đơn Hàng #2" />

                <asp:GridView ID="GridView2" runat="server"
                    CssClass="grid-view"
                    AutoGenerateColumns="False"
                    ShowHeader="True">

                    <Columns>
                        <asp:BoundField HeaderText="Sản Phẩm" DataField="SanPham" />
                        <asp:BoundField HeaderText="Số Lượng" DataField="SoLuong" />
                        <asp:BoundField HeaderText="Đơn Giá" DataField="DonGia" />
                        <asp:BoundField HeaderText="Thành Tiền" DataField="ThanhTien" />
                    </Columns>

                </asp:GridView>

                <asp:Label ID="lblTotal2" runat="server" CssClass="total" />
            </div>

        </div>
    </form>
</body>
</html>
