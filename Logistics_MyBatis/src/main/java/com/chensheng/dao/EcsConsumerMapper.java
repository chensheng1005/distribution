package com.chensheng.dao;

import com.chensheng.model.EcsConsumer;
import java.util.List;

public interface EcsConsumerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_consumer
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_consumer
     *
     * @mbg.generated
     */
    int insert(EcsConsumer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_consumer
     *
     * @mbg.generated
     */
    EcsConsumer selectByPrimaryKey(String cid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_consumer
     *
     * @mbg.generated
     */
    List<EcsConsumer> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ecs_consumer
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(EcsConsumer record);
}