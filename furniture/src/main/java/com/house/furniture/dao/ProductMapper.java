package com.house.furniture.dao;

import com.house.furniture.bean.Product;
import com.house.furniture.bean.ProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
    long countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer pid);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer pid);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    List<Product> listProductsByCid(int cid);

    int updateByPrimaryKey(Product record);

    List<Product> listProductByCategoryName(@Param("num")int num, @Param("name")String name);
    
    // update product set score = (select ceil(AVG(LEVEL)) from remark where pid = 1) where pid = 1;
    int updateScore(int pid);
    
    int getCountByCategory(int cid);
}