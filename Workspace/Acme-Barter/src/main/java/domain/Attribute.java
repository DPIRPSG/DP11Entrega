package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;


@Entity
@Access(AccessType.PROPERTY)
public class Attribute extends DomainEntity{

	// Constructors -----------------------------------------------------------

	// Attributes -------------------------------------------------------------
	private String name;
	
	@NotNull
	@NotBlank
	public String getName() {
		return name;
	}
	public void setName(String value) {
		this.name = value;
	}
	
	
	// Relationships ----------------------------------------------------------
	private AttributeDescription attributeDescription;

	@Valid
	@NotNull
	@OneToMany(mappedBy="attribute")
	public AttributeDescription getAttributeDescription() {
		return attributeDescription;
	}
	public void setAttributeDescription(AttributeDescription attributeDescription) {
		this.attributeDescription = attributeDescription;
	}
		
}
