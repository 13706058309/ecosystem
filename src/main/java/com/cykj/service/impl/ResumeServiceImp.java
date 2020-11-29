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
     * @param workExperience
     * @param resumeId
     * @return
     */
    @Override
    public boolean workInsert(WorkExperience workExperience, int resumeId,Resume resume) {
        int n=jianliMapper.workInsert(workExperience);
        int k=insertid();

        int j=jianliMapper.rwInsert(k,resumeId);
        k=jianliMapper.updateResumeTime(resume);
        if (j>0){
            return true;
        }
        return false;
    }


    /**
     * @param projectExperience
     * @param resumeId
     * @return
     */
    @Override
    public boolean projectInsert(ProjectExperience projectExperience, int resumeId,Resume resume) {
        int n=jianliMapper.projectInsert(projectExperience);
        int k=insertid();
        int i=jianliMapper.rpInsert(k,resumeId);
        i=jianliMapper.updateResumeTime(resume);
        if (i>0){
            return true;
        }
        return false;
    }


    /**
     * 背景事务整合
     *
     * @param educationalBackground
     * @param resumeId
     * @return
     */
    @Override
    public boolean educationInsert(EducationalBackground educationalBackground, int resumeId,Resume resume) {
        int n=jianliMapper.educationInsert(educationalBackground);
        int k=insertid();

        int j=jianliMapper.reInsert(k,resumeId);
        k=jianliMapper.updateResumeTime(resume);
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
    public int rwDel(int weId, int resumeId,Resume resume) {
        int n=jianliMapper.rwDel(weId,resumeId);
        int k=jianliMapper.workDel(weId);
        k=jianliMapper.updateResumeTime(resume);
        return k;
    }

    /**
     * @param peId
     * @param resumeId
     * @return
     */
    @Override
    public int rpDel(int peId, int resumeId,Resume resume) {
        int n=jianliMapper.rpDel(peId,resumeId);
        int k=jianliMapper.projectDel(peId);
        k=jianliMapper.updateResumeTime(resume);
        return k;
    }

    /**
     * @param ebId
     * @param resumeId
     * @return
     */
    @Override
    public int reDel(int ebId, int resumeId,Resume resume) {

        int n=jianliMapper.reDel(ebId,resumeId);
        int k=jianliMapper.educationDel(ebId);
        k=jianliMapper.updateResumeTime(resume);
        return k;
    }

    /**
     * @param resume
     * @return
     */
    @Override
    public int resumeUpdate(Resume resume) {
        int n=jianliMapper.resumeUpdate(resume);
        n=jianliMapper.updateResumeTime(resume);
        return n;
    }

    /**
     * @param workExperience
     * @return
     */
    @Override
    public int workUpdate(WorkExperience workExperience,Resume resume) {
        int n=jianliMapper.workUpdate(workExperience);
        n=jianliMapper.updateResumeTime(resume);
        return n;
    }

    /**
     * @param projectExperience
     * @return
     */
    @Override
    public int projectUpdate(ProjectExperience projectExperience,Resume resume) {
        int n=jianliMapper.projectUpdate(projectExperience);
        n=jianliMapper.updateResumeTime(resume);
        return n;
    }

    /**
     * @param educationalBackground
     * @return
     */
    @Override
    public int educationUpdate(EducationalBackground educationalBackground,Resume resume) {
        int n=jianliMapper.educationUpdate(educationalBackground);
        n=jianliMapper.updateResumeTime(resume);
        return n;
    }

    /**
     * @param resume
     * @return
     */
    @Override
    public int expectWorkUpdate(Resume resume) {
        int n=jianliMapper.expectWorkUpdate(resume);
        n=jianliMapper.updateResumeTime(resume);
        return n;
    }

    /**
     * @param resume
     * @return
     */
    @Override
    public int selfEvaUpdate(Resume resume) {
        int n=jianliMapper.selfEvaUpdate(resume);
        n=jianliMapper.updateResumeTime(resume);
        return n;
    }

//    -------------------------------------------------------------------------------------------------------------------------------

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
     * 查找沟通过公司
     *
     * @param userId
     * @param page
     * @param size
     * @return
     */
    @Override
    public List<BackUser> communication(int userId, int page, int size) {
        return jianliMapper.communication(userId,page,size);
    }

    @Override
    public List<BackUser> communicationCount(int userId) {
        return jianliMapper.communicationCount(userId);
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
     * 添加刚兴趣岗位
     *
     * @param userId
     * @param pPostId
     * @return
     */
    @Override
    public int pcInsert(int userId, int pPostId) {
        return jianliMapper.pcInsert(userId,pPostId);
    }

    /**
     * 查看岗位是否有被收藏
     *
     * @param userId
     * @param pPostId
     * @return
     */
    @Override
    public PostCellec findPostCellec(int userId, int pPostId) {
        return jianliMapper.findPostCellec(userId,pPostId);
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
        int n=jianliMapper.clicks(pPostID);
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

    /**
     * 简历投递
     *
     * @param userId
     * @param pPostId
     * @return
     */
    @Override
    public int sendResume(int userId, int pPostId) {
        int n=jianliMapper.postNum(pPostId);
        return jianliMapper.sendResume(userId,pPostId);
    }

    /**
     * 查找手机号是否存在
     *
     * @param telephone
     * @return
     */
    @Override
    public List<UserInfo> findTtelephone(String telephone) {
        return jianliMapper.findTtelephone(telephone);
    }

    /**
     * 查看反馈信息
     *
     * @param userId
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<PostPosition> deliveryInfo(int userId, int page, int limit) {
        return jianliMapper.deliveryInfo(userId,page,limit);
    }

    @Override
    public List<PostPosition> deliveryInfoCount(int userId) {
        return jianliMapper.deliveryInfoCount(userId);
    }

    /**
     * 查询所有职位类型
     *
     * @return
     */
    @Override
    public List<Industry> industrys(){
        return jianliMapper.industrys();
    }

    /**
     * 根据首字母查询城市
     *
     * @param begin
     * @param end
     * @return
     */
    @Override
    public List<City> citys(int begin, int end) {
        return jianliMapper.citys(begin,end);
    }
//    public List<Position> positions() {
//        return jianliMapper.positions();
//    }



    /**
     * 修改简历头像
     *
     * @param resume
     * @return
     */
    @Override
    public int updatePhoto(Resume resume) {
        return jianliMapper.updatePhoto(resume);
    }

    /**
     * 用户头像
     *
     * @param userInfo
     * @return
     */
    @Override
    public int updateHeadImgUrl(UserInfo userInfo) {
        return jianliMapper.updateHeadImgUrl(userInfo);
    }

    /**
     * 查看是否有投递过该岗位的简历
     *
     * @param userId
     * @param pPostId
     * @return
     */
    @Override
    public Delivery findDelivery(int userId, int pPostId) {
        return jianliMapper.findDelivery(userId,pPostId);
    }

    /**
     * 修改用户名
     *
     * @param userInfo
     * @return
     */
    @Override
    public int updateName(UserInfo userInfo) {
        return jianliMapper.updateName(userInfo);
    }


    /**
     * 修改简历联系方式
     *
     * @param userInfo
     * @return
     */
    @Override
    public int updatePhone(UserInfo userInfo) {
        return jianliMapper.updatePhone(userInfo);
    }


}
