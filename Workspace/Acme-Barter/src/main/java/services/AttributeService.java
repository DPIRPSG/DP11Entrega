package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Attribute;
import domain.AttributeDescription;
import repositories.AttributeRepository;

@Service
@Transactional
public class AttributeService {

	// Managed repository -----------------------------------------------------

	@Autowired
	private AttributeRepository attributeRepository;

	// Supporting services ----------------------------------------------------
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private AttributeDescriptionService attributeDescriptionService;

	// Constructors -----------------------------------------------------------

	public AttributeService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	
	public Attribute create() {
		Assert.isTrue(actorService.checkAuthority("ADMIN"), "Only an admin can create an Attribute.");
		
		Attribute result;
		Collection<AttributeDescription> attributesDescription;
		
		attributesDescription = new ArrayList<AttributeDescription>();
		
		result = new Attribute();
		
		result.setAttributesDescription(attributesDescription);
		
		return result;
	}
	
	public void save(Attribute attribute) {
		Assert.notNull(attribute);
		
		attributeRepository.save(attribute);
	}
	
	public void delete(Attribute attribute) {
		Assert.notNull(attribute);
		Assert.isTrue(attribute.getId() != 0);
		Assert.isTrue(actorService.checkAuthority("ADMIN"), "Only an admin can delete attributes");
				
		for(AttributeDescription a : attribute.getAttributesDescription()) {			
			attributeDescriptionService.delete(a);
		}
		
		attributeRepository.delete(attribute);
	}
	
	public Attribute findOne(int id) {
		Attribute result;
		
		result = attributeRepository.findOne(id);
		
		return result;
	}
	
	public Collection<Attribute> findAll() {
		Collection<Attribute> result;
		
		result = attributeRepository.findAll();
		
		return result;
	}

	// Other business methods -------------------------------------------------

	public void flush() {
		attributeRepository.flush();
	}
}
