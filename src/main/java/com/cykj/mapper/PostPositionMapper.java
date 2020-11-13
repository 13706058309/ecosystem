package com.cykj.mapper;

import com.cykj.entity.PostPosition;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 发布岗位表
 */
public interface PostPositionMapper {
    int addPostPosition(PostPosition postPosition);

    List<PostPosition> findOnlinePosition(Map<String,Object> map);

    int findOnlinePositionNum(Map<String,Object> map);

    int changePostPositionStand(Map<String,Object> map);
}
