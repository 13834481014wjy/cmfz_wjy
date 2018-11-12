package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
      @Autowired
      private BannerDao bannerDao;

    @Override
    public void removeAll(String[] ids) {
        bannerDao.deleteAll(ids);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Banner findOneBanner(String id) {
        Banner banner = bannerDao.queryOne(id);
        return banner;
    }

    @Override
    public void addBanner(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        bannerDao.insert(banner);
    }
    @Override
    public void modifyBanner(Banner banner) {
        bannerDao.update(banner);
    }



    @Override
    public void removeBanner(String id) {
        bannerDao.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return bannerDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        return bannerDao.queryTotals();
    }
}
