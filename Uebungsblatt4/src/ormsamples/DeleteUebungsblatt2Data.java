/**
 * Licensee: Marc Bohner(HTWG Konstanz)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class DeleteUebungsblatt2Data {
	public void deleteTestData() throws PersistentException {
		PersistentTransaction t = teil_a.Uebungsblatt2PersistentManager.instance().getSession().beginTransaction();
		try {
			teil_a.Vorlesung teil_aVorlesung = teil_a.Vorlesung.loadVorlesungByQuery(null, null);
			teil_aVorlesung.delete();
			teil_a.Studiengang teil_aStudiengang = teil_a.Studiengang.loadStudiengangByQuery(null, null);
			teil_aStudiengang.delete();
			t.commit();
		}
		catch (Exception e) {
			t.rollback();
		}
		
	}
	
	public static void main(String[] args) {
		try {
			DeleteUebungsblatt2Data deleteUebungsblatt2Data = new DeleteUebungsblatt2Data();
			try {
				deleteUebungsblatt2Data.deleteTestData();
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
