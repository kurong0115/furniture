package com.house.furniture.dao;

import com.house.furniture.bean.Product;
import com.house.furniture.bean.ProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    long countByExample(ProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int deleteByExample(ProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int deleteByPrimaryKey(Integer pid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int insert(Product record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int insertSelective(Product record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    List<Product> selectByExample(ProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    Product selectByPrimaryKey(Integer pid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int updateByPrimaryKeySelective(Product record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table product
     *
     * @mbg.generated Tue Jul 09 09:55:38 CST 2019
     */
    int updateByPrimaryKey(Product record);
    
    List<Product> listProductByCategoryName(@Param("num")int num, @Param("name")String name);
    
    // update product set score = (select ceil(AVG(LEVEL)) from remark where pid = 1) where pid = 1;
    int updateScore(int pid);
    
    int getCountByCategory(int cid);
    
    List<Product> listProductsByCid(int cid);
    
    int removeProduct(int pid);
    
    int uploadProduct(int pid);
}