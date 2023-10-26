package service.impl;

import model.HocSinh;
import repository.impl.HocSinhRepository;
import service.IHocSinhService;

import java.util.List;

public class HocSinhService implements IHocSinhService {
    HocSinhRepository hocSinhRepository=new HocSinhRepository();
    @Override
    public List<HocSinh> findAll() {
        return hocSinhRepository.findAll();
    }
}
