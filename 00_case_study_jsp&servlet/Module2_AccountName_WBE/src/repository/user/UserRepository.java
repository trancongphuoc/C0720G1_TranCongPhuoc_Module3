package repository.user;

import model.User;

import java.util.List;
import java.util.Map;

public interface UserRepository {
    Map<String, String> selectAllUser();
}
