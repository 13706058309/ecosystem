package com.cykj.mapper;

import com.cykj.entity.PostPosition;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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

    List<PostPosition> findPosition(Map<String,Object> map);

    int findPositionNum(Map<String,Object> map);

    int changePostPositionStand(Map<String,Object> map);

    int updatePostPosition(Map<String,Object> map);

//    最新岗位 9条信息
    public List<PostPosition> postList(@Param("workCity") String workCity);
}
