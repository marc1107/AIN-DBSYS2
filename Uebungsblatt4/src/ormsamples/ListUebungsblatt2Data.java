/**
 * Licensee: Marc Bohner(HTWG Konstanz)
 * License Type: Academic
 */
package ormsamples;

import org.orm.*;
public class ListUebungsblatt2Data {
	private static final int ROW_COUNT = 100;
	
	public void listTestData() throws PersistentException {
		System.out.println("Listing Vorlesung...");
		teil_a.Vorlesung[] teil_aVorlesungs = teil_a.Vorlesung.listVorlesungByQuery(null, null);
		int length = Math.min(teil_aVorlesungs.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(teil_aVorlesungs[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
		System.out.println("Listing Studiengang...");
		teil_a.Studiengang[] teil_aStudiengangs = teil_a.Studiengang.listStudiengangByQuery(null, null);
		length = Math.min(teil_aStudiengangs.length, ROW_COUNT);
		for (int i = 0; i < length; i++) {
			System.out.println(teil_aStudiengangs[i]);
		}
		System.out.println(length + " record(s) retrieved.");
		
	}
	
	public static void main(String[] args) {
		try {
			ListUebungsblatt2Data listUebungsblatt2Data = new ListUebungsblatt2Data();
			try {
				listUebungsblatt2Data.listTestData();
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
