package res;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Data {
    private static Database db;

    static {
        db = new Database();
    }

    public static List<WinApi> getWinApis() throws SQLException {
        List<WinApi> winapis = new ArrayList<WinApi>();
        try {
            ResultSet rs = db.getResultSet("select * from winapi");
            while (rs.next()) {
                WinApi winapi = new WinApi(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6));
                winapis.add(winapi);
            }
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return winapis;
    }

    public static WinApi getWinApi(String id) throws SQLException {
        WinApi error = null;
        try {
            ResultSet rs = db.getResultSet("select * from winapi where id='" + id + "'");
            while (rs.next()) {
                return new WinApi(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6));
            }
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return error;
    }

    public static void addWinApi(WinApi winapi) throws SQLException {
        try {
            db.update("INSERT INTO winapi (nameAndParameters,procedureOrFunction," +
                    "parameterTypes,returnType,act) VALUES('" + winapi.getNameAndParameters()
                    + "','" + winapi.getProcedureOrFunction() + "','" + winapi.getParameterTypes() +
                    "','" + winapi.getReturnType() + "','"
                    + winapi.getAct() + "')");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void editWinApi(WinApi winapi, String id) throws SQLException {
        try {
            db.update("UPDATE winapi SET nameAndParameters='" + winapi.getNameAndParameters() + "',procedureOrFunction='"
                    + winapi.getProcedureOrFunction() + "',parameterTypes='" + winapi.getParameterTypes() +
                    "',returnType='" + winapi.getReturnType()
                    + "',act='" + winapi.getAct() + "' WHERE id='" + id + "'");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static void delete(String id) throws SQLException {
        try {
            db.update("DELETE FROM winapi WHERE id='" + id + "'");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
