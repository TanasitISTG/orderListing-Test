package com.example.demotest.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.util.List;


@Entity
@Getter
@Setter
@Table(name = "orders")
public class Order {
    @Id
    private Integer orderNumber;
    private Date orderDate;
    private Date shippedDate;
    private String status;
    private Integer customerNumber;
    private String comments;

    @OneToMany(mappedBy = "orderNumber")
    private List<OrderDetail> orderDetailList;
}