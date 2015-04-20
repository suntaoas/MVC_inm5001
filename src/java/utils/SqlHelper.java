package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SqlHelper {

    private static Connection ct = null;
    private static ResultSet rs = null;
    private static PreparedStatement ps = null;

    public ArrayList executeQuery(String sql, String[] paras) {
        ArrayList al = new ArrayList();
        try {
            ct = DBUtil.getCon();
            ps = ct.prepareStatement(sql);
            for (int i = 0; i < paras.length; i++) {
                ps.setString(i + 1, paras[i]);
            }
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnNum = rsmd.getColumnCount();
            while (rs.next()) {
                Object[] objects = new Object[columnNum];
                for (int i = 0; i < objects.length; i++) {
                    objects[i] = rs.getObject(i + 1);
                }
                al.add(objects);
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        } finally {
            DBUtil.close(rs, ps, ct);
        }

    }

    public ResultSet executeQuery(String sqlstr) {
        Statement stmt = null;
        try {
            ct = DBUtil.getCon();
            stmt = ct.createStatement();
            rs = stmt.executeQuery(sqlstr);
            return rs;
        } catch (SQLException e) {
            System.out.print("error");
        }
        return null;
    }

    public boolean executeUpdate(String sql, String[] parameters) {
        boolean res = true;
        try {
            ct = DBUtil.getCon();
            ps = ct.prepareStatement(sql);
            if (parameters != null) {
                for (int i = 0; i < parameters.length; i++) {
                    System.out.print(parameters[i]);
                    ps.setString(i + 1, parameters[i]);
                }
            }
            ps.executeUpdate();
            return res;
        } catch (Exception e) {
            System.out.print("erreur");
        } finally {
            DBUtil.close(rs, ps, ct);
        }
        return false;
    }

}
