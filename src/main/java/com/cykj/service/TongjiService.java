package com.cykj.service;

import com.cykj.entity.BackUserNum;

import java.util.List;

public interface TongjiService {


    List<BackUserNum> userNumWeek();
    List<BackUserNum> userNumMonth();
    List<BackUserNum> userNumHalfYear();

    List<BackUserNum> adminNumWeek();
    List<BackUserNum> adminNumMon();
    List<BackUserNum> adminNumHalfYear();

}
