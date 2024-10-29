package bai_tap11.repository;

import bai_tap11.model.Book;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class BookRepository implements IBookRepository {
    private List<Book> bookList;

    public BookRepository() {
        bookList = new ArrayList<>();
        bookList.add(new Book(1, "Trạng Quỳnh", 1234, "Kim Khánh", "Truyện", "https://i.pinimg.com/474x/a9/55/a6/a955a693124bf71ddb0ed3019ef7a98e.jpg"));
        bookList.add(new Book(2, "Doraemon", 345, "Fujiko Fujio", "Truyện", "https://i.pinimg.com/474x/e2/79/17/e27917c74df336aa60a2859b46be9dde.jpg"));
        bookList.add(new Book(3, "Bảy Viên Ngọc Rồng", 567, "Toriyama Akira", "Truyện", "https://i.pinimg.com/236x/4c/0c/3f/4c0c3f520b6133985cf08ec6c411fb92.jpg"));
        bookList.add(new Book(4, "Truyện Dân Gian Việt Nam", 890, "Sưu Tầm", "Hư Cấu", "https://i.pinimg.com/474x/f6/71/66/f671666b43a759e3579875cd7ad7a5eb.jpg"));
    }

    @Override
    public void add(Book book) {
        bookList.add(book);
    }

    @Override
    public Book getById(int id) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId() == id) {
                return bookList.get(i);
            }
        }
        return null;
    }

//    @Override
//    public Book getById(int id) {
//        return bookList.stream()
//                .filter(book -> book.getId() == id)
//                .findFirst()
//                .orElse(null);
//    }

    //    @Override
//    public void update(Book book) {
//        bookList = bookList.stream().collect(Collectors.toList());
//
//    }
//
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
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId() == id) {
                bookList.remove(i);
                return;
            }
        }
    }

//    @Override
//    public List<Book> search(String title) {
//        return bookList.stream().filter(book -> book.getTitle().toLowerCase().contains(title.toLowerCase())).collect(Collectors.toList());
//    }

    @Override
    public List<Book> search(String title) {
        List<Book> searchList = new ArrayList<>();
        for (Book book : bookList) {
            if (book.getTitle().toLowerCase().contains(title.toLowerCase())) {
                searchList.add(book);
            }
        }
        return searchList;
    }

    @Override
    public List<Book> findAll() {
        return new ArrayList<>(bookList);
    }

}
