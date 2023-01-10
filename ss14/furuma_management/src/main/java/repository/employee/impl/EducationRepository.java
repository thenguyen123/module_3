package repository.employee.impl;

import model.employee.Division;
import model.employee.Education;
import repository.DataBase;
import repository.employee.IEducationRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationRepository implements IEducationRepository {
    private  final String SELECT="select *from education_degree";
    @Override
    public List<Education> findAll() {
        List<Education> list=new ArrayList<>();
        Connection connection= DataBase.getConnectDB();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("education_degree_id");
                String name=resultSet.getString("name_education_degree");
                Education education=new Education(id,name);
                list.add(education);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }return list;

    }

}
