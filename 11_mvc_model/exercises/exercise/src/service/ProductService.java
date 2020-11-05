package service;

import models.Product;
import repository.CrudRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements CrudRepository<Product> {
    private static Map<Integer, Product> productMap;

    static {
        productMap = new HashMap<>();
        productMap.put(1, new Product(1,"Xe ô tô", 500, "Xe xịn", "Nokia"));
        productMap.put(2, new Product(2,"Máy bay", 2000, "Xe xịn", "Nokia"));
        productMap.put(3, new Product(3,"AK-47", 300, "Xe xịn", "Nokia"));
        productMap.put(4, new Product(4,"M4A-16", 200, "Xe xịn", "Nokia"));
        productMap.put(5, new Product(5,"Xe tăng", 1500, "Xe xịn", "Nokia"));
        productMap.put(6, new Product(6,"Bom", 100, "Xe xịn", "Nokia"));
    }
    @Override
    public List<Product> printList() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void create(Product product) {
        productMap.put(product.getIdProduct(),product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public Product seeProduct(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> findProductByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (int key: productMap.keySet()) {
            if (productMap.get(key).getNameProduct().equals(name)) {
                productList.add(productMap.get(key));
            }
        }
        return productList;
    }
}
