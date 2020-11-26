package com.cykj.entity;

import javax.xml.crypto.Data;
import java.util.Date;

public class FrontUser {

    private int userId;
    private String userName;
    private String account;
    private String pwd;
    private String telephone;//手机号
    private int accStandId;//账号状态
    private int jobStandId;//就业状态
    private String address;//地址
    private int isOpen;//是否公开
    private String industry;//意向行业

    public FrontUser() {
    }

    public FrontUser(int userId, String userName, String account, String pwd, String telephone, int accStandId, int jobStandId, String address, int isOpen, String industry) {
        this.userId = userId;
        this.userName = userName;
        this.account = account;
        this.pwd = pwd;
        this.telephone = telephone;
        this.accStandId = accStandId;
        this.jobStandId = jobStandId;
        this.address = address;
        this.isOpen = isOpen;
        this.industry = industry;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getAccStandId() {
        return accStandId;
    }

    public void setAccStandId(int accStandId) {
        this.accStandId = accStandId;
    }

    public int getJobStandId() {
        return jobStandId;
    }

    public void setJobStandId(int jobStandId) {
        this.jobStandId = jobStandId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(int isOpen) {
        this.isOpen = isOpen;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }
}
