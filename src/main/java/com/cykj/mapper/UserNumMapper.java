package com.cykj.mapper;


import com.cykj.entity.BackUserNum;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserNumMapper {

    List<BackUserNum> backUserNumMonth();

    List<BackUserNum> backUserNumWeek( );


    List<BackUserNum> backUserNumHalfYear();
    List<BackUserNum> userNumMonth();

    List<BackUserNum> userNumWeek( );


    List<BackUserNum> userNumHalfYear();


    List<BackUserNum> all();
}
