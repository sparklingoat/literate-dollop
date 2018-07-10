package pl.sda.service;

import java.util.List;
import pl.sda.model.TodoItem;
import pl.sda.repository.TodoRepository;

public class TodoService {

  private TodoRepository todoRepository;

  public TodoService(TodoRepository todoRepository) {
    this.todoRepository = todoRepository;
  }

  public List<TodoItem> getAllTodos() {
    return this.todoRepository.getAll();
  }

  public void save(TodoItem todoItem) {
    this.todoRepository.save(todoItem);
  }

  public TodoItem getById(Long id) {
    return todoRepository
            .getById(id)
            .orElseThrow(RuntimeException::new);
  }

  public boolean delete(Long id) {
    return this.todoRepository.delete(id);
  }

  public void update(TodoItem todoItem) {
    this.todoRepository.update(todoItem);
  }
}
