package repository.employee;

import model.employee.Education;

import java.util.List;

public interface IEducationRepository {
    List<Education> findAll();
}
