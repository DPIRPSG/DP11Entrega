package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Actor;
import domain.Autoreply;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath:spring/datasource.xml",
		"classpath:spring/config/packages.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class AutoreplyServiceTest extends AbstractTest {
	
	// Service under test -------------------------

	@Autowired
	private AutoreplyService autoreplyService;
	
	// Other services needed -----------------------
	
	@Autowired
	private ActorService actorService;
	
	// Tests ---------------------------------------
	
	/**
	 * Acme-Barter 2.0 - Level B - 2.1
	 * Manage his or her autoreplies.
	 */
	
	/**
	 * Positive test case: Listar sus autoreply
	 * 		- Acción
	 * 		+ Autenticarse en el sistema como user
	 * 		+ Mostrar sus autoreply
	 * 		- Comprobación
	 * 		+ Comprobar que sale el número esperado de autoreply
	 */
	
	@Test 
	public void testListAutoreply() {
		// Declare variables
		Actor user;
		Collection<Autoreply> autoreplies;
		
		// Load objects to test
		authenticate("user1");
		user = actorService.findByPrincipal();
		
		// Checks basic requirements
		Assert.notNull(user, "El usuario no se ha logueado correctamente.");
		
		// Execution of test
		autoreplies = autoreplyService.findByPrincipal();
		
		// Checks results
		Assert.isTrue(autoreplies.size() == 6, "El número de autoreplies listado no es el esperado");

	}
	
	/**
	 * Positive test case: Crear un nuevo Autoreply
	 * 		- Acción
	 * 		+ Autenticarse en el sistema
	 * 		+ Crear un nuevo autoreply
	 * 		- Comprobación
	 * 		+ Comprobar que el numero nuevo de autoreplies es el mismo que antes más 1
	 */
	
	@Test 
	public void testCreateAutoreply() {
		// Declare variables
		Actor user;
		Collection<Autoreply> autoreplies;
		Integer numberOfAutoreplies;
		Collection<Autoreply> newAutoreplies;
		Integer newNumberOfAutoreplies;
		Autoreply autoreply;
		Collection<String> keyWords;
		
		// Load objects to test
		authenticate("user1");
		user = actorService.findByPrincipal();
		
		// Checks basic requirements
		Assert.notNull(user, "El usuario no se ha logueado correctamente.");
		
		// Execution of test
		autoreplies = autoreplyService.findByPrincipal();
		numberOfAutoreplies = autoreplies.size();
		
		autoreply = autoreplyService.create();
		
		keyWords = new ArrayList<>();
		
		keyWords.add("esto");
		keyWords.add("es");
		keyWords.add("un");
		keyWords.add("test");
		
		autoreply.setKeyWords(keyWords);
		
		autoreply.setText("Hola, esto es un mensaje de prueba para un test.");
		
		autoreplyService.saveFromEdit(autoreply);
		
		// Checks results
		newAutoreplies = autoreplyService.findByPrincipal();
		newNumberOfAutoreplies = newAutoreplies.size();
		
		Assert.isTrue(newNumberOfAutoreplies == numberOfAutoreplies + 1, "El número de autoreplies listado no es el que había antes + 1");
		
		unauthenticate();

	}
	
	/**
	 * Negative test case: Crear un nuevo Autoreply sin keyWords
	 * 		- Acción
	 * 		+ Autenticarse en el sistema
	 * 		+ Crear un nuevo autoreply sin keyWords
	 * 		- Comprobación
	 * 		+ Comprobar que salta una excepción del tipo: 
	 */
	
	@Test 
	public void testCreateAutoreplyNoKeyWords() {
		// Declare variables
		Actor user;
//		Collection<Autoreply> autoreplies;
//		Integer numberOfAutoreplies;
//		Collection<Autoreply> newAutoreplies;
//		Integer newNumberOfAutoreplies;
		Autoreply autoreply;
//		Collection<String> keyWords;
		
		// Load objects to test
		authenticate("user1");
		user = actorService.findByPrincipal();
		
		// Checks basic requirements
		Assert.notNull(user, "El usuario no se ha logueado correctamente.");
		
		// Execution of test
//		autoreplies = autoreplyService.findByPrincipal();
//		numberOfAutoreplies = autoreplies.size();
		
		autoreply = autoreplyService.create();
		
//		keyWords = new ArrayList<>();
//		
//		keyWords.add("esto");
//		keyWords.add("es");
//		keyWords.add("un");
//		keyWords.add("test");
//		
//		autoreply.setKeyWords(keyWords);
		
		autoreply.setText("Hola, esto es un mensaje de prueba para un test.");
		
		autoreplyService.saveFromEdit(autoreply);
		
		// Checks results
//		newAutoreplies = autoreplyService.findByPrincipal();
//		newNumberOfAutoreplies = newAutoreplies.size();
//		
//		Assert.isTrue(newNumberOfAutoreplies == numberOfAutoreplies + 1, "El número de autoreplies listado no es el que había antes + 1");
//		
		unauthenticate();

	}
	
	/**
	 * Negative test case: Crear un nuevo Autoreply sin text
	 * 		- Acción
	 * 		+ Autenticarse en el sistema
	 * 		+ Crear un nuevo autoreply sin text
	 * 		- Comprobación
	 * 		+ Comprobar que salta una excepción del tipo: ConstraintViolationException
	 */
	
	@Test(expected=ConstraintViolationException.class)
	@Rollback(value = true)
//	@Test 
	public void testCreateAutoreplyNoText() {
		// Declare variables
		Actor user;
//		Collection<Autoreply> autoreplies;
//		Integer numberOfAutoreplies;
//		Collection<Autoreply> newAutoreplies;
//		Integer newNumberOfAutoreplies;
		Autoreply autoreply;
		Collection<String> keyWords;
		
		// Load objects to test
		authenticate("user1");
		user = actorService.findByPrincipal();
		
		// Checks basic requirements
		Assert.notNull(user, "El usuario no se ha logueado correctamente.");
		
		// Execution of test
//		autoreplies = autoreplyService.findByPrincipal();
//		numberOfAutoreplies = autoreplies.size();
		
		autoreply = autoreplyService.create();
		
		keyWords = new ArrayList<>();
		
		keyWords.add("esto");
		keyWords.add("es");
		keyWords.add("un");
		keyWords.add("test");
		
		autoreply.setKeyWords(keyWords);
		
//		autoreply.setText("Hola, esto es un mensaje de prueba para un test.");
		
		autoreplyService.saveFromEdit(autoreply);
		
		// Checks results
//		newAutoreplies = autoreplyService.findByPrincipal();
//		newNumberOfAutoreplies = newAutoreplies.size();
//		
//		Assert.isTrue(newNumberOfAutoreplies == numberOfAutoreplies + 1, "El número de autoreplies listado no es el que había antes + 1");
//		
		unauthenticate();
		
		autoreplyService.flush();

	}

}
