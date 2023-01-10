package service.employee.impl;

import model.employee.Division;
import repository.employee.impl.DivisionRepository;
import service.employee.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    DivisionRepository divisionRepository=new DivisionRepository();
    @Override
    public List<Division> findAll() {
        return divisionRepository.findAll();
    }
}
