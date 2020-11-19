package com.cykj.mapper;

import com.cykj.entity.Depart;
import com.cykj.entity.Position;
import com.cykj.entity.Position;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
/**
 * 岗位
 */
public interface PositionMapper {

    public List<Position> findPost (long departId);
    List<Position> findPositionByID(int departID);

    Position findPostName(int postID);
}
