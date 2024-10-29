package bai_tap11.repository;

import bai_tap11.model.Book;

import java.util.List;

public interface IBookRepository {
    void add(Book book);

    Book getById(int id);

    void update(Book book);

    void remove(int id);

    List<Book> search(String title);

    List<Book> findAll();


}


