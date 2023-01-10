package service.employee.impl;

import model.employee.Position;
import repository.employee.impl.PositionRepository;
import service.employee.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    PositionRepository repository=new PositionRepository();
    @Override
    public List<Position> findAll() {
        return repository.findAll();
    }
}
