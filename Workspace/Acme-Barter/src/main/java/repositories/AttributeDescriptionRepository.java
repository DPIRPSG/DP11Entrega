package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.AttributeDescription;

@Repository
public interface AttributeDescriptionRepository extends JpaRepository<AttributeDescription, Integer> {
	
}
