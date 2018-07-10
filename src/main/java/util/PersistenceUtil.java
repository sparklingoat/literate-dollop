package util;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class PersistenceUtil {

  private static final String PERSISTENCE_UNIT_NAME = "todo-db";

  public static EntityManager getEntityManager() {
    return Persistence
        .createEntityManagerFactory(PERSISTENCE_UNIT_NAME)
        .createEntityManager();
  }

}
