<%@ Page Title="Chi tiết sản phẩm" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TrangSanPham.aspx.cs" Inherits="DoAn.TrangSanPham" %>

<%@ Register TagPrefix="uc" TagName="DanhMuc" Src="~/DanhMuc.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .product-details {
            display: flex;
            flex-wrap: wrap;
            max-width: 1000px;
            margin: 50px auto;
            gap: 40px;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .product-image {
            flex: 0 0 400px;
            height: auto;
        }

        .product-info {
            flex: 1;
        }

            .product-info h2 {
                color: #009688;
            }

            .product-info p {
                font-size: 16px;
                margin-top: 10px;
            }

            .product-info .price {
                font-size: 20px;
                font-weight: bold;
                margin-top: 20px;
                color: #e91e63;
            }

            .product-info .description {
                font-size: 14px;
                color: #757575;
            }

        .category-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

            .category-list li {
                margin: 10px 0;
            }

            .category-list a {
                text-decoration: none;
                color: #333;
                font-weight: 500;
            }

                .category-list a:hover {
                    color: #009688;
                }

        .btnAddToCart {
            background-color: #FF5722; 
            color: white; 
            font-size: 16px; 
            padding: 12px 30px; 
            border: none; 
            border-radius: 25px;
            cursor: pointer; 
            transition: background-color 0.3s, transform 0.3s; 
        }

            .btnAddToCart:hover {
                background-color: #FF3D00; 
                transform: scale(1.05); 
            }

            .btnAddToCart:active {
                background-color: #E64A19; 
                transform: scale(0.98); 
            }
    </style>

    <div class="layout">
        <uc:DanhMuc ID="DanhMuc1" runat="server" />

        <div class="product-details">
            <div class="product-image">
                <asp:Image ID="imgProduct" runat="server" Width="100%" />
            </div>

            <div class="product-info">
                <h2>
                    <asp:Label ID="lblName" runat="server" Text="Tên sản phẩm" />
                </h2>
                <p class="description">
                    <strong>Mô tả:</strong>
                    <asp:Label ID="lblDescription" runat="server" Text="Mô tả sản phẩm" />
                </p>
                <p class="price">
                    <strong>Giá:</strong>
                    <asp:Label ID="lblPrice" runat="server" Text="Giá sản phẩm" />
                </p>
                <p>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Thêm vào giỏ hàng" OnClick="btnAddToCart_Click" CssClass="btnAddToCart" />
                </p>

            </div>
        </div>
    </div>
</asp:Content>
