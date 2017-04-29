package res;

import org.apache.log4j.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author karavai
 */



public class Data {

    final static Logger logger = Logger.getLogger(Data.class);

    private static Database db;

    static {
        db = new Database();
    }

    /**
     *
     * @return
     * @throws SQLException
     */

    public static List<WinApi> getWinApis() throws SQLException {
        List<WinApi> winapis = new ArrayList<WinApi>();
        try {
            ResultSet rs = db.getResultSet("select * from winapi");
            while (rs.next()) {
                WinApi winapi = new WinApi(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6));
                winapis.add(winapi);
            }
            logger.info("Successful getting info about WinAPI");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Error select from winapi : ", e);
        }
        return winapis;
    }

    /**
     *
     * @param id
     * @return
     * @throws SQLException
     */

    public static WinApi getWinApi(String id) throws SQLException {
        WinApi error = null;
        try {
            ResultSet rs = db.getResultSet("select * from winapi where id='" + id + "'");
            while (rs.next()) {
                return new WinApi(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6));
            }
            logger.info("Getting information about WinAPI by id");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Error getting id : ", e);
        }
        return error;
    }

    /**
     *
     * @param winapi
     * @throws SQLException
     */

    public static void addWinApi(WinApi winapi) throws SQLException {
        try {
            db.update("INSERT INTO winapi (nameAndParameters,procedureOrFunction," +
                    "parameterTypes,returnType,act) VALUES('" + winapi.getNameAndParameters()
                    + "','" + winapi.getProcedureOrFunction() + "','" + winapi.getParameterTypes() +
                    "','" + winapi.getReturnType() + "','"
                    + winapi.getAct() + "')");
            logger.info("Addition new info");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Error adding : ", e);
        }
    }

    /**
     *
     * @param winapi
     * @param id
     * @throws SQLException
     */

    public static void editWinApi(WinApi winapi, String id) throws SQLException {
        try {
            db.update("UPDATE winapi SET nameAndParameters='" + winapi.getNameAndParameters() + "',procedureOrFunction='"
                    + winapi.getProcedureOrFunction() + "',parameterTypes='" + winapi.getParameterTypes() +
                    "',returnType='" + winapi.getReturnType()
                    + "',act='" + winapi.getAct() + "' WHERE id='" + id + "'");
            logger.info("Successful edition");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Change error : ", e);
        }
    }

    /**
     *
     * @param id
     * @throws SQLException
     */

    public static void delete(String id) throws SQLException {
        try {
            db.update("DELETE FROM winapi WHERE id='" + id + "'");
            logger.info("Successful removal");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Delete error : ", e);
        }
    }

}
