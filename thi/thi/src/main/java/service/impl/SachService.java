package service.impl;

import model.Sach;
import repository.impl.SachRepository;
import service.ISachService;

import java.util.List;

public class SachService implements ISachService {
    SachRepository sachRepository=new SachRepository();
    @Override
    public List<Sach> findAll() {
        return sachRepository.finAll();
    }

    @Override
    public Sach findByID(int id) {
        return sachRepository.findByID(id);
    }
}
