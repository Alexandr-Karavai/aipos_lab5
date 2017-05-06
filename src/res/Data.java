package res;

import org.apache.log4j.Logger;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author karavai
 */



public class Data {

    final static Logger logger = Logger.getLogger(Data.class);

    private static Database db;

    static {
        db = new Database();
    }

    /**
     * Возвращает информацию о всех записях (функциях WInAPI).
     * @return winapis - массив в котором содержатся все записи из таблицы
     * @throws SQLException
     */

    public static List<WinApi> getWinApis() throws SQLException {
        List<WinApi> winapis = new ArrayList<WinApi>();
        try {
            ResultSet rs = db.getResultSet("select * from winapi");
            while (rs.next()) {
                WinApi winapi = new WinApi(rs.getString(1), rs.getString(2), rs.getString(3));
                winapis.add(winapi);
            }
            logger.info("Successful getting info about WinAPI");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Error select from winapi : ", e);
        }
        return winapis;
    }

    /**
     * Возвращает информацию о записи (функции WInAPI) по id элемента.
     * @param id - уникальный номер записи (функции WinAPI)
     * @return возвращает новый экземпляр класса WinApi
     * @throws SQLException
     */

    public static WinApi getWinApi(String id) throws SQLException {
        WinApi error = null;
        try {
            ResultSet rs = db.getResultSet("select * from winapi where id='" + id + "'");
            while (rs.next()) {
                return new WinApi(rs.getString(1), rs.getString(2), rs.getString(3));
            }
            logger.info("Getting information about WinAPI by id");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Error getting id : ", e);
        }
        return error;
    }

    /**
     * SQL запрос на добавление записи о новой функции в таблицу
     * @param winapi
     * @throws SQLException
     */

    public static void addWinApi(WinApi winapi) throws SQLException {
        try {
            db.update("INSERT INTO winapi (nameAndParameters,act) VALUES('" + winapi.getNameAndParameters()
                    + "','" + winapi.getAct() + "')");
            logger.info("Addition new info");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Error adding : ", e);
        }
    }

    /**
     * SQL запрос на изменение информации о введенной функции.
     * Изменения происходят по id элемента.
     * @param winapi
     * @param id - уникальный номер записи (функции WinAPI)
     * @throws SQLException
     */

    public static void editWinApi(WinApi winapi, String id) throws SQLException {
        try {
            db.update("UPDATE winapi SET nameAndParameters='" + winapi.getNameAndParameters() + "',act='" + winapi.getAct() + "' WHERE id='" + id + "'");
            logger.info("Successful edition");
        } catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
            logger.error("Change error : ", e);
        }
    }

    /**
     * SQL запрос на удаление записи из таблицы.
     * Удаление происходит по id элемента.
     * @param id - уникальный номер записи (функции WinAPI)
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
