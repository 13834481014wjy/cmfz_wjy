package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService {
    void addBanner(Banner banner);
    List<Banner> findByPage(Integer page, Integer rows);
    Long findTotals();
    void removeBanner(String id);
    void modifyBanner(Banner banner);
    Banner findOneBanner(String id);
    void removeAll(String[] ids);

}
