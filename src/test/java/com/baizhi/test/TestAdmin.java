package com.baizhi.test;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Admin;
import com.baizhi.entity.Album;
import com.baizhi.entity.Banner;
import com.baizhi.entity.Guru;
import com.baizhi.service.AdminService;
import com.baizhi.service.AlbumService;
import com.baizhi.service.BannerService;
import com.baizhi.service.GuruService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class TestAdmin{

    @Autowired
    private AdminService adminService;
    @Autowired
    private BannerService bannerService;
    @Autowired
    private GuruService guruService;

    @Autowired
    private AlbumService albumService;

    @Test
    public void  test1(){
        Admin admin=new Admin();
        admin.setPassword("ff");
        admin.setUsername("gfg");
        Admin admin1 = adminService.findByUsernameAndPwd(admin);
        if(admin1!=null){
            System.out.println(admin1);
        }else{
            System.out.println("555");
        }

    }

    @Test
    public void test2(){
        Admin admin=new Admin();
        admin.setId("1");
        admin.setPassword("111");
        adminService.motify(admin);
    }

    @Test
    public void test3(){
        List<Banner> byPage = bannerService.findByPage(1,2);
        for (Banner banner : byPage) {
            System.out.println(banner);
        }


    }

    @Test
    public void test4(){
        Banner oneBanner = bannerService.findOneBanner("1");
        System.out.println(oneBanner);
    }

    @Test
    public void test5(){
        List<Guru> allGuru = guruService.findAllGuru(1, 2);
        for (Guru guru : allGuru) {
            System.out.println(guru);
        }
    }
    @Test
    public void test6(){
        List<Album> byPage = albumService.findByPage(1, 2);
        for (Album album : byPage) {
            System.out.println(album);
        }
    }
}
