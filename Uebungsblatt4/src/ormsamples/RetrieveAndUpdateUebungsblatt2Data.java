/**
 * Licensee: Marc Bohner(HTWG Konstanz)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class RetrieveAndUpdateUebungsblatt2Data {
	public void retrieveAndUpdateTestData() throws PersistentException {
		PersistentTransaction t = teil_a.Uebungsblatt2PersistentManager.instance().getSession().beginTransaction();
		try {
			teil_a.Vorlesung teil_aVorlesung = teil_a.Vorlesung.loadVorlesungByQuery(null, null);
			// Update the properties of the persistent object
			teil_aVorlesung.save();
			teil_a.Studiengang teil_aStudiengang = teil_a.Studiengang.loadStudiengangByQuery(null, null);
			// Update the properties of the persistent object
			teil_aStudiengang.save();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			RetrieveAndUpdateUebungsblatt2Data retrieveAndUpdateUebungsblatt2Data = new RetrieveAndUpdateUebungsblatt2Data();
			try {
				retrieveAndUpdateUebungsblatt2Data.retrieveAndUpdateTestData();
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
