package com.house.furniture.bean;

import java.util.Date;

import javax.validation.constraints.NotEmpty;

public class Message {
    private Integer mid;

    private Integer uid;

    private String name;

    private String title;

    private String content;

    private Date createtime;

    @NotEmpty(message="回复信息不得为空")
    private String reply;

    private Date replytime;

    private Integer statue;
    
    private String head;
    public String getHead() {
		return head;
	}
    public void setHead(String head) {
		this.head = head;
	}

    public Integer getMid() {
        return mid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.mid
     *
     * @param mid the value for message.mid
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setMid(Integer mid) {
        this.mid = mid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.uid
     *
     * @return the value of message.uid
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.uid
     *
     * @param uid the value for message.uid
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.name
     *
     * @return the value of message.name
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.name
     *
     * @param name the value for message.name
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.title
     *
     * @return the value of message.title
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.title
     *
     * @param title the value for message.title
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.content
     *
     * @return the value of message.content
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.content
     *
     * @param content the value for message.content
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.createTime
     *
     * @return the value of message.createTime
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.createTime
     *
     * @param createtime the value for message.createTime
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.reply
     *
     * @return the value of message.reply
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public String getReply() {
        return reply;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.reply
     *
     * @param reply the value for message.reply
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setReply(String reply) {
        this.reply = reply == null ? null : reply.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.replyTime
     *
     * @return the value of message.replyTime
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public Date getReplytime() {
        return replytime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.replyTime
     *
     * @param replytime the value for message.replyTime
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column message.statue
     *
     * @return the value of message.statue
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public Integer getStatue() {
        return statue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column message.statue
     *
     * @param statue the value for message.statue
     *
     * @mbg.generated Sun Jul 07 14:36:29 CST 2019
     */
    public void setStatue(Integer statue) {
        this.statue = statue;
    }
}