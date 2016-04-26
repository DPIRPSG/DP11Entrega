package domain;

import java.util.Collection;
import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;


@Entity
@Access(AccessType.PROPERTY)
public class Autoreply extends DomainEntity{

	// Constructors -----------------------------------------------------------

	// Attributes -------------------------------------------------------------
	private Collection<String> keyWords;
	private String text;

	@NotNull
	@ElementCollection
	public Collection<String> getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(Collection<String> keyWords) {
		this.keyWords = keyWords;
	}
	
	
	@NotNull
	@NotBlank
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	// Relationships ----------------------------------------------------------
	private Actor actor;
	
	@Valid
	@NotNull
	@ManyToOne(optional=false)
	public Actor getActor() {
		return actor;
	}
	public void setActor(Actor actor) {
		this.actor = actor;
	}
	
}
