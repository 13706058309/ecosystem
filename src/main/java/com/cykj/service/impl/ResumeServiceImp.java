package com.cykj.service.impl;

import com.cykj.entity.*;
import com.cykj.mapper.JianliMapper;
import com.cykj.service.ResumeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ResumeServiceImp implements ResumeService {
    @Resource
    private JianliMapper jianliMapper;


    /**
     * @param userid 用户id
     * @return
     */
    @Override
    public Resume resume(long userid) {
        return jianliMapper.resume(userid);
    }

    /**
     * @param workExperience
     * @return
     */
    @Override
    public int workInsert(WorkExperience workExperience) {
        int n=jianliMapper.workInsert(workExperience);
        return n;
    }

    /**
     * 获取最新添加数据的id
     *
     * @return
     */
    @Override
    public int insertid() {
        int n=jianliMapper.insertid();
        return n;
    }

    /**
     * @param weId
     * @param resumeId
     * @return
     */
    @Override
    public int rwInsert(int weId, int resumeId) {
        int n=jianliMapper.rwInsert(weId,resumeId);
        return n;
    }

    /**
     * @param workExperience
     * @param resumeId
     * @return
     */
    @Override
    public boolean workInsert(WorkExperience workExperience, int resumeId) {
        int n=workInsert(workExperience);
        int k=insertid();
        int j=rwInsert(k,resumeId);
        if (j>0){
            return true;
        }
        return false;
    }

    /**
     * @param projectExperience
     * @return
     */
    @Override
    public int projectInsert(ProjectExperience projectExperience) {
        int n=jianliMapper.projectInsert(projectExperience);
        return n;
    }

    /**
     * @param peId
     * @param resumeId
     * @return
     */
    @Override
    public int rpInsert(int peId, int resumeId) {
        int n=jianliMapper.rpInsert(peId,resumeId);
        return n;
    }

    /**
     * @param projectExperience
     * @param resumeId
     * @return
     */
    @Override
    public boolean projectInsert(ProjectExperience projectExperience, int resumeId) {
        int n=projectInsert(projectExperience);
        int k=insertid();
        int j=rpInsert(k,resumeId);
        if (j>0){
            return true;
        }
        return false;
    }

    /**
     * 背景表数据添加
     *
     * @param educationalBackground
     * @return
     */
    @Override
    public int educationInsert(EducationalBackground educationalBackground) {
        int n=jianliMapper.educationInsert(educationalBackground);
        return n;
    }

    /**
     * 背景关系表数据添加
     *
     * @param ebId
     * @param resumeId
     * @return
     */
    @Override
    public int reInsert(int ebId, int resumeId) {
        int n=jianliMapper.reInsert(ebId,resumeId);
        return n;
    }

    /**
     * 背景事务整合
     *
     * @param educationalBackground
     * @param resumeId
     * @return
     */
    @Override
    public boolean educationInsert(EducationalBackground educationalBackground, int resumeId) {
        int n=educationInsert(educationalBackground);
        int k=insertid();
        int j=reInsert(k,resumeId);
        if (j>0){
            return true;
        }
        return false;
    }

    /**
     * @param weId
     * @param resumeId
     * @return
     */
    @Override
    public int rwDel(int weId, int resumeId) {
        int n=jianliMapper.rwDel(weId,resumeId);
        int k=jianliMapper.workDel(weId);
        return k;
    }

    /**
     * @param peId
     * @param resumeId
     * @return
     */
    @Override
    public int rpDel(int peId, int resumeId) {
        int n=jianliMapper.rpDel(peId,resumeId);
        int k=jianliMapper.projectDel(peId);
        return k;
    }

    /**
     * @param ebId
     * @param resumeId
     * @return
     */
    @Override
    public int reDel(int ebId, int resumeId) {
        int n=jianliMapper.reDel(ebId,resumeId);
        int k=jianliMapper.educationDel(ebId);
        return k;
    }

    /**
     * @param resume
     * @return
     */
    @Override
    public int resumeUpdate(Resume resume) {
        int n=jianliMapper.resumeUpdate(resume);
        return n;
    }

    /**
     * @param workExperience
     * @return
     */
    @Override
    public int workUpdate(WorkExperience workExperience) {
        int n=jianliMapper.workUpdate(workExperience);
        return n;
    }

    /**
     * @param projectExperience
     * @return
     */
    @Override
    public int projectUpdate(ProjectExperience projectExperience) {
        int n=jianliMapper.projectUpdate(projectExperience);
        return n;
    }

    /**
     * @param educationalBackground
     * @return
     */
    @Override
    public int educationUpdate(EducationalBackground educationalBackground) {
        int n=jianliMapper.educationUpdate(educationalBackground);
        return n;
    }

    /**
     * @param resume
     * @return
     */
    @Override
    public int expectWorkUpdate(Resume resume) {
        int n=jianliMapper.expectWorkUpdate(resume);
        return n;
    }

    /**
     * @param resume
     * @return
     */
    @Override
    public int selfEvaUpdate(Resume resume) {
        int n=jianliMapper.selfEvaUpdate(resume);
        return n;
    }

    /**
     * 查找刚兴趣岗位
     *
     * @param userId
     * @return
     */
    @Override
    public List<PostPosition> findPosts(int userId,int page,int size) {
        return jianliMapper.findPosts(userId,page,size);
    }

    @Override
    public List<PostPosition> findPostsCount(int userId) {
        return jianliMapper.findPostsCount(userId);
    }

    /**
     * 删除感兴趣岗位
     *
     * @param userId
     * @param pPostId
     * @return
     */
    @Override
    public int positionDel(int userId, int pPostId) {
        int n=jianliMapper.pcDel(userId,pPostId);
//        n=jianliMapper.postPositionDel(pPostId);
        return n;
    }

    /**
     * 查找投递岗位
     *
     * @param userId
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<PostPosition> deliveryPosts(int userId, int page, int size) {
        return jianliMapper.deliveryPosts(userId,page,size);
    }

    /**
     * @param userId
     * @return
     */
    @Override
    public List<PostPosition> deliveryPostsCount(int userId) {
        return jianliMapper.deliveryPostsCount(userId);
    }

    /**
     * 岗位列表
     *
     * @param map
     * @return
     */
    @Override
    public List<PostPosition> jobs(Map map) {
        return jianliMapper.jobs(map);
    }

    /**
     * @param map
     * @return
     */
    @Override
    public List<PostPosition> jobsCount(Map map) {
        return jianliMapper.jobsCount(map);
    }

    /**
     * 查找岗位详情
     *
     * @param pPostID
     * @return
     */
    @Override
    public PostPosition findPost(int pPostID) {
        return jianliMapper.findPost(pPostID);
    }

    /**
     * 利用id和密码查找是否有该用户
     *
     * @param map
     * @return
     */
    @Override
    public UserInfo findpwd(Map map) {
        return jianliMapper.findpwd(map);
    }

    /**
     * 修改密码
     *
     * @param map
     * @return
     */
    @Override
    public int savepwd(Map map) {
        return jianliMapper.savepwd(map);
    }

    /**
     * 修改用户简历状态
     *
     * @param map
     * @return
     */
    @Override
    public int saveShow(Map map) {
        return jianliMapper.saveShow(map);
    }

    /**
     * 获取前台用户
     *
     * @param userId
     * @return
     */
    @Override
    public UserInfo findUser(int userId) {
        return jianliMapper.findUser(userId);
    }


}
