package com.chensheng.dao;

import com.chensheng.model.EcsVehicle;
import java.util.List;

public interface EcsVehicleMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_vehicle
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String vid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_vehicle
     *
     * @mbg.generated
     */
    int insert(EcsVehicle record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_vehicle
     *
     * @mbg.generated
     */
    EcsVehicle selectByPrimaryKey(String vid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_vehicle
     *
     * @mbg.generated
     */
    List<EcsVehicle> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_vehicle
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(EcsVehicle record);
}