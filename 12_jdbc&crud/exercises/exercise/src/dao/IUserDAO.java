package dao;

import model.User;

import java.util.List;

public interface IUserDAO {
    List<User> selectAllUser();

    User selectUserById(int id);

    void insertUser(User user);

    void updateUser(int id, User user);

    void deleteUser(int id);

    List<User> selectUserByCountry(String country);

    List<User> sortListUserByName();
}
