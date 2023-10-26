package repository.impl;

import model.HocSinh;
import repository.DataBase;
import repository.IHocSinh;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class HocSinhRepository implements IHocSinh {
    private final   String  SELECT="select *from hoc_sinh;";
    @Override
    public List<HocSinh> findAll() {
        List<HocSinh> list=new ArrayList<>();
     Connection connection= DataBase.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT);
            ResultSet resultSet=preparedStatement.executeQuery();
        while (resultSet.next());
        int ma=resultSet.getInt("ma_hoc_sinh");
        String hoTen=resultSet.getString("ho_ten");
        String lop=resultSet.getString("lop");
        HocSinh hocSinh=new HocSinh(ma,hoTen,lop);
        list.add(hocSinh);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }
}
