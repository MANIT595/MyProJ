package com.crudop.crudop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FetchDataService extends CrudRepository<UserModel,Integer> {

    @Query(value = "select * from registertab u where u.email = ?1 and u.password =?2", nativeQuery = true)
    UserModel findByEmailAddress(String emailAddress,String password);

}

