package bai_tap11.service;

import bai_tap11.model.Book;

import java.util.List;

public interface IBookService {
    void add(Book book);

    Book getById(int id);

    void update(Book book);

    void remove(int id);

    List<Book> search(String title);

    List<Book> findAll();


}
