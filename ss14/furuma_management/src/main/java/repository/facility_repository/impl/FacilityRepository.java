package repository.facility_repository.impl;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.DataBase;
import repository.facility_repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_All = "select f.*,rt.rent_type_name,ft.facility_type_name from facility f join rent_type rt on rt.rent_type_id=f.rent_type_id join facility_type ft on ft.facility_type_id=f.facility_type_id ";
    private final String INSERT = "insert into facility ( name_facility, area, cost, max_people, standard_rom, description_other_convenience, pool_area, number_of_floors, facility_free, rent_type_id, facility_type_id) values (?,?,?,?,?,?,?,?,?,?,?)";
    private final String DELETE = "delete from facility where facility_id=?";
    private final String FIND_NAME = "select f.*,rt.rent_type_name,ft.facility_type_name from facility f join rent_type rt on rt.rent_type_id=f.rent_type_id join facility_type ft on ft.facility_type_id=f.facility_type_id where name_facility like ?";
private  final String UPDATE=" update facility set  name_facility=?, area=?, cost=?, max_people=?, standard_rom=?, description_other_convenience=?, pool_area=?, number_of_floors=?, facility_free=?, rent_type_id=?, facility_type_id=? where facility_id=? ";
private  final String FINDBYID="select f.*,rt.rent_type_name,ft.facility_type_name from facility f join rent_type rt on rt.rent_type_id=f.rent_type_id join facility_type ft on ft.facility_type_id=f.facility_type_id where facility_id=? ";
    @Override
    public List<Facility> findAdd() {
        List<Facility> list = new ArrayList<>();
        Connection connection = DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_All);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("facility_id");
                String name = resultSet.getString("name_facility");
                int are = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_rom");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentTypeId = resultSet.getInt("rent_type_id");
                String nameTypeId = resultSet.getString("rent_type_name");
                int facilityId = resultSet.getInt("facility_type_id");
                String facilityTypeName = resultSet.getString("facility_type_name");
                RentType rentType = new RentType(rentTypeId, nameTypeId);
                FacilityType facilityType = new FacilityType(facilityId, facilityTypeName);
                Facility facility = new Facility(id, name, are, cost, maxPeople, standardRoom,
                        descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree, rentType, facilityType);
                list.add(facility);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean save(Facility facility) {
        Connection connection = DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);

            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentType().getId());
            preparedStatement.setInt(11, facility.getFacilityType().getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Facility facility) {
        Connection connection = DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);

            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setInt(8, facility.getNumberOfFloors());
            preparedStatement.setString(9, facility.getFacilityFree());
            preparedStatement.setInt(10, facility.getRentType().getId());
            preparedStatement.setInt(11, facility.getFacilityType().getId());
            preparedStatement.setInt(12,facility.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Facility> find(String name) {
        List<Facility> list=new ArrayList<>();
        Connection connection=DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(FIND_NAME);
            preparedStatement.setString(1,"%"+name+"%");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("facility_id");
                String namenew = resultSet.getString("name_facility");
                int are = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_rom");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentTypeId = resultSet.getInt("rent_type_id");
                String nameTypeId = resultSet.getString("rent_type_name");
                int facilityId = resultSet.getInt("facility_type_id");
                String facilityTypeName = resultSet.getString("facility_type_name");
                RentType rentType = new RentType(rentTypeId, nameTypeId);
                FacilityType facilityType = new FacilityType(facilityId, facilityTypeName);
                Facility facility = new Facility(id, namenew, are, cost, maxPeople, standardRoom,
                        descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree, rentType, facilityType);
                list.add(facility);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Facility findByID(int id) {
        Connection connection=DataBase.getConnectDB();
        Facility facility = null;
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(FINDBYID);
          preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String namenew = resultSet.getString("name_facility");
                int are = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                String standardRoom = resultSet.getString("standard_rom");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                int rentTypeId = resultSet.getInt("rent_type_id");
                String nameTypeId = resultSet.getString("rent_type_name");
                int facilityId = resultSet.getInt("facility_type_id");
                String facilityTypeName = resultSet.getString("facility_type_name");
                RentType rentType = new RentType(rentTypeId, nameTypeId);
                FacilityType facilityType = new FacilityType(facilityId, facilityTypeName);
                facility = new Facility(id, namenew, are, cost, maxPeople, standardRoom,
                        descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree, rentType, facilityType);

            }

    }catch (SQLException e) {
            e.printStackTrace();

        }return facility;
    }
}
