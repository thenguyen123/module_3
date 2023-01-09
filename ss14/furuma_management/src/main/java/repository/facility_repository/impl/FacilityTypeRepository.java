package repository.facility_repository.impl;

import model.facility.FacilityType;
import repository.DataBase;
import repository.facility_repository.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private final  String SELECT_ALL=" select* from facility_type;";
    @Override
    public List<FacilityType> findAllType() {
        List<FacilityType> facilityTypeList=new ArrayList<>();
        Connection connection= DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("facility_type_id");
                String name=resultSet.getString("facility_type_name");
                FacilityType facilityType=new FacilityType(id,name);
                facilityTypeList.add(facilityType);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return facilityTypeList;
    }
}
