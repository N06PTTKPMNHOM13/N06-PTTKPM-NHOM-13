package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection conn;

    public static Connection getConn() {
        try {
//            Class.forName("com.sqlserver.cj.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:sqlserver://TUNDZNHATFPT\\CarSell:53042/CarSell",
//                     "root", "password");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost\\TUNDZNHATFPT:1433;databaseName=CarSell", "sa", "123456");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
