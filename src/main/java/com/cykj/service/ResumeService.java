package com.cykj.service;

import com.cykj.entity.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ResumeService {
    /**
     *
     * @param userid 用户id
     * @return
     */
    public Resume resume(long userid);

    /**
     *
     * @param workExperience
     * @return
     */
    public int workInsert(WorkExperience workExperience);

    /**
     * 获取最新添加数据的id
     * @return
     */
    public int insertid();

    /**
     *
     * @param weId
     * @param resumeId
     * @return
     */
    public int rwInsert(int weId,int resumeId);

    /**
     *
     * @param workExperience
     * @param resumeId
     * @return
     */
    public boolean workInsert(WorkExperience workExperience,int resumeId);

    /**
     *
     * @param projectExperience
     * @return
     */
    public int projectInsert(ProjectExperience projectExperience);

    /**
     *
     * @param peId
     * @param resumeId
     * @return
     */
    public int rpInsert(int peId,int resumeId);

    /**
     *
     * @param projectExperience
     * @param resumeId
     * @return
     */
    public boolean projectInsert(ProjectExperience projectExperience,int resumeId);

    /**
     * 背景表数据添加
     * @param educationalBackground
     * @return
     */
    public int educationInsert(EducationalBackground educationalBackground);

    /**
     * 背景关系表数据添加
     * @param ebId
     * @param resumeId
     * @return
     */
    public int reInsert(int ebId,int resumeId);

    /**
     * 背景事务整合
     * @param educationalBackground
     * @param resumeId
     * @return
     */
    public boolean educationInsert(EducationalBackground educationalBackground,int resumeId);

    /**
     *
     * @param weId
     * @param resumeId
     * @return
     */
    public int rwDel(int weId,int resumeId);

    /**
     *
     * @param peId
     * @param resumeId
     * @return
     */
    public int rpDel(int peId,int resumeId);

    /**
     *
     * @param ebId
     * @param resumeId
     * @return
     */
    public int reDel(int ebId,int resumeId);

    //简历修改

    /**
     *
     * @param resume
     * @return
     */
    public int resumeUpdate(Resume resume);

    /**
     *
     * @param workExperience
     * @return
     */
    public int workUpdate(WorkExperience workExperience);

    /**
     *
     * @param projectExperience
     * @return
     */
    public int projectUpdate(ProjectExperience projectExperience);

    /**
     *
     * @param educationalBackground
     * @return
     */
    public int educationUpdate(EducationalBackground educationalBackground);

//    期望工作和个人优势修改

    /**
     *
     * @param resume
     * @return
     */
    public int expectWorkUpdate(Resume resume);

    /**
     *
     * @param resume
     * @return
     */
    public int selfEvaUpdate(Resume resume);

    /**
     * 查找刚兴趣岗位
     * @param userId
     * @return
     */
    public List<PostPosition> findPosts(int userId,int page,int size);
    public List<PostPosition> findPostsCount(int userId);

    /**
     * 删除感兴趣岗位
     * @param userId
     * @param pPostId
     * @return
     */
    public int positionDel(int userId,int pPostId);



    /**
     * 查找投递岗位
     * @param userId
     * @param page
     * @param size
     * @return
     */
    public List<PostPosition> deliveryPosts(int userId,int page,int size);

    /**
     *
     * @param userId
     * @return
     */
    public List<PostPosition> deliveryPostsCount(int userId);

    /**
     * 岗位列表
     * @param map
     * @return
     */
    public List<PostPosition> jobs(Map map);

    /**
     *
     * @param map
     * @return
     */
    public List<PostPosition> jobsCount(Map map);

    /**
     * 查找岗位详情
     * @param pPostID
     * @return
     */
    public PostPosition findPost(int pPostID);

    /**
     * 利用id和密码查找是否有该用户
     * @param map
     * @return
     */
    public UserInfo findpwd(Map map);

    /**
     * 修改密码
     * @param map
     * @return
     */
    public int savepwd(Map map);

    /**
     * 修改用户简历状态
     * @param map
     * @return
     */
    public int saveShow(Map map);

    /**
     * 获取前台用户
     * @param userId
     * @return
     */
    public UserInfo findUser(int userId);

}
