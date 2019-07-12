package com.house.furniture.bean;

import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.house.furniture.bean.Category;
import com.house.furniture.bean.Image;

@JsonIgnoreProperties(value = { "handler" })
public class Product {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.pid
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private Integer pid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.productName
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private String productname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.model
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private String model;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.price
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private Double price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.description
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private String description;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.score
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private Integer score;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.cid
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private Integer cid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.stock
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private Integer stock;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.createTime
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private Timestamp createtime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.content
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private String content;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column product.is_ground
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    private Byte isGround;
    
    private Category category;
    
    private List<Image> images;
    
    private String imgPath;
    
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.pid
     *
     * @return the value of product.pid
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.pid
     *
     * @param pid the value for product.pid
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.productName
     *
     * @return the value of product.productName
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public String getProductname() {
        return productname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.productName
     *
     * @param productname the value for product.productName
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setProductname(String productname) {
        this.productname = productname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.model
     *
     * @return the value of product.model
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public String getModel() {
        return model;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.model
     *
     * @param model the value for product.model
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setModel(String model) {
        this.model = model;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.price
     *
     * @return the value of product.price
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public Double getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.price
     *
     * @param price the value for product.price
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.description
     *
     * @return the value of product.description
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public String getDescription() {
        return description;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.description
     *
     * @param description the value for product.description
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setDescription(String description) {
    	this.description = description == null ? null : description.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.score
     *
     * @return the value of product.score
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public Integer getScore() {
        return score;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.score
     *
     * @param score the value for product.score
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setScore(Integer score) {
        this.score = score;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.cid
     *
     * @return the value of product.cid
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public Integer getCid() {
        return cid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.cid
     *
     * @param cid the value for product.cid
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.stock
     *
     * @return the value of product.stock
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public Integer getStock() {
        return stock;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.stock
     *
     * @param stock the value for product.stock
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setStock(Integer stock) {
        this.stock = stock;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.createTime
     *
     * @return the value of product.createTime
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public Timestamp getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.createTime
     *
     * @param createtime the value for product.createTime
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.content
     *
     * @return the value of product.content
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.content
     *
     * @param content the value for product.content
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setContent(String content) {
    	this.content = content == null ? null : content.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column product.is_ground
     *
     * @return the value of product.is_ground
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public Byte getIsGround() {
        return isGround;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column product.is_ground
     *
     * @param isGround the value for product.is_ground
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    public void setIsGround(Byte isGround) {
        this.isGround = isGround;
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

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", productname=" + productname + ", model=" + model + ", price=" + price
				+ ", description=" + description + ", score=" + score + ", cid=" + cid + ", stock=" + stock
				+ ", createtime=" + createtime + ", content=" + content + ", isGround=" + isGround + ", category="
				+ category + ", imgPath=" + imgPath + "]";
	}
    
    
}