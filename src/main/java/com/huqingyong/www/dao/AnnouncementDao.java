package com.huqingyong.www.dao;

import com.huqingyong.www.po.Announcement;

public interface AnnouncementDao {
    //对公告的改
     void update(String context);
    //查看公告
    String  queryContext();
}
