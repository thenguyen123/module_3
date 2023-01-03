package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
   IProductRepository productRepository=new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public void save( Product product) {
         productRepository.save(product);
    }

    @Override
    public void delete(int id) {
productRepository.delete(id);
    }

    @Override
    public void update(int id,Product product) {
         productRepository.update(id,product);
    }
}
