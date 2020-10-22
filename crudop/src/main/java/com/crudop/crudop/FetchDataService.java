package com.crudop.crudop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FetchDataService extends JpaRepository<UserModel,Integer> {

}

