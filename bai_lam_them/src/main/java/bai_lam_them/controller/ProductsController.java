package bai_lam_them.controller;

import bai_lam_them.model.Products;
import bai_lam_them.service.ProductsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class ProductsController extends HttpServlet {

    private ProductsService productsService = new ProductsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, IOException {
        String action = req.getParameter("action");

        switch (action != null ? action : "") {
            case "list":
                List<Products> productsList = productsService.findAllProducts();
                req.setAttribute("productsList", productsList);
                req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
                break;

            case "edit":
                String productId = req.getParameter("id");
                if (productId != null) {
                    int id = Integer.parseInt(productId);
                    Products product = productsService.findById(id);
                    req.setAttribute("product", product);
                    req.getRequestDispatcher("/views/edit.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect(req.getContextPath() + "/home?action=list");
                }
                break;

            case "search":
                String keyword = req.getParameter("keyword");
                List<Products> searchResults = productsService.searchProducts(keyword);
                req.setAttribute("productsList", searchResults);
                req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
                break;

            default:
                productsList = productsService.findAllProducts();
                req.setAttribute("productsList", productsList);
                req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action != null ? action : "") {
            case "add":
                String productCode = req.getParameter("productCode");
                String name = req.getParameter("name");
                String unit = req.getParameter("unit");
                double price = Double.parseDouble(req.getParameter("price"));
                String category = req.getParameter("category");

                Products newProduct = new Products(0, productCode, name, unit, price, category, null);
                productsService.save(newProduct);
                resp.sendRedirect(req.getContextPath() + "/home?action=list");
                break;

            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                String updatedName = req.getParameter("name");
                String updatedUnit = req.getParameter("unit");
                double updatedPrice = Double.parseDouble(req.getParameter("price"));
                String updatedCategory = req.getParameter("category");

                Products updatedProduct = new Products(id, "", updatedName, updatedUnit, updatedPrice, updatedCategory, null);
                productsService.update(updatedProduct);
                resp.sendRedirect(req.getContextPath() + "/home?action=list");
                break;

            case "delete":
                try {
                    // Kiểm tra ID có hợp lệ và tồn tại không
                    String deleteIdParam = req.getParameter("id");
                    if (deleteIdParam != null) {
                        int deleteId = Integer.parseInt(deleteIdParam);
                        Products productToDelete = productsService.findById(deleteId);

                        if (productToDelete != null) {
                            // Tiến hành xóa sản phẩm
//                            productsService.delete(productToDelete.getId());
                            resp.sendRedirect(req.getContextPath() + "/home?action=list");
                        } else {
                            // Sản phẩm không tồn tại
                            req.setAttribute("errorMessage", "Sản phẩm không tồn tại.");
                            req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
                        }
                    } else {
                        // Không có ID trong request
                        req.setAttribute("errorMessage", "ID sản phẩm không hợp lệ.");
                        req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
                    }
                } catch (NumberFormatException e) {
                    // Xử lý trường hợp ID không phải là số hợp lệ
                    req.setAttribute("errorMessage", "ID sản phẩm không hợp lệ.");
                    req.getRequestDispatcher("/views/list.jsp").forward(req, resp);
                }
                break;

            default:
                resp.sendRedirect(req.getContextPath() + "/home?action=list");
                break;
        }
    }
}
