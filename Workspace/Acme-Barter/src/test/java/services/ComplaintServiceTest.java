package services;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;

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
import domain.Item;

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
		
	// Tests ---------------------------------------
	
	/**
	 * Acme-Six-Pack - 2.0 - Level C - 4.2.1
	 * The total number of complaints that have been created.
	 * 
	 */
	@Test
	public void testNumberComplaintsCreated(){
		// Declare variable
		int testResult, codeResult;
		
		// Load objects to test
		
		testResult = complaintService.findAll().size();
		
		// Check basic requirements
		
		// Execution of test
		Assert.notNull(null, "A espera del código");
		
		// Check results
		Assert.isTrue(testResult == codeResult);
	}
	
	/**
	 * Acme-Six-Pack - 2.0 - Level C - 4.2.2
	 *  The average number of complaints per barter.
	 * 
	 */
	@Test
	public void testAverageComplaintsBarter(){
		// Declare variable
		double testResult, codeResult;
		
		// Load objects to test
		
		testResult = complaintService.findAll().size() / barterService.findAll().size();
		
		// Check basic requirements
		
		// Execution of test
		Assert.notNull(null, "A espera del código");
		
		// Check results
		Assert.isTrue(testResult == codeResult);
	}
	
	/**
	 * Acme-Six-Pack - 2.0 - Level C - 4.2.3
	 *  The average number of complaints per match.
	 * 
	 */
	@Test
	public void testAverageComplaintsMatch(){
		// Declare variable
		double testResult, codeResult;
		
		// Load objects to test
		
		testResult = complaintService.findAll().size() / matchService.findAll().size();
		
		// Check basic requirements
		
		// Execution of test
		Assert.notNull(null, "A espera del código");
		
		// Check results
		Assert.isTrue(testResult == codeResult);
	}
}
