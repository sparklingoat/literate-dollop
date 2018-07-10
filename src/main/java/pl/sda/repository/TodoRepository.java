package pl.sda.repository;

import java.util.List;
import java.util.Optional;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import pl.sda.model.TodoItem;

public class TodoRepository {

  private EntityManager entityManager;

  public TodoRepository(EntityManager entityManager) {
    this.entityManager = entityManager;
  }

  public List<TodoItem> getAll() {
    return entityManager
        .createQuery("select td from TodoItem td", TodoItem.class)
        .getResultList();
  }

  public Optional<TodoItem> getById(Long id) {
    Query query = entityManager
        .createQuery("select td from TodoItem td where td.id = :id");
    query.setParameter("id", id);
    try {
      TodoItem singleResult = (TodoItem) query.getSingleResult();
      return Optional.of(singleResult);
    } catch (NoResultException e) {
      return Optional.empty();
    }
  }

  public Optional<TodoItem> getByTitle(String title) {
    return Optional.empty();
  }

  public void save(TodoItem todoItem) {
    entityManager.getTransaction().begin();
    entityManager.persist(todoItem);
    entityManager.getTransaction().commit();
  }

  public boolean delete(Long id) {
    entityManager.getTransaction().begin();
    Query query = entityManager.createQuery("delete from TodoItem where id = :id");
    query.setParameter("id", id);
    int deletedNumber = query.executeUpdate();
    entityManager.getTransaction().commit();
    return deletedNumber == 1;
  }

  public void update(TodoItem todoItem) {
    entityManager.getTransaction().begin();
    entityManager.merge(todoItem);
    entityManager.getTransaction().commit();
  }
}
