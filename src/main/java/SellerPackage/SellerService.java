package SellerPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SellerService {

    // Add new seller to database
    @SuppressWarnings("unused")
	public void addSeller(SellerModel seller) throws SQLException {
        String sql = "INSERT INTO sellers (name, email, phone, status, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)";
        Timestamp now = new Timestamp(System.currentTimeMillis());

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            if (conn == null) throw new SQLException("DB Connection failed");

            ps.setString(1, seller.getName());
            ps.setString(2, seller.getEmail());
            ps.setString(3, seller.getPhone());
            ps.setString(4, seller.getStatus());
            ps.setTimestamp(5, now);
            ps.setTimestamp(6, now);

            ps.executeUpdate();
        }
    }

    // Retrieve all sellers from database
    @SuppressWarnings("unused")
	public List<SellerModel> getAllSellers() throws SQLException {
        List<SellerModel> sellers = new ArrayList<>();
        String sql = "SELECT * FROM sellers";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (conn == null) throw new SQLException("DB Connection failed");

            while (rs.next()) {
                sellers.add(new SellerModel(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("status"),
                        rs.getTimestamp("created_at"),
                        rs.getTimestamp("updated_at")
                ));
            }
        }
        return sellers;
    }

    // Get seller by ID
    @SuppressWarnings("unused")
	public SellerModel getSellerById(int id) throws SQLException {
        SellerModel seller = null;
        String sql = "SELECT * FROM sellers WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) throw new SQLException("DB Connection failed");

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    seller = new SellerModel(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("email"),
                            rs.getString("phone"),
                            rs.getString("status"),
                            rs.getTimestamp("created_at"),
                            rs.getTimestamp("updated_at")
                    );
                }
            }
        }
        return seller;
    }

    // Update seller info
    @SuppressWarnings("unused")
	public void updateSeller(SellerModel seller) throws SQLException {
        String sql = "UPDATE sellers SET name = ?, email = ?, phone = ?, status = ?, updated_at = ? WHERE id = ?";
        Timestamp now = new Timestamp(System.currentTimeMillis());

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) throw new SQLException("DB Connection failed");

            ps.setString(1, seller.getName());
            ps.setString(2, seller.getEmail());
            ps.setString(3, seller.getPhone());
            ps.setString(4, seller.getStatus());
            ps.setTimestamp(5, now);
            ps.setInt(6, seller.getId());

            ps.executeUpdate();
        }
    }

    // Delete seller by ID
    @SuppressWarnings("unused")
	public void deleteSeller(int id) throws SQLException {
        String sql = "DELETE FROM sellers WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            if (conn == null) throw new SQLException("DB Connection failed");

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
