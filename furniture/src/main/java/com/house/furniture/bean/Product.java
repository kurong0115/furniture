package com.house.furniture.bean;

import java.sql.Timestamp;
import java.util.List;

public class Product {
    private Integer pid;

    private String productname;

    private String model;

    private Double price;

    private String description;

    private Integer score;

    private Integer cid;

    private Integer stock;

    private Timestamp createtime;

    private String content;
    
    private Category category;
    
    private List<Image> images;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Image> getImages() {
		return images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", productname=" + productname + ", model=" + model + ", price=" + price
				+ ", description=" + description + ", score=" + score + ", cid=" + cid + ", stock=" + stock
				+ ", createtime=" + createtime + ", content=" + content + ", category=" + category + ", images="
				+ images + "]";
	}
    
    
}