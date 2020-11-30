package com.cykj.mapper;

import com.cykj.util.ProjectMpp;

public interface ProjectMppMapper {
    /**
     * 插入project数据
     * @param projectMpp
     * @return
     */
    int addProjectSelective(ProjectMpp projectMpp);

}
