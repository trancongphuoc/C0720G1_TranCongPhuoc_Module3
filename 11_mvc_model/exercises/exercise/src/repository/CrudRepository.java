package repository;

import java.util.List;

public interface CrudRepository<E> {
    List<E> printList();

    void create(E e);

    void update(int id, E e);

    void delete(int id);

    E seeProduct(int id);

    E findProductByName(String name);
}
