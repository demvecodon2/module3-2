package controller;

import model.KhachHang;
import service.IKhachHangService;
import service.KhachHangService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/khach")
public class KhachHangController extends HttpServlet {
    private IKhachHangService khachHangService = new KhachHangService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "view":
                    listCustomers(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "purchased":
                    listPurchasedCustomers(request, response);
                    break;
                case "topPurchasing":
                    listTopPurchasingCustomers(request, response);
                    break;
                default:
                    listCustomers(request, response);
                    break;
            }
        } catch (Exception e) {
            handleException(request, response, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action != null) {
            try {
                switch (action) {
                    case "delete":
                        deleteCustomer(request, response);
                        break;
                    default:
                        handleInvalidAction(request, response);
                        break;
                }
            } catch (Exception e) {
                handleException(request, response, e);
            }
        } else {
            handleUndefinedAction(request, response);
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<KhachHang> customers = khachHangService.findAll();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("/views/customers.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idToDelete = request.getParameter("id");
        khachHangService.deleteById(idToDelete);
        response.sendRedirect(request.getContextPath() + "/khach?action=view");
    }

    private void listPurchasedCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<KhachHang> purchasedCustomers = khachHangService.findPurchasedCustomers();
        request.setAttribute("purchasedCustomers", purchasedCustomers);
        request.getRequestDispatcher("/views/purchasedCustomers.jsp").forward(request, response);
    }

    private void listTopPurchasingCustomers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<KhachHang> topCustomers = khachHangService.findTopPurchasingCustomers();
        request.setAttribute("topCustomers", topCustomers);
        request.getRequestDispatcher("/views/topPurchasingCustomers.jsp").forward(request, response);
    }

    private void handleInvalidAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("error", "Hành động không hợp lệ.");
        request.getRequestDispatcher("/views/error.jsp").forward(request, response);
    }

    private void handleException(HttpServletRequest request, HttpServletResponse response, Exception e) throws ServletException, IOException {
        e.printStackTrace();
        request.setAttribute("error", "Đã xảy ra lỗi.");
        request.getRequestDispatcher("/views/error.jsp").forward(request, response);
    }

    private void handleUndefinedAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("error", "Hành động không xác định.");
        request.getRequestDispatcher("/views/error.jsp").forward(request, response);
    }
}
