package com.loeo.service.impl;

import com.loeo.common.consts.Message;
import com.loeo.dao.BaseDao;
import com.loeo.dao.UserDao;
import com.loeo.entity.SysRole;
import com.loeo.entity.SysUser;
import com.loeo.exception.BaseException;
import com.loeo.service.AbsService;
import com.loeo.util.Base64_Img;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by LT on 2014/12/20.
 */
@Service
@Transactional
public class UserService extends AbsService<SysUser> {
    private UserDao userDao;
    public List<SysUser> getAllUser() {
        return userDao.findAll();
    }

    public SysUser findUserById(int id) {
        return userDao.findById(id);
    }

    public SysUser findUserByUsername(String username) {
        return userDao.findByUserName(username);
    }

    public void saveUserRole(List<SysRole> roles,Integer userId) {
        userDao.deleteUserRoleByUserId(userId);
        userDao.saveUserRole(roles,userId);
    }

    @Override
    protected boolean beforeInsert(SysUser sysUser) {
        SysUser user = findUserByUsername(sysUser.getUsername());
        if(user != null){
            throw new BaseException(Message.USERNAME_EXIST);
        }
        return true;
    }

    @Override
    protected boolean beforeUpdate(SysUser sysUser) {
        SysUser user = findUserByUsername(sysUser.getUsername());
        if(user == null){
            throw new BaseException(Message.USERNAME_NOT_EXIST);
        }else if(!user.getId().equals(sysUser.getId())){
            throw new BaseException(Message.USERNAME_EXIST);
        } else if (!user.getPassword().equals(sysUser.getPassword())) {
            throw new BaseException(Message.PASSWORD_ERROR);
        }
        return true;
    }

    public SysUser uploadAvatar(String username,String avatar,String path,String filename){
        avatar = avatar.replace("data:image/png;base64,","");
        if(Base64_Img.generateImage(avatar, path + "\\" + filename)){
            SysUser sysUser = userDao.findByUserName(username);
            sysUser.setAvatar(filename);
            userDao.update(sysUser);
            return sysUser;
        }
        return null;
    }

    public void delUser(SysUser sysUser) {
        userDao.deleteById(sysUser.getId());
    }

    public boolean exist(String username) {
        SysUser sysUser = userDao.findByUserName(username);
        if(sysUser == null){
            return false;
        }
        return true;
    }

    public SysUser userLogin(String username, String password) {
        SysUser sysUser = userDao.findByUserName(username);
        if(sysUser !=null && sysUser.getPassword().equals(password)){
            return sysUser;
        }
        return null;
    }

    public String userRegister(Map<String, String> map) {
        String username = map.get("username");
        String password = map.get("password");
        String password1 = map.get("password1");
        if(!password.equals(password1)){
            return "两次输入的密码不一致!";
        }
        if(!this.exist(username)){
            SysUser sysUser = new SysUser();
            sysUser.setUsername(username);
            sysUser.setEmail(map.get("email"));
            sysUser.setPassword(password);
            userDao.insert(sysUser);
            return "注册成功！";
        }
        return "用户名已存在！";
    }

    public List<SysUser> findUserByOrgId(int orgId) {
        return userDao.findUserByProperty(new String[]{"orgId"},new Object[]{orgId});
    }

    public Map<String,Object> findUserByOrgId(int start,int limit,int orgId){
        //return userDao.getUserByPage(new Page(start,limit));
        return null;
    }

    public boolean changePassword(String username,String password,String newPass) {
        SysUser sysUser = findUserByUsername(username);
        if (sysUser != null && sysUser.getPassword().equals(password)) {
            sysUser.setPassword(newPass);
            return true;
        }
        return false;
    }

    @Resource
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public BaseDao<SysUser> getBaseDao() {
        return this.userDao;
    }
}
