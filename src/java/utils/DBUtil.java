/*
 *   C'est la classe d'outil pour connection et deconnection de BD
 */

package utils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import java.util.Properties;
 

public class DBUtil {

    private static Connection ct = null;//connection
    private static ResultSet rs = null;//resultat
    private static PreparedStatement ps = null;
    //parametres de BD
    private static String url = "";
    private static String drivername = "";
    private static String username = "";
    private static String password = "";
	
    //charger le driver de BD MySQL
    static {
        try {
            Properties properties = new Properties();
            InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("utils/dbinfo.properties");
            properties.load(is);
            //obtenir informations de BD
            drivername = properties.getProperty("driver");
            username = properties.getProperty("username");
            password = properties.getProperty("password");
            url = properties.getProperty("url");
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

//obtenir la connection de BD
    public static Connection getCon() {
        try {
            Class.forName(drivername);
            ct = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ct;
    }

    public static void main(String args[]) {

        System.out.println(drivername);
        System.out.println(username);
        System.out.println(password);
        System.out.println(url);
    }
//Deconnection de BD

    public static void close(ResultSet rs, Statement ps, Connection ct) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {

            }
            rs = null;
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ps = null;
        }

        if (ct != null) {
            try {
                ct.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            ct = null;
        }

    }

}
