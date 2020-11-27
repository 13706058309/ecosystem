package com.cykj.mapper;

import com.cykj.entity.BackUserNum;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface TongjiMapper {

    List<BackUserNum> userNumWeek();
    List<BackUserNum> userNumMonth();
    List<BackUserNum> userNumHalfYear();

    List<BackUserNum> adminNumWeek();
    List<BackUserNum> adminNumMon();
    List<BackUserNum> adminNumHalfYear();

}
