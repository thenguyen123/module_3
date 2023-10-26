package repository.impl;

import model.Sach;
import repository.DataBase;
import repository.ISachRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class SachRepository implements ISachRepository {
    private final  String SELECT=   "select *from sach";
    private final  String FIND_ID=   "  select * from sach where ma_sach = ?;";
    @Override
    public List<Sach> finAll() {

            Connection connection= DataBase.getConnectDB();
            List<Sach> list=new ArrayList<>();
            try{
                PreparedStatement preparedStatement=connection.prepareStatement(SELECT);
                ResultSet resultSet=preparedStatement.executeQuery();
                while (resultSet.next()){
                    int ma=resultSet.getInt("ma_sach");
                    String tenSach=resultSet.getString("ten_sach");
                    String tacGia=resultSet.getString("tac_gia");
                    String moTa=resultSet.getString("mo_ta");
                    int soLuong=resultSet.getInt("so_luong");
                    Sach sach=new Sach(ma,tenSach,tacGia,moTa,soLuong);
                    list.add(sach);

                }
            }catch (SQLException e) {
                e.printStackTrace();
            }
            return list;
        }

    @Override
    public Sach findByID(int id) {
        Connection connection= DataBase.getConnectDB();
       Sach sach=new Sach();
        try{
            PreparedStatement preparedStatement=connection.prepareStatement(FIND_ID);
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int ma=resultSet.getInt("ma_sach");
                String tenSach=resultSet.getString("ten_sach");
                String tacGia=resultSet.getString("tac_gia");
                String moTa=resultSet.getString("mo_ta");
                int soLuong=resultSet.getInt("so_luong");
              sach=new Sach(ma,tenSach,tacGia,moTa,soLuong);

            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return sach;

    }

}



