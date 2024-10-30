package bai_tap11.repository;

import bai_tap11.model.Book;
import org.apache.taglibs.standard.tag.common.core.ForEachSupport;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {

    @Override
    public void add(Book book) {
        String query = "INSERT INTO book (title, pageSize, author, category, image) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, book.getTitle());
            statement.setInt(2, book.getPageSize());
            statement.setString(3, book.getAuthor());
            statement.setString(4, book.getCategory());
            statement.setString(5, book.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error executing SQL: " + e.getMessage());
            e.printStackTrace();
        }
    }


    @Override
    public Book getById(int id) {
        String query = "SELECT * FROM book WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Book(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getInt("pageSize"),
                        resultSet.getString("author"),
                        resultSet.getString("category"),
                        resultSet.getString("image")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(Book book) {
        String query = "UPDATE book SET title = ?, pageSize = ?, author = ?, category = ?, image = ? WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, book.getTitle());
            statement.setInt(2, book.getPageSize());
            statement.setString(3, book.getAuthor());
            statement.setString(4, book.getCategory());
            statement.setString(5, book.getImage());
            statement.setInt(6, book.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void remove(int id) {
        String query = "DELETE FROM book WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Book> search(String title) {
        List<Book> searchList = new ArrayList<>();
        String query = "SELECT * FROM book WHERE title LIKE ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, "%" + title + "%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                searchList.add(new Book(
                        resultSet.getInt("id"),
                        resultSet.getString("title"),
                        resultSet.getInt("pageSize"),
                        resultSet.getString("author"),
                        resultSet.getString("category"),
                        resultSet.getString("image")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchList;
    }

    @Override
    public List<Book> findAll() {
        Connection connection = BaseRepository.getConnection();
        List<Book> books = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM book");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("pageSize");
                String author = resultSet.getString("author");
                String category = resultSet.getString("category");
                String image = resultSet.getString("image");
                Book book = new Book(id, title, pageSize, author, category, image);
                books.add(book);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return books;
    }
}
