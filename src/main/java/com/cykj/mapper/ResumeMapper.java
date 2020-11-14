package com.cykj.mapper;

import com.cykj.entity.Resume;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
/**
 * 简历
 */
public interface ResumeMapper {
    List<Resume> findAllResume(Map<String,Object> map);
    List<Resume> findAllResumeNum(Map<String,Object> map);
}
