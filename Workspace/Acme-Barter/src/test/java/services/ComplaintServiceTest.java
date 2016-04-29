package services;

import java.util.ArrayList;
import java.util.Calendar;
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
import utilities.InvalidPostTestException;
import utilities.InvalidPreTestException;
import domain.Barter;
import domain.Complaint;
import domain.Item;
import domain.Match;
import domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"classpath:spring/datasource.xml",
		"classpath:spring/config/packages.xml"})
@Transactional
@TransactionConfiguration(defaultRollback = false)
public class ComplaintServiceTest extends AbstractTest {

	// Service under test -------------------------
	
	@Autowired
	private ComplaintService complaintService;
	
	// Other services needed -----------------------
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private BarterService barterService;
	
	@Autowired
	private MatchService matchService;
	
	@Autowired
	private  UserService userService;
		
	// Tests ---------------------------------------
	
//	/**
//	 * Acme-Six-Pack - 2.0 - Level C - 4.2.1
//	 * The total number of complaints that have been created.
//	 * 
//	 */
//	@Test
//	public void testNumberComplaintsCreated(){
//		// Declare variable
//		int testResult, codeResult;
//		
//		// Load objects to test
//		
//		testResult = complaintService.findAll().size();
//		
//		// Check basic requirements
//		
//		// Execution of test
//		Assert.notNull(null, "A espera del código");
//		
//		// Check results
//		Assert.isTrue(testResult == codeResult);
//	}
//	
//	/**
//	 * Acme-Six-Pack - 2.0 - Level C - 4.2.2
//	 *  The average number of complaints per barter.
//	 * 
//	 */
//	@Test
//	public void testAverageComplaintsBarter(){
//		// Declare variable
//		double testResult, codeResult;
//		
//		// Load objects to test
//		
//		testResult = complaintService.findAll().size() / barterService.findAll().size();
//		
//		// Check basic requirements
//		
//		// Execution of test
//		Assert.notNull(null, "A espera del código");
//		
//		// Check results
//		Assert.isTrue(testResult == codeResult);
//	}
//	
//	/**
//	 * Acme-Six-Pack - 2.0 - Level C - 4.2.3
//	 *  The average number of complaints per match.
//	 * 
//	 */
//	@Test
//	public void testAverageComplaintsMatch(){
//		// Declare variable
//		double testResult, codeResult;
//		
//		// Load objects to test
//		
//		testResult = complaintService.findAll().size() / matchService.findAll().size();
//		
//		// Check basic requirements
//		
//		// Execution of test
//		Assert.notNull(null, "A espera del código");
//		
//		// Check results
//		Assert.isTrue(testResult == codeResult);
//	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.1
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a barter.
	 */
	/**
	 * Test que comprueba que se crea un Complaint de forma correcta en condiciones normales
	 */
	@Test
	public void testCreateComplaintOfBarterOk() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Barter> barters;
		Barter barter;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		barter = null;
		
