package db.user;

import model.User;
import repository.user.UserRepository;
import repository.user.UserRepositoryImpl;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = new UserRepositoryImpl();

    @Override
    public Map<String, String> selectAllUser() {
        return userRepository.selectAllUser();
    }
}
