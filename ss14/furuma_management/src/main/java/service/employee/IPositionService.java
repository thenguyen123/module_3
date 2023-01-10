package service.employee;

import model.employee.Education;
import model.employee.Position;

import java.util.List;

public interface IPositionService {
    List<Position> findAll();
}
