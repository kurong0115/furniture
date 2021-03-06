package com.house.furniture.vo;

/**
 * 
 * 类描述: 用户返回结果的展示
 * @author Administrator
 * 创建时间: 2019年6月3日下午8:38:03
 */
public class Result {
	public static final Integer EXECUTION_FAILED = 0;
	public static final Integer EXECUTION_SUCCESS = 1;	
	public static final Integer EXECUTION_CANCEL = 2;
	
	private Integer code;
	private String message;
	private Object data;
	private Integer page;
	private Integer size;
	private Long totalSize;
	private Integer totalPage;
	
	public Result() {
		super();			
	}
	
	public Result(Integer code, String message) {
		super();
		this.code = code;
		this.message = message;
	}
	
	public Result(Integer code, String message, Object data) {
		super();
		this.code = code;
		this.message = message;
		this.data = data;
	}
	
	public Result(Integer code, String message, Integer page, Integer size, Object data, Long totalSize) {
		super();
		this.code = code;
		this.message = message;
		this.page = page;
		this.size = size;
		this.data = data;
		this.totalSize = totalSize;
		this.totalPage = (int) (totalSize % size == 0? totalSize / size:totalSize / size + 1);
	}
	
	public Result(Integer page, Integer size, Object data, Long totalSize) {
		super();
		this.page = page;
		this.size = size;
		this.data = data;
		this.totalSize = totalSize;
		this.totalPage = (int) (totalSize % size == 0? totalSize / size:totalSize / size + 1);
	}
	
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Long getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(Long totalSize) {
		this.totalSize = totalSize;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
