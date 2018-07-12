package com.javabootcamp.app;

import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

public class RecentCollection<E> implements Iterable<E> {
  private static final int MAXIMUM = 10;
  private final int maximumElements;

  private final Collection<E> recent =
      Collections.newSetFromMap(
          new LinkedHashMap<E, Boolean>(32, 0.7f, true) {
            protected boolean removeEldestEntry(
                Map.Entry<E, Boolean> eldest) {
              return size() > maximumElements;
            }
          }
      );

  public RecentCollection() {
    this(MAXIMUM);
  }

  public RecentCollection(int maximumElements) {
    this.maximumElements = maximumElements;
  }

  public void add(E element) {
    recent.add(element);
    // and maybe persist this in a property list ... ?
  }

  public void clear() {
    recent.clear();
    // and maybe clear the persisted property list ... ?
  }
  
  public boolean isEmpty() {
	  return recent.isEmpty();
  }
  
  public boolean contains(Object anObject) {
	  return recent.contains(anObject);
  }

  public Iterator<E> iterator() {
    // and maybe read the property list in case it changed ... ?
    return new ReverseCollection<E>(recent).iterator();
  }
} 