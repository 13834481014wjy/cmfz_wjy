package com.baizhi.dao;


import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    void insert(T t);
    void delete(String id);
    void update(T t);
    T queryOne(String id);
    T queryByUsernameAndPwd(T t);
    List<T> queryAll();
    //参数1 ：起始条  参数2：每页显示的记录数
    List<T> queryByPage(@Param("start") Integer start, @Param("rows") Integer rows);
    Long queryTotals();

    void deleteAll(@Param("ids") String[] ids);
}
