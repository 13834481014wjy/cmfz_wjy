package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import com.baizhi.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Article> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return articleDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        return articleDao.queryTotals();
    }

    @Override
    public void addArticle(Article article) {
        article.setId(UUID.randomUUID().toString());
        articleDao.insert(article);
    }
}
