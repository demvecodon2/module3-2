package repository;

import model.HoaDon;
import model.KhachHang;

import java.util.*;

public class KhachHangRepository implements IKhachHangRepository {
    private List<KhachHang> khachHangs;
    private List<HoaDon> donHangs;

    public KhachHangRepository() {
        this.khachHangs = new ArrayList<>();
        this.donHangs = new ArrayList<>();
        khachHangs.add(new KhachHang("1", "Nguyễn Văn A", "nguyenvana@example.com", true, true, 3));
        khachHangs.add(new KhachHang("2", "Trần Thị B", "tranthib@example.com", true, true, 2));
        khachHangs.add(new KhachHang("3", "Lê Văn C", "levanc@example.com", false, true, 4));
        khachHangs.add(new KhachHang("4", "Phạm Văn D", "phamvand@example.com", false, false, 0));
        khachHangs.add(new KhachHang("5", "Nguyễn Thị E", "nguyenthie@example.com", true, false, 0));
        khachHangs.add(new KhachHang("6", "Nguyễn Văn F", "nguyenvanf@example.com", false, true, 3));
        donHangs.add(new HoaDon("1", new Date(), 150.0, khachHangs.get(0)));
        donHangs.add(new HoaDon("2", new Date(), 200.0, khachHangs.get(1)));
        donHangs.add(new HoaDon("3", new Date(), 300.0, khachHangs.get(2)));
        donHangs.add(new HoaDon("4", new Date(), 100.0, khachHangs.get(5)));
        donHangs.add(new HoaDon("5", new Date(), 250.0, khachHangs.get(3)));
        donHangs.add(new HoaDon("6", new Date(), 180.0, khachHangs.get(2)));
    }

    @Override
    public List<KhachHang> findAll() {
        return khachHangs;
    }

    @Override
    public void deleteById(String id) {
        khachHangs.removeIf(kh -> kh.getId().equals(id));
    }

    @Override
    public List<KhachHang> findTopPurchasingCustomers() {
        Map<KhachHang, Integer> purchaseCountMap = new HashMap<>();

        for (HoaDon donHang : donHangs) {
            KhachHang kh = donHang.getKhachHang();
            purchaseCountMap.put(kh, purchaseCountMap.getOrDefault(kh, 0) + 1);
        }

        for (KhachHang kh : khachHangs) {
            System.out.println("ID: " + kh.getId() + ", Purchases: " + purchaseCountMap.getOrDefault(kh, 0));
        }

        List<KhachHang> topCustomers = new ArrayList<>();
        int maxPurchases = 0;

        for (Integer purchaseCount : purchaseCountMap.values()) {
            if (purchaseCount > maxPurchases) {
                maxPurchases = purchaseCount;
            }
        }

        for (Map.Entry<KhachHang, Integer> entry : purchaseCountMap.entrySet()) {
            if (entry.getValue() == maxPurchases) {
                topCustomers.add(entry.getKey());
            }
        }

        if (topCustomers.isEmpty()) {
            System.out.println("No customers found with purchases.");
        } else {
            System.out.println("Top Purchasing Customers:");
            for (KhachHang kh : topCustomers) {
                System.out.println("ID: " + kh.getId() + ", Purchases: " + maxPurchases);
            }
        }

        return topCustomers;
    }



    @Override
    public List<KhachHang> findPurchasedCustomers() {
        List<KhachHang> purchasedCustomers = new ArrayList<>();
        for (KhachHang kh : khachHangs) {
            if (kh.isDaMua()) {
                purchasedCustomers.add(kh);
            }
        }
        return purchasedCustomers;
    }
}
