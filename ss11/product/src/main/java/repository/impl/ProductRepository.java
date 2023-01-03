package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
  private  static Map<Integer,Product> productMap;
  static   {
      productMap=new HashMap<>();
productMap.put(1,new Product(1,"car",1500000,"beautiful"));
productMap.put(2,new Product(2,"moto",1000000,"cool"));
productMap.put(3,new Product(3,"bicycle",100000,"good"));
productMap.put(4,new Product(4,"ship",2500000,"luxury"));

    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public void save(Product product) {
         productMap.put(product.getId(),product);
    }

    @Override
    public void delete(int id) {
         productMap.remove(id);
    }

    @Override
    public void update(int id,Product product) {
        productMap.put(id,product);
    }


}

