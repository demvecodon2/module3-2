package bai_tap11.controller;

import bai_tap11.model.Book;
import bai_tap11.service.BookService;
import bai_tap11.service.IBookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/book")
public class BookController extends HttpServlet {
    private final IBookService bookService = new BookService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(req, resp);
                    break;
                case "delete":
                    deleteBook(req, resp);
                    break;
                case "update":
                    showEditForm(req, resp);
                    break;
                case "view":
                    viewBook(req, resp);
                    break;
                case "edit":
                    showEditForm(req, resp);
                    break;
                default:
                    showList(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/createBook.jsp").forward(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Book> books = bookService.findAll();
        req.setAttribute("books", books);
        req.getRequestDispatcher("/views/bookList.jsp").forward(req, resp);
    }

    private void viewBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Book book = bookService.getById(id);
        req.setAttribute("book", book);
        req.getRequestDispatcher("/views/viewBook.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Book book = bookService.getById(id);
        req.setAttribute("book", book);
        req.getRequestDispatcher("/views/editBook.jsp").forward(req, resp);
    }

    private void deleteBook(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        bookService.remove(id);
        resp.sendRedirect(req.getContextPath() + "/book");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createBook(req, resp);
                    break;
                case "update":
                    updateBook(req, resp);
                    break;
                case "search":
                    searchBook(req, resp);
                    break;
                default:
                    showList(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void searchBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        List<Book> searchResult = bookService.search(title);
        System.out.println(searchResult);
        req.setAttribute("books", searchResult);
        req.getRequestDispatcher("/views/bookList.jsp").forward(req, resp);
    }

    private void createBook(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));
        String author = req.getParameter("author");
        String category = req.getParameter("category");
        String image = req.getParameter("image");

        Book newBook = new Book(id, title, pageSize, author, category, image);
        bookService.add(newBook);
        resp.sendRedirect(req.getContextPath() + "/book");
    }

    private void updateBook(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));
        String author = req.getParameter("author");
        String category = req.getParameter("category");
        String image = req.getParameter("image");

        Book updatedBook = new Book(id, title, pageSize, author, category, image);
        bookService.update(updatedBook);
        resp.sendRedirect(req.getContextPath() + "/book");
    }


}
