package com.example.demotest.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Table(name = "customers")
@Getter
@Setter
@NamedQueries({
        @NamedQuery(name = "Customer.FIND_USER",
                query = "SELECT c FROM Customer c WHERE concat(trim(c.contactFirstName), ' ', trim(c.contactLastName)) = :user_account")
})
public class Customer {
    @Id
    private Integer customerNumber;
    private String customerName;
    private String city;
    private String country;
    private String password;
    private String contactFirstName;
    private String contactLastName;

    @OneToMany(mappedBy = "customerNumber")
    private List<Order> orderList;
}

