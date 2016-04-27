package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.AttributeDescriptionRepository;

@Service
@Transactional
public class AttributeDescriptionService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private AttributeDescriptionRepository attributeDescriptionRepository;

	// Supporting services ----------------------------------------------------
	

	// Constructors -----------------------------------------------------------

	public AttributeDescriptionService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	
	


	// Other business methods -------------------------------------------------

	public void flush() {
		attributeDescriptionRepository.flush();
	}
}
