package res;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

class Database {
    private Connection getConnection() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Properties properties = new Properties();
        properties.setProperty("user","root");
        properties.setProperty("password","0000");
        properties.setProperty("useUnicode","true");
        properties.setProperty("characterEncoding","UTF-8");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/win_api", properties);
    }

    ResultSet getResultSet(String sql)
            throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
        Connection conn = getConnection();
        Statement st = conn.createStatement();
        return st.executeQuery(sql);
    }

    void update(String sql)
            throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
        Connection conn = getConnection();
        Statement st = conn.createStatement();
        st.executeUpdate(sql);
    }
}