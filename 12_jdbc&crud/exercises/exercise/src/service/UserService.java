package service;

import dao.IUserDAO;
import dao.UserDAO;
import model.User;
import repository.UserRepository;

import java.util.List;

public class UserService implements UserRepository {
    IUserDAO userDAO = new UserDAO();

    @Override
    public List<User> printListUser() {
        return userDAO.selectAllUser();
    }

    @Override
    public User findUserById(int id) {
        return userDAO.selectUserById(id);
    }

    @Override
    public void createNewUser(User user) {
        userDAO.insertUser(user);
    }

    @Override
    public void updateUser(int id, User user) {
        userDAO.updateUser(id, user);
    }

    @Override
    public void deleteUser(int id) {
        userDAO.deleteUser(id);
    }

    @Override
    public List<User> findUserByCountry(String country) {
        return userDAO.selectUserByCountry(country);
    }

    @Override
    public List<User> sortListUserByName() {
        return userDAO.sortListUserByName();
    }
}
