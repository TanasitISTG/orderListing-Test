<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 12/16/2022
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Listing</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="./css/order-listing.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="./images/icon.ico"/>
</head>
<body class="bg-dark">
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top mb-4">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav me-auto mb-2 mb-md-0"></ul>
            <form class="d-flex" action="logout" method="post">
                <button class="btn btn-outline-danger" type="submit">Logout</button>
            </form>
        </div>
    </div>
</nav>


<div class="container">
    <div class="row">
        <div class="col-12">
            <h3 class="text-center text-white">Order History of ${selectedCustomer.customerName}</h3>
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-dark table-bordered">
                    <caption style="caption-side: top">Information of ${selectedCustomer.customerName}</caption>
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Customer Number</th>
                        <th scope="col">Customer Name</th>
                        <th scope="col">City</th>
                        <th scope="col">Country</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${selectedCustomer.customerNumber}</td>
                        <td>${selectedCustomer.customerName}</td>
                        <td>${selectedCustomer.city}</td>
                        <td>${selectedCustomer.country}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <c:if test="${selectedCustomer != null}">

                    <table class="table table-dark table-bordered">
                        <caption style="caption-side: top">Order's information
                            of ${selectedCustomer.customerName}</caption>
                        <thead class="thead-dark">
                        <tr style="white-space:nowrap;">
                            <th scope="col" >Order Number</th>
                            <th scope="col">Order Date</th>
                            <th scope="col">Shipped Date</th>
                            <th scope="col">Status</th>
                            <th scope="col">Comments</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${selectedCustomer.orderList}" var="order" varStatus="vs">
                            <tr>
                                    <%--                                        <td><a href="order-list?orderNumber=${order.orderNumber}"--%>
                                    <%--                                               class="link-light">${order.orderNumber}</a></td>--%>
                                <td style="white-space:nowrap;">
                                    <form action="order-list" method="post">
                                        <a href="javascript:;"
                                           onclick="parentNode.submit();">${order.orderNumber}</a>
                                        <input type="hidden" name="orderNumber" value="${order.orderNumber}"/>
                                    </form>
                                </td>
                                <td style="white-space:nowrap;">${order.orderDate}</td>
                                <td style="white-space:nowrap;">${order.shippedDate}</td>
                                <td style="white-space:nowrap;">${order.status}</td>
                                <td>
                                    <c:if test="${order.comments == null}">No comments</c:if>
                                    ${order.comments}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </c:if>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <c:if test="${selectedOrder != null}">
                    <table class="table table-dark table-bordered">
                        <caption style="caption-side: top">Information of
                            order ${selectedOrder.orderNumber}</caption>
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">Order Line Number</th>
                            <th scope="col">Product Code</th>
                            <th scope="col">Quantity Ordered</th>
                            <th scope="col">Price Each</th>
                            <th scope="col">Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${selectedOrder.orderDetailList}" var="orderDetail">
                            <tr>
                                <td>${orderDetail.orderLineNumber}</td>
                                <td>${orderDetail.productCode}</td>
                                <td>${orderDetail.quantityOrdered}</td>
                                <td>${orderDetail.priceEach}</td>
                                <td>${orderDetail.quantityOrdered * orderDetail.priceEach}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>