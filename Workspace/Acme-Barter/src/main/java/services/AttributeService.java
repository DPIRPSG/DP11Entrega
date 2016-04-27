package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import repositories.AttributeRepository;

@Service
@Transactional
public class AttributeService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private AttributeRepository attributeRepository;

	// Supporting services ----------------------------------------------------
	

	// Constructors -----------------------------------------------------------

	public AttributeService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	
	


	// Other business methods -------------------------------------------------

	public void flush() {
		attributeRepository.flush();
	}
}