		barters = barterService.findAll();
		for(Barter b : barters) {
			if(b.getUser().getId() != user.getId() && b.getClosed() == false) {
				barter = b;
				break;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(barter.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.1
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a barter.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear un Complaint sobre un Barter cerrado
	 */
	@Test(expected=IllegalArgumentException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfBarterError1() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Barter> barters;
		Barter barter;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		barter = null;
		
		barters = barterService.findAll();
		for(Barter b : barters) {
			if(b.getUser().getId() != user.getId() && b.getClosed() != false) {
				barter = b;
				break;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(barter.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.1
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a barter.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear
	 * un Complaint sobre un Barter cuyo dueño es el usuario que
	 * está creando el Complaint
	 */
	@Test(expected=IllegalArgumentException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfBarterError2() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Barter> barters;
		Barter barter;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		barter = null;
		
		barters = barterService.findAll();
		for(Barter b : barters) {
			if(b.getUser().getId() != user.getId() && b.getClosed() == false) {
				barter = b;
				break;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(barter.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.1
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a barter.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear
	 * un Complaint sin el atributo text
	 */
	@Test(expected=ConstraintViolationException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfBarterError3() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Barter> barters;
		Barter barter;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		barter = null;
		
		barters = barterService.findAll();
		for(Barter b : barters) {
			if(b.getUser().getId() != user.getId() && b.getClosed() == false) {
				barter = b;
				break;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(barter.getId());
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.1
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a barter.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear
	 * un Complaint sin estar logueado en el sistema
	 */
	@Test(expected=IllegalArgumentException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfBarterError4() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Barter> barters;
		Barter barter;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		barter = null;
		
		barters = barterService.findAll();
		for(Barter b : barters) {
			if(b.getUser().getId() != user.getId() && b.getClosed() == false) {
				barter = b;
				break;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		preSave = complaints.size();
		
		authenticate(null);
		
		complaint = complaintService.create(barter.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(barter.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.2
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a match in which he or she's involved.
	 */
	/**
	 * Test que comprueba que se crea un Complaint de forma correcta en condiciones normales
	 */
	@Test
	public void testCreateComplaintOfMatchOk() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Match> matches;
		Match match;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		match = null;
		
		matches = matchService.findAllUserInvolves(user.getId());
		for(Match m : matches) {
			if(m.getClosed() == false) {
				match = m;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(match.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.2
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a match in which he or she's involved.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear un Complaint sobre un Match cerrado
	 */
	@Test(expected=IllegalArgumentException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfMatchError1() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Match> matches;
		Match match;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		match = null;
		
		matches = matchService.findAllUserInvolves(user.getId());
		for(Match m : matches) {
			if(m.getClosed() != false) {
				match = m;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(match.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.2
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a match in which he or she's involved.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear
	 * un Complaint sobre un Match en el que el usuario no está implicado
	 */
	@Test(expected=IllegalArgumentException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfMatchError2() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Match> matches;
		Match match;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		match = null;
		
		matches = matchService.findAll();
		for(Match m : matches) {
			if(m.getReceiverBarter().getUser().getId() != user.getId()) {
				if(m.getCreatorBarter().getUser().getId() != user.getId()) {
					if(m.getClosed() == false) {
						match = m;
					}
				}
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(match.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.2
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a match in which he or she's involved.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear
	 * un Complaint sin el atributo text
	 */
	@Test(expected=ConstraintViolationException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfMatchError3() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Match> matches;
		Match match;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		match = null;
		
		matches = matchService.findAllUserInvolves(user.getId());
		for(Match m : matches) {
			if(m.getClosed() == false) {
				match = m;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		preSave = complaints.size();
		
		complaint = complaintService.create(match.getId());
		//complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.2
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a match in which he or she's involved.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear
	 * un Complaint sin estar logueado en el sistema
	 */
	@Test(expected=IllegalArgumentException.class)
	@Rollback(value=true)
	public void testCreateComplaintOfMatchError4() {
		Complaint complaint;
		Collection<Complaint> complaints;
		Collection<Match> matches;
		Match match;
		User user;
		int preSave, postSave;
		
		authenticate("user1");
		user = userService.findByPrincipal();
		match = null;
		
		matches = matchService.findAllUserInvolves(user.getId());
		for(Match m : matches) {
			if(m.getClosed() == false) {
				match = m;
			}
		}
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		preSave = complaints.size();
		
		authenticate(null);
		
		complaint = complaintService.create(match.getId());
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		complaints = complaintService.findAllByBarterOrMatch(match.getId());
		postSave = complaints.size();
		
		Assert.isTrue(postSave == (preSave + 1));
		Assert.isTrue(complaints.contains(complaint));
		
		authenticate(null);
	}
	
	/**
	 * Acme-Barter 2.0 - Level c - FR 3.2
	 * An actor who is authenticated as a user must be able to
	 * create one or more complaints regarding a match in which he or she's involved.
	 */
	/**
	 * Test que comprueba que salta error si se intenta crear
	 * un Complaint sobre un Match o un Barter pasándole un Id incorrecto
	 */
	@Test(expected=IllegalArgumentException.class)
	@Rollback(value=true)
	public void testCreateComplaintError() {
		Complaint complaint;
		
		authenticate("user1");		
		
		complaint = complaintService.create(1);
		complaint.setText("prueba");
		complaint = complaintService.save(complaint);
		
		authenticate(null);
	}
}
