package service.employee.impl;

import model.employee.Education;
import repository.employee.impl.EducationRepository;
import service.employee.IEducationService;

import java.util.List;

public class EducationService implements IEducationService {
    EducationRepository educationRepository=new EducationRepository();
    @Override
    public List<Education> findAll() {
        return educationRepository.findAll();
    }
}
