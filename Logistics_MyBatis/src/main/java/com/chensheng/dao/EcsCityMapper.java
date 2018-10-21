package com.chensheng.dao;

import com.chensheng.model.EcsCity;
import java.util.List;

public interface EcsCityMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_city
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_city
     *
     * @mbg.generated
     */
    int insert(EcsCity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_city
     *
     * @mbg.generated
     */
    EcsCity selectByPrimaryKey(String cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_city
     *
     * @mbg.generated
     */
    List<EcsCity> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_city
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(EcsCity record);
}