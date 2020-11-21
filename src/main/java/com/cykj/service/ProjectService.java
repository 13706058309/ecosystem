package com.cykj.service;

import com.cykj.entity.ProjectInfo;
import java.util.List;
import java.util.Map;

public interface ProjectService {
    /**
     * 查询所有企业发布的项目
     * @param condition
     * @param page
     * @param limit
     * @return
     */
    List<ProjectInfo> findProjectAll(Map<String,Object> condition,int page , int limit);

    /**
     * 查询记录数
     * @param condition
     * @return
     */
    int findRecords(Map<String,Object> condition);

    /**
     * 查询项目
     * @param projectInfo
     * @return
     */
    ProjectInfo findProject(ProjectInfo projectInfo);
}
