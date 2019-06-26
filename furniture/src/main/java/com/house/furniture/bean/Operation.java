package com.house.furniture.bean;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(value = { "handler" })
public class Operation {
	

	@Override
	public String toString() {
		return "Operation [id=" + id + ", orderid=" + orderid + ", uid=" + uid + ", pid=" + pid + ", count=" + count
				+ ", sum=" + sum + ", price=" + price + ", productList=" + productList + "]";
	}

	private Integer id;

    private Integer orderid;

    private Integer uid;

    private Integer pid;

    private Integer count;

    private Integer sum;

    private Double price;
    
    private List<Product> productList;
    
    

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}