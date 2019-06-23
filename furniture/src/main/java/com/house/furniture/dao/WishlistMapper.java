package com.house.furniture.dao;

import com.house.furniture.bean.Wishlist;
import com.house.furniture.bean.WishlistExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WishlistMapper {
    long countByExample(WishlistExample example);

    int deleteByExample(WishlistExample example);

    int deleteByPrimaryKey(Integer wid);

    int insert(Wishlist record);

    int insertSelective(Wishlist record);

    List<Wishlist> selectByExample(WishlistExample example);

    Wishlist selectByPrimaryKey(Integer wid);

    int updateByExampleSelective(@Param("record") Wishlist record, @Param("example") WishlistExample example);

    int updateByExample(@Param("record") Wishlist record, @Param("example") WishlistExample example);

    int updateByPrimaryKeySelective(Wishlist record);

    int updateByPrimaryKey(Wishlist record);
}