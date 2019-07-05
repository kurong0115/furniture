package com.house.furniture.bean;

import java.sql.Timestamp;

public class Orders {
	
	
    @Override
	public String toString() {
		return "Orders [id=" + id + ", orderno=" + orderno + ", uid=" + uid + ", createtime=" + createtime + ", sum="
				+ sum + ", addressid=" + addressid + ", isdeal=" + isdeal + ", ispay=" + ispay + ", paymethod="
				+ paymethod + ", isfinish=" + isfinish + "]";
	}

	private Integer id;

    private String orderno;

    private Integer uid;

    private Timestamp createtime;

    private Integer sum;

    private Integer addressid;

    private Integer isdeal;

    private Integer ispay;

    private String paymethod;

    private Integer isfinish;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderno() {
        return orderno;
    }

    public void setOrderno(String orderno) {
        this.orderno = orderno == null ? null : orderno.trim();
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getIsdeal() {
        return isdeal;
    }

    public void setIsdeal(Integer isdeal) {
        this.isdeal = isdeal;
    }

    public Integer getIspay() {
        return ispay;
    }

    public void setIspay(Integer ispay) {
        this.ispay = ispay;
    }

    public String getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(String paymethod) {
        this.paymethod = paymethod == null ? null : paymethod.trim();
    }

    public Integer getIsfinish() {
        return isfinish;
    }

    public void setIsfinish(Integer isfinish) {
        this.isfinish = isfinish;
    }
}