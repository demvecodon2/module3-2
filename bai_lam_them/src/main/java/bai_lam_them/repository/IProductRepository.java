package bai_lam_them.repository;

import bai_lam_them.model.Products;

import java.util.List;

// IProductRepository.java
import java.util.List;

public interface IProductRepository {
    List<Products> findAllProducts();
    Products findById(int id);
    void save(Products product);
    void delete(int id);
    List<Products> searchProducts(String keyword);
}
