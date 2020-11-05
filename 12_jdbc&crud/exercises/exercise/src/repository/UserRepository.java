package repository;

import model.User;

import java.util.List;

public interface UserRepository {
    List<User> printListUser();

    User findUserById(int id);

    void createNewUser(User user);

    void updateUser(int id, User user);

    void deleteUser(int id);

    List<User> findUserByCountry(String country);

    List<User> sortListUserByName();
}
