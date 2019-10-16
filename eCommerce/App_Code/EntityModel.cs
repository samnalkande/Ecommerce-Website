﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Cart
{
    public int CartID { get; set; }
    public int CustomerID { get; set; }
    public int ProductID { get; set; }
    public int Quantity { get; set; }

    public virtual Customer Customer { get; set; }
    public virtual Product Product { get; set; }
}

public partial class Category
{
    public Category()
    {
        this.Products = new HashSet<Product>();
    }

    public int CategoryID { get; set; }
    public string CategoryName { get; set; }
    public string CategoryDescription { get; set; }

    public virtual ICollection<Product> Products { get; set; }
}

public partial class Customer
{
    public Customer()
    {
        this.Carts = new HashSet<Cart>();
        this.ProductOrderStatus = new HashSet<ProductOrderStatu>();
        this.Orders = new HashSet<Order>();
        this.Reviews = new HashSet<Review>();
    }

    public int CustomerID { get; set; }
    public string CustomerName { get; set; }
    public string sex { get; set; }
    public string UserName { get; set; }
    public string Password { get; set; }
    public string Address { get; set; }
    public string email { get; set; }
    public string ContactNumber { get; set; }
    public string UserType { get; set; }

    public virtual ICollection<Cart> Carts { get; set; }
    public virtual ICollection<ProductOrderStatu> ProductOrderStatus { get; set; }
    public virtual ICollection<Order> Orders { get; set; }
    public virtual ICollection<Review> Reviews { get; set; }
}

public partial class Feature
{
    public int FeatureID { get; set; }
    public int MetaFeatureID { get; set; }
    public int ProductID { get; set; }
    public string FeatureDescription { get; set; }

    public virtual MetaFeature MetaFeature { get; set; }
    public virtual Product Product { get; set; }
}

public partial class MetaFeature
{
    public MetaFeature()
    {
        this.Features = new HashSet<Feature>();
    }

    public int MetaFeatureID { get; set; }
    public string FeatureName { get; set; }

    public virtual ICollection<Feature> Features { get; set; }
}

public partial class Order
{
    public int OrderID { get; set; }
    public int CustomerID { get; set; }
    public int ProductID { get; set; }
    public System.DateTime DateOrdered { get; set; }

    public virtual Customer Customer { get; set; }
    public virtual Product Product { get; set; }
}

public partial class Product
{
    public Product()
    {
        this.Carts = new HashSet<Cart>();
        this.Features = new HashSet<Feature>();
        this.Orders = new HashSet<Order>();
        this.ProductOrderStatus = new HashSet<ProductOrderStatu>();
        this.Reviews = new HashSet<Review>();
    }

    public int ProductID { get; set; }
    public string ProductName { get; set; }
    public string ProductDescription { get; set; }
    public string ProductImageURL { get; set; }
    public decimal ProductPrice { get; set; }
    public Nullable<int> Discount { get; set; }
    public Nullable<int> CategoryID { get; set; }

    public virtual ICollection<Cart> Carts { get; set; }
    public virtual Category Category { get; set; }
    public virtual ICollection<Feature> Features { get; set; }
    public virtual ICollection<Order> Orders { get; set; }
    public virtual ICollection<ProductOrderStatu> ProductOrderStatus { get; set; }
    public virtual ICollection<Review> Reviews { get; set; }
}

public partial class ProductOrderStatu
{
    public int ProductOrderStatusId { get; set; }
    public int CustomerId { get; set; }
    public int ProductId { get; set; }
    public int StatusId { get; set; }
    public Nullable<System.DateTime> CreatedDate { get; set; }
    public Nullable<int> Quantity { get; set; }

    public virtual Customer Customer { get; set; }
    public virtual Product Product { get; set; }
    public virtual Status Status { get; set; }
}

public partial class Review
{
    public int ReviewID { get; set; }
    public int CustomerID { get; set; }
    public int ProductID { get; set; }
    public Nullable<int> Rating { get; set; }
    public string ReviewTitle { get; set; }
    public string ReviewDescription { get; set; }
    public System.DateTime ReviewDate { get; set; }

    public virtual Customer Customer { get; set; }
    public virtual Product Product { get; set; }
}

public partial class Status
{
    public Status()
    {
        this.ProductOrderStatus = new HashSet<ProductOrderStatu>();
    }

    public int StatusId { get; set; }
    public string Status1 { get; set; }

    public virtual ICollection<ProductOrderStatu> ProductOrderStatus { get; set; }
}
