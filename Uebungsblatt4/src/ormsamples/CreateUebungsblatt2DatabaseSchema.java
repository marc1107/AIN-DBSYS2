/**
 * Licensee: Marc Bohner(HTWG Konstanz)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class CreateUebungsblatt2DatabaseSchema {
	public static void main(String[] args) {
		try {
			ORMDatabaseInitiator.createSchema(teil_a.Uebungsblatt2PersistentManager.instance());
			teil_a.Uebungsblatt2PersistentManager.instance().disposePersistentManager();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
