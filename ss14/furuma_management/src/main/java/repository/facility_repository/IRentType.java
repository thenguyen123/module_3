package repository.facility_repository;

import model.facility.RentType;

import java.util.List;

public interface IRentType {
    List<RentType> findAllRent();
}
