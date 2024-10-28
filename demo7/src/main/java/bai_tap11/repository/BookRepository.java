package bai_tap11.repository;

import bai_tap11.model.Book;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BookRepository implements IBookRepository {
    private List<Book> bookList;

    public BookRepository() {
        bookList = new ArrayList<>();
        bookList.add(new Book(1, " trạng quỳnh", 1234, "Kim Khánh", "truyen","https://i.pinimg.com/474x/a9/55/a6/a955a693124bf71ddb0ed3019ef7a98e.jpg"));
        bookList.add(new Book(2, "draemon", 345, "fujiko fujio", "truyen","https://i.pinimg.com/474x/e2/79/17/e27917c74df336aa60a2859b46be9dde.jpg"));
        bookList.add(new Book(3, "bảy viên ngọc rồng", 567, "Toriyama Akira ", "truyen","https://i.pinimg.com/236x/4c/0c/3f/4c0c3f520b6133985cf08ec6c411fb92.jpg"));
        bookList.add(new Book(4, "truyện dân gian việt nam", 890, "sưu tầm", "hư cấu","https://i.pinimg.com/474x/f6/71/66/f671666b43a759e3579875cd7ad7a5eb.jpg"));
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