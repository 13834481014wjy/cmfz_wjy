package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.entity.Article;
import com.baizhi.entity.Banner;
import com.baizhi.service.ArticleService;
import com.baizhi.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/article")
public class ArticleController {


    @Autowired
    private ArticleService articleService;

    @RequestMapping("/findAll")
    public @ResponseBody Map<String,Object> queryAll(Integer page, Integer rows){
        Map<String,Object> results=new HashMap<String,Object>();
        //当前数据rows
        List<Article> articles = articleService.findByPage(page, rows);
        //总记录数
        Long totals = articleService.findTotals();
        results.put("total",totals);
        results.put("rows",articles);
        return results;
    }

    @RequestMapping("/insert")
    public @ResponseBody Map<String,Object> insert(Article article, MultipartFile multipartFile, HttpServletRequest request){
        Map<String,Object> results = new HashMap<String,Object>();
        try {
            //上传
            String file = FileUtil.saveFile(multipartFile, "/picture/article/", request);
            article.setImgPath(file);

            articleService.addArticle(article);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            results.put("message",e.getMessage());
        }
        return results;
    }

}
