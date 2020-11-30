package com.cykj.entity;

import java.util.List;

import org.springframework.stereotype.Component;

/**
 * 后台用户
 */
@Component
public class BackUser {

  private long bUserId; //后台用户ID
  private String bUserName; //用户名
  private String account; //账号
  private String pwd; //密码
  private String contactInfo; //联系方式
  private String infoIntr; //信息简介
  private String busiLice; //营业执照
  private String email; //邮箱
  private String address; //地点
  private String scale; //规模
  private String city; //城市
  private String province; //省份
  private String homePage; //主页
  private String finanStage; //融资阶段
  private String product; //公司产品
  private String logo; //logo
  private long roleId; //角色ID
  private RoleInfo role; //角色实体类
  private String stateId;//状态
  private Parameter states;//状态实体类 （iD 状态名称  类型）
  private String bRegTime;//注册时间
  private String coreValue;//企业核心价值
  private String compName;
  private String lng;
  private String lat;
  private List<Industry> industrys;
  private long balance;


  public BackUser() {
  }

  public BackUser(long bUserId, String bUserName, String account, String pwd, String contactInfo, String infoIntr, String busiLice, String email, String address, String scale, String city, String province, String homePage, String finanStage, String product, String logo, long roleId, RoleInfo role, String stateId, Parameter states, String bRegTime, String coreValue, String compName, List<Industry> industrys) {
    this.bUserId = bUserId;
    this.bUserName = bUserName;
    this.account = account;
    this.pwd = pwd;
    this.contactInfo = contactInfo;
    this.infoIntr = infoIntr;
    this.busiLice = busiLice;
    this.email = email;
    this.address = address;
    this.scale = scale;
    this.city = city;
    this.province = province;
    this.homePage = homePage;
    this.finanStage = finanStage;
    this.product = product;
    this.logo = logo;
    this.roleId = roleId;
    this.role = role;
    this.stateId = stateId;
    this.states = states;
    this.bRegTime = bRegTime;
    this.coreValue = coreValue;
    this.compName = compName;
    this.industrys = industrys;
  }




  public long getbUserId() {
    return bUserId;
  }

  public void setbUserId(long bUserId) {
    this.bUserId = bUserId;
  }

  public String getbUserName() {
    return bUserName;
  }

  public void setbUserName(String bUserName) {
    this.bUserName = bUserName;
  }

  public long getRoleId() {
    return roleId;
  }

  public void setRoleId(long roleId) {
    this.roleId = roleId;
  }

  public RoleInfo getRole() {
    return role;
  }

  public void setRole(RoleInfo role) {
    this.role = role;
  }

  public long getBUserId() {
    return bUserId;
  }

  public void setBUserId(long bUserId) {
    this.bUserId = bUserId;
  }


  public String getBUserName() {
    return bUserName;
  }

  public void setBUserName(String bUserName) {
    this.bUserName = bUserName;
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


  public String getContactInfo() {
    return contactInfo;
  }

  public void setContactInfo(String contactInfo) {
    this.contactInfo = contactInfo;
  }

  public String getInfoIntr() {
    return infoIntr;
  }

  public void setInfoIntr(String infoIntr) {
    this.infoIntr = infoIntr;
  }

  public String getBusiLice() {
    return busiLice;
  }

  public void setBusiLice(String busiLice) {
    this.busiLice = busiLice;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getScale() {
    return scale;
  }

  public void setScale(String scale) {
    this.scale = scale;
  }

  public String getCity() {
    return city;
  }

  public void setCity(String city) {
    this.city = city;
  }

  public String getProvince() {
    return province;
  }

  public void setProvince(String province) {
    this.province = province;
  }

  public String getHomePage() {
    return homePage;
  }

  public void setHomePage(String homePage) {
    this.homePage = homePage;
  }

  public String getFinanStage() {
    return finanStage;
  }

  public void setFinanStage(String finanStage) {
    this.finanStage = finanStage;
  }

  public String getProduct() {
    return product;
  }

  public void setProduct(String product) {
    this.product = product;
  }

  public String getLogo() {
    return logo;
  }

  public void setLogo(String logo) {
    this.logo = logo;
  }

  public String getStateId() {
    return stateId;
  }

  public void setStateId(String stateId) {
    this.stateId = stateId;
  }

  public Parameter getStates() {
    return states;
  }

  public void setStates(Parameter states) {
    this.states = states;
  }

  public String getbRegTime() {
    return bRegTime;
  }

  public void setbRegTime(String bRegTime) {
    this.bRegTime = bRegTime;
  }

  public String getCoreValue() {
    return coreValue;
  }

  public void setCoreValue(String coreValue) {
    this.coreValue = coreValue;
  }


  public List<Industry> getIndustrys() {
    return industrys;
  }

  public void setIndustrys(List<Industry> industrys) {
    this.industrys = industrys;
  }

  public String getCompName() {
    return compName;
  }

  public void setCompName(String compName) {
    this.compName = compName;
  }

  public String getLng() {
    return lng;
  }

  public void setLng(String lng) {
    this.lng = lng;
  }

  public String getLat() {
    return lat;
  }

  public void setLat(String lat) {
    this.lat = lat;
  }

  public long getBalance() {
    return balance;
  }

  public void setBalance(long balance) {
    this.balance = balance;
  }

  @Override
  public String toString() {
    return "BackUser{" +
            "bUserId=" + bUserId +
            ", bUserName='" + bUserName + '\'' +
            ", account='" + account + '\'' +
            ", pwd='" + pwd + '\'' +
            ", contactInfo='" + contactInfo + '\'' +
            ", infoIntr='" + infoIntr + '\'' +
            ", busiLice='" + busiLice + '\'' +
            ", email='" + email + '\'' +
            ", address='" + address + '\'' +
            ", scale='" + scale + '\'' +
            ", city='" + city + '\'' +
            ", province='" + province + '\'' +
            ", homePage='" + homePage + '\'' +
            ", finanStage='" + finanStage + '\'' +
            ", product='" + product + '\'' +
            ", logo='" + logo + '\'' +
            ", roleId=" + roleId +
            ", role=" + role +
            ", stateId='" + stateId + '\'' +
            ", states=" + states +
            ", bRegTime='" + bRegTime + '\'' +
            ", coreValue='" + coreValue + '\'' +
            ", compName='" + compName + '\'' +
            ", lng='" + lng + '\'' +
            ", lat='" + lat + '\'' +
            ", industrys=" + industrys +
            '}';
  }
}
