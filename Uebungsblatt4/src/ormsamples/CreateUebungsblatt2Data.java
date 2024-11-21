/**
 * Licensee: Marc Bohner(HTWG Konstanz)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class CreateUebungsblatt2Data {
	public void createTestData() throws PersistentException {
		PersistentTransaction t = teil_a.Uebungsblatt2PersistentManager.instance().getSession().beginTransaction();
		try {
			teil_a.Vorlesung teil_aVorlesung = teil_a.Vorlesung.createVorlesung();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : sws, ects
			teil_aVorlesung.save();
			teil_a.Studiengang teil_aStudiengang = teil_a.Studiengang.createStudiengang();
			// TODO Initialize the properties of the persistent object here, the following properties must be initialized before saving : kuerzel
			teil_aStudiengang.save();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			CreateUebungsblatt2Data createUebungsblatt2Data = new CreateUebungsblatt2Data();
			try {
				createUebungsblatt2Data.createTestData();
			}
			finally {
				teil_a.Uebungsblatt2PersistentManager.instance().disposePersistentManager();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
