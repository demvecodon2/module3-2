package bai_lam_them.repository;

import bai_lam_them.model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// ProductRepository.java
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    @Override
    public List<Products> findAllProducts() {
        List<Products> productsList = new ArrayList<>();
        String query = "SELECT * FROM products";
        try (Connection connection = BaseRepository.getConnectDB();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Products product = new Products(
                        resultSet.getInt("id"),
                        resultSet.getString("product_code"),
                        resultSet.getString("name"),
                        resultSet.getString("unit"),
                        resultSet.getInt("price"),
                        resultSet.getString("category"),
                        resultSet.getTimestamp("created_at")
                );
                productsList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }

    @Override
    public Products findById(int id) {
        Products product = null;
        String query = "SELECT * FROM products WHERE id = ?";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                product = new Products(
                        resultSet.getInt("id"),
                        resultSet.getString("product_code"),
                        resultSet.getString("name"),
                        resultSet.getString("unit"),
                        resultSet.getInt("price"),
                        resultSet.getString("category"),
                        resultSet.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void save(Products product) {
        String query = "INSERT INTO products (product_code, name, unit, price, category) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, product.getProductCode());
            statement.setString(2, product.getName());
            statement.setString(3, product.getUnit());
            statement.setInt(4, product.getPrice());
            statement.setString(5, product.getCategory());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String query = "DELETE FROM products WHERE id = ?";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Products> searchProducts(String keyword) {
        List<Products> productsList = new ArrayList<>();
        String query = "SELECT * FROM products WHERE name LIKE ? OR product_code LIKE ?";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement statement = connection.prepareStatement(query)) {

            String searchPattern = "%" + keyword + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Products product = new Products(
                        resultSet.getInt("id"),
                        resultSet.getString("product_code"),
                        resultSet.getString("name"),
                        resultSet.getString("unit"),
                        resultSet.getInt("price"),
                        resultSet.getString("category"),
                        resultSet.getTimestamp("created_at")
                );
                productsList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }
}
