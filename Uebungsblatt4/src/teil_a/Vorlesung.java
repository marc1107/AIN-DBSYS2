/**
 * "Visual Paradigm: DO NOT MODIFY THIS FILE!"
 * 
 * This is an automatic generated file. It will be regenerated every time 
 * you generate persistence class.
 * 
 * Modifying its content may cause the program not work, or your work may lost.
 */

/**
 * Licensee: Marc Bohner(HTWG Konstanz)
 * License Type: Academic
 */
package teil_a;

import org.orm.*;
import org.hibernate.Query;
import org.hibernate.LockMode;
import java.util.List;

public class Vorlesung {
	public Vorlesung() {
	}
	
	public static Vorlesung loadVorlesungByORMID(int ID) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return loadVorlesungByORMID(session, ID);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung getVorlesungByORMID(int ID) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return getVorlesungByORMID(session, ID);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung loadVorlesungByORMID(int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return loadVorlesungByORMID(session, ID, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung getVorlesungByORMID(int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return getVorlesungByORMID(session, ID, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung loadVorlesungByORMID(PersistentSession session, int ID) throws PersistentException {
		try {
			return (Vorlesung) session.load(teil_a.Vorlesung.class, Integer.valueOf(ID));
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung getVorlesungByORMID(PersistentSession session, int ID) throws PersistentException {
		try {
			return (Vorlesung) session.get(teil_a.Vorlesung.class, Integer.valueOf(ID));
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung loadVorlesungByORMID(PersistentSession session, int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			return (Vorlesung) session.load(teil_a.Vorlesung.class, Integer.valueOf(ID), lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung getVorlesungByORMID(PersistentSession session, int ID, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			return (Vorlesung) session.get(teil_a.Vorlesung.class, Integer.valueOf(ID), lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryVorlesung(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return queryVorlesung(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryVorlesung(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return queryVorlesung(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung[] listVorlesungByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return listVorlesungByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung[] listVorlesungByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return listVorlesungByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryVorlesung(PersistentSession session, String condition, String orderBy) throws PersistentException {
		StringBuffer sb = new StringBuffer("From teil_a.Vorlesung as Vorlesung");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			return query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static List queryVorlesung(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		StringBuffer sb = new StringBuffer("From teil_a.Vorlesung as Vorlesung");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			query.setLockMode("Vorlesung", lockMode);
			return query.list();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung[] listVorlesungByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		try {
			List list = queryVorlesung(session, condition, orderBy);
			return (Vorlesung[]) list.toArray(new Vorlesung[list.size()]);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung[] listVorlesungByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			List list = queryVorlesung(session, condition, orderBy, lockMode);
			return (Vorlesung[]) list.toArray(new Vorlesung[list.size()]);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung loadVorlesungByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return loadVorlesungByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung loadVorlesungByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return loadVorlesungByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung loadVorlesungByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		Vorlesung[] vorlesungs = listVorlesungByQuery(session, condition, orderBy);
		if (vorlesungs != null && vorlesungs.length > 0)
			return vorlesungs[0];
		else
			return null;
	}
	
	public static Vorlesung loadVorlesungByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		Vorlesung[] vorlesungs = listVorlesungByQuery(session, condition, orderBy, lockMode);
		if (vorlesungs != null && vorlesungs.length > 0)
			return vorlesungs[0];
		else
			return null;
	}
	
	public static java.util.Iterator iterateVorlesungByQuery(String condition, String orderBy) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return iterateVorlesungByQuery(session, condition, orderBy);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateVorlesungByQuery(String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		try {
			PersistentSession session = teil_a.Uebungsblatt2PersistentManager.instance().getSession();
			return iterateVorlesungByQuery(session, condition, orderBy, lockMode);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateVorlesungByQuery(PersistentSession session, String condition, String orderBy) throws PersistentException {
		StringBuffer sb = new StringBuffer("From teil_a.Vorlesung as Vorlesung");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			return query.iterate();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static java.util.Iterator iterateVorlesungByQuery(PersistentSession session, String condition, String orderBy, org.hibernate.LockMode lockMode) throws PersistentException {
		StringBuffer sb = new StringBuffer("From teil_a.Vorlesung as Vorlesung");
		if (condition != null)
			sb.append(" Where ").append(condition);
		if (orderBy != null)
			sb.append(" Order By ").append(orderBy);
		try {
			Query query = session.createQuery(sb.toString());
			query.setLockMode("Vorlesung", lockMode);
			return query.iterate();
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public static Vorlesung createVorlesung() {
		return new teil_a.Vorlesung();
	}
	
	public boolean save() throws PersistentException {
		try {
			teil_a.Uebungsblatt2PersistentManager.instance().saveObject(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean delete() throws PersistentException {
		try {
			teil_a.Uebungsblatt2PersistentManager.instance().deleteObject(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean refresh() throws PersistentException {
		try {
			teil_a.Uebungsblatt2PersistentManager.instance().getSession().refresh(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean evict() throws PersistentException {
		try {
			teil_a.Uebungsblatt2PersistentManager.instance().getSession().evict(this);
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean deleteAndDissociate()throws PersistentException {
		try {
			if(getStudiengang() != null) {
				getStudiengang().vorlesung.remove(this);
			}
			
			return delete();
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	public boolean deleteAndDissociate(org.orm.PersistentSession session)throws PersistentException {
		try {
			if(getStudiengang() != null) {
				getStudiengang().vorlesung.remove(this);
			}
			
			try {
				session.delete(this);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			throw new PersistentException(e);
		}
	}
	
	private void this_setOwner(Object owner, int key) {
		if (key == teil_a.ORMConstants.KEY_VORLESUNG_STUDIENGANG) {
			this.studiengang = (teil_a.Studiengang) owner;
		}
	}
	
	org.orm.util.ORMAdapter _ormAdapter = new org.orm.util.AbstractORMAdapter() {
		public void setOwner(Object owner, int key) {
			this_setOwner(owner, key);
		}
		
	};
	
	private int ID;
	
	private teil_a.Studiengang studiengang;
	
	private String name;
	
	private int ects;
	
	private int sws;
	
	private void setID(int value) {
		this.ID = value;
	}
	
	public int getID() {
		return ID;
	}
	
	public int getORMID() {
		return getID();
	}
	
	public void setName(String value) {
		this.name = value;
	}
	
	public String getName() {
		return name;
	}
	
	public void setEcts(int value) {
		this.ects = value;
	}
	
	public int getEcts() {
		return ects;
	}
	
	public void setSws(int value) {
		this.sws = value;
	}
	
	public int getSws() {
		return sws;
	}
	
	public void setStudiengang(teil_a.Studiengang value) {
		if (studiengang != null) {
			studiengang.vorlesung.remove(this);
		}
		if (value != null) {
			value.vorlesung.add(this);
		}
	}
	
	public teil_a.Studiengang getStudiengang() {
		return studiengang;
	}
	
	/**
	 * This method is for internal use only.
	 */
	private void setORM_Studiengang(teil_a.Studiengang value) {
		this.studiengang = value;
	}
	
	private teil_a.Studiengang getORM_Studiengang() {
		return studiengang;
	}
	
	public String toString() {
		return String.valueOf(getID());
	}
	
}
