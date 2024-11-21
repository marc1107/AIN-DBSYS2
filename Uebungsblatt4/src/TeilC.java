import org.orm.PersistentException;
import org.orm.PersistentSession;
import org.orm.PersistentTransaction;
import teil_a.Studiengang;
import teil_a.Uebungsblatt2PersistentManager;
import teil_a.Vorlesung;

public class TeilC {
    public static void main(String[] args) throws PersistentException {
        try {
            PersistentSession session = Uebungsblatt2PersistentManager.instance().getSession();
            PersistentTransaction t = session.beginTransaction();

            try {
                // Studiengänge
                Studiengang studiengang_ain = createStudiengang("Angewandte Informatik", "AIN", "Bachelor of Science");
                studiengang_ain.save();

                Studiengang studiengang_win = createStudiengang("Wirtschaftsinformatik", "WIN", "Bachelor of Science");
                studiengang_win.save();

                // Vorlesungen für Angewandte Informatik
                Vorlesung vorlesung1_ain = createVorlesung("Programmiertechnik 1", 6, 8, studiengang_ain);
                vorlesung1_ain.save();

                Vorlesung vorlesung2_ain = createVorlesung("Datenbanksysteme 1", 6, 8, studiengang_ain);
                vorlesung2_ain.save();

                Vorlesung vorlesung3_ain = createVorlesung("Mathe 1", 6, 8, studiengang_ain);
                vorlesung3_ain.save();

                Vorlesung vorlesung4_ain = createVorlesung("Digitaltechnik", 6, 8, studiengang_ain);
                vorlesung4_ain.save();

                Vorlesung vorlesung5_ain = createVorlesung("Softwaremodellierung", 6, 8, studiengang_ain);
                vorlesung5_ain.save();

                // Vorlesungen für Wirtschaftsinformatik
                Vorlesung vorlesung1_win = createVorlesung("Mathe 1", 6, 8, studiengang_win);
                vorlesung1_win.save();

                Vorlesung vorlesung2_win = createVorlesung("Programmiertechnik 1", 6, 8, studiengang_win);
                vorlesung2_win.save();

                Vorlesung vorlesung3_win = createVorlesung("Grundlagen der BWL", 6, 8, studiengang_win);
                vorlesung3_win.save();

                Vorlesung vorlesung4_win = createVorlesung("VWL", 6, 8, studiengang_win);
                vorlesung4_win.save();

                Vorlesung vorlesung5_win = createVorlesung("Softwaremodellierung", 6, 8, studiengang_win);
                vorlesung5_win.save();

                t.commit();
            } catch (PersistentException e) {
                t.rollback();
                e.printStackTrace();
            } finally {
                Uebungsblatt2PersistentManager.instance().disposePersistentManager();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static Studiengang createStudiengang(String name, String kuerzel, String abschluss) {
        Studiengang studiengang = new Studiengang();
        studiengang.setName(name);
        studiengang.setKuerzel(kuerzel);
        studiengang.setAbschluss(abschluss);
        return studiengang;
    }

    private static Vorlesung createVorlesung(String name, int ects, int sws, Studiengang studiengang) {
        Vorlesung vorlesung = new Vorlesung();
        vorlesung.setName(name);
        vorlesung.setEcts(ects);
        vorlesung.setSws(sws);
        vorlesung.setStudiengang(studiengang);
        return vorlesung;
    }
}
