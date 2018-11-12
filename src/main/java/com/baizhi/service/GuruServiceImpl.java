package com.baizhi.service;

import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Guru;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceImpl implements GuruService {

    @Autowired
    private GuruDao guruDao;

    @Override
    public void addGuru(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDao.insert(guru);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Guru findOneGuru(String id) {
        return guruDao.queryOne(id);
    }

    @Override
    public void removeAll(String[] ids) {
        guruDao.deleteAll(ids);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAllGuruName() {
        List<Guru> gurus = guruDao.queryAll();
        return gurus;
    }

    @Override
    public void removeGuru(String id) {
        guruDao.delete(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAllGuru(Integer page, Integer rows) {
        int start=(page-1)*rows;
        return guruDao.queryByPage(start,rows);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        return guruDao.queryTotals();
    }
}
