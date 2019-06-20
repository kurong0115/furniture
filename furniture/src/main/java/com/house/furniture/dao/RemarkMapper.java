package com.house.furniture.dao;

import com.house.furniture.bean.Remark;
import com.house.furniture.bean.RemarkExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RemarkMapper {
    long countByExample(RemarkExample example);

    int deleteByExample(RemarkExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Remark record);

    int insertSelective(Remark record);

    List<Remark> selectByExampleWithBLOBs(RemarkExample example);

    List<Remark> selectByExample(RemarkExample example);

    Remark selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Remark record, @Param("example") RemarkExample example);

    int updateByExampleWithBLOBs(@Param("record") Remark record, @Param("example") RemarkExample example);

    int updateByExample(@Param("record") Remark record, @Param("example") RemarkExample example);

    int updateByPrimaryKeySelective(Remark record);

    int updateByPrimaryKeyWithBLOBs(Remark record);

    int updateByPrimaryKey(Remark record);
}