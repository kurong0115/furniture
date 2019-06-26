package com.house.furniture.bean;

public class Operation {
	//保存每个商品被卖出的数量
	private long total;
	
	//产品
	private Product product;
	
	//产品图片
	private String imgPath;
	
	//产品所属分类名
	private String categoryName;
	
    private Integer id;

    private Integer orderid;

    private Integer uid;

    private Integer pid;

    private Integer count;

    private Integer sum;

    private Double price;
    
    public long getTotal() {
		return total;
	}
    
    public void setTotal(long total) {
		this.total = total;
	}
    
    public Product getProduct() {
		return product;
	}
    
    public void setProduct(Product product) {
		this.product = product;
	}
    
    public String getImgPath() {
		return imgPath;
	}
    
    public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
    
    public String getCategoryName() {
		return categoryName;
	}
    
    public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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