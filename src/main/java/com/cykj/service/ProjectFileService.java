package com.cykj.service;

import com.cykj.util.ProjectMpp;

import java.util.List;

public interface ProjectFileService {
    /**
     * 插入project数据
     * @param projectFiles
     * @return
     */
    int addProjectSelective(List<ProjectMpp> projectFiles);

}
