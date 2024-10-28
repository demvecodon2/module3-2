package bai_tap11.service;

import bai_tap11.model.Book;
import bai_tap11.repository.BookRepository;
import bai_tap11.repository.IBookRepository;

import java.util.Collections;
import java.util.List;

public class BookService implements IBookService {
    private final IBookRepository bookRepository = new BookRepository();


    @Override
    public void add(Book book) {
        bookRepository.add(book);
    }

    @Override
    public Book getById(int id) {
        return bookRepository.getById(id);
    }

    @Override
    public void update(Book book) {
        bookRepository.update(book);
    }

    @Override
    public void remove(int id) {
        bookRepository.remove(id);
    }

    @Override
    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    @Override
    public List<Book> findByTitle(String title) {
        return bookRepository.findByTitle(title);
    }

}
