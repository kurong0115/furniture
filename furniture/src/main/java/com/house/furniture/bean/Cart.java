package com.house.furniture.bean;

public class Cart {
    private Integer id;

    private Integer uid;

    private Integer pid;

    private Integer count;

    private Integer sum;

    private Product product;
    
    
    @Override
	public String toString() {
		return "Cart [id=" + id + ", uid=" + uid + ", pid=" + pid + ", count=" + count + ", sum=" + sum + ", product="
				+ product + "]";
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}