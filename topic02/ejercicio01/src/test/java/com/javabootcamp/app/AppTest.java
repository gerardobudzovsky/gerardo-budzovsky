package com.javabootcamp.app;

import java.util.Iterator;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    /**
     * Rigourous Test :-)
     */
    public void testApp()
    {
        assertTrue( true );
    }
    
	public void WhenTheProgramIsExecutedForTheFirstTimeThenTheListIsEmpty() {
		RecentCollection<String> recent = new RecentCollection<String>();
		assertTrue(recent.isEmpty());
	}

	public void whenAFileIsOpenedThenAddItToTheList() {
		RecentCollection<String> recent = new RecentCollection<String>();
		String aString = "hello";
		String anotherString = "goodbye";
		// String yetAnotherString= "supercalifragilisticexpialidocious";
		recent.add(aString);
		recent.add(anotherString);
		assertTrue(recent.contains(aString));

	}

	public void whenNumberOfFilesReachsMaximumSizeThenNoNextFileExistsInTheList() {
		RecentCollection<String> recent = new RecentCollection<String>();
		for (int i = 0; i < 20; i++) {
			recent.add("" + i);
		}
		Iterator<String> files = recent.iterator();
		for (int i = 19; i >= 10; i--) {
			assertEquals("" + i, files.next());
		}
		assertFalse(files.hasNext());
	}

	public void whenAFileThatAlreadyExistsInTheListIsOpenThenBumpedItToTheTop() {
		RecentCollection<String> recent = new RecentCollection<String>();
		recent.add("hello");
		recent.add("hello");
		recent.add("hello");
		recent.add("goodbye");
		recent.add("goodbye");
		recent.add("goodbye");
		recent.add("hello");
		Iterator<String> files = recent.iterator();
		assertEquals("hello", files.next());
		assertEquals("goodbye", files.next());
		assertFalse(files.hasNext());
	}
    
}
