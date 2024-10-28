package bai_tap11.repository;

import bai_tap11.model.Book;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BookRepository implements IBookRepository {
    private List<Book> bookList;

    public BookRepository() {
        bookList = new ArrayList<>();
        bookList.add(new Book(1, "The Lord of the Rings", 1234, "J.R.R. Tolkien", "Fantasy"));
        bookList.add(new Book(2, "Harry Potter and the Sorcerer's Stone", 345, "J.K. Rowling", "Fantasy"));
        bookList.add(new Book(3, "The Da Vinci Code", 567, "Dan Brown", "Mystery"));
    }

    @Override
    public void add(Book book) {
        bookList.add(book);
    }

    @Override
    public Book getById(int id) {
        for (Book book : bookList) {
            if (book.getId() == id) {
                return book;
            }
        }
        return null;
    }

    @Override
    public void update(Book book) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId() == book.getId()) {
                bookList.set(i, book);
                return;
            }
        }
    }

    @Override
    public void remove(int id) {
        bookList.removeIf(book -> book.getId() == id);
    }

    @Override
    public List<Book> findAll() {
        return new ArrayList<>(bookList);
    }

    public List<Book> findByTitle(String title) {
        List<Book> result = new ArrayList<>();
        for (Book book : bookList) {
            if (book.getTitle().equalsIgnoreCase(title)) {
                result.add(book);
            }
        }
        return result;
    }
}