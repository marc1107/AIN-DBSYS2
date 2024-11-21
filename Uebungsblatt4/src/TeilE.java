import org.hibernate.Query;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import teil_a.Uebungsblatt2PersistentManager;
import teil_a.Studiengang;

import java.util.List;

public class TeilE {
    public static void main(String[] args) {
        try {
            PersistentSession session = Uebungsblatt2PersistentManager.instance().getSession();

            // Query: Hole alle Studiengänge und berechne die Summe der ECTS ihrer Vorlesungen
            Query query = session.createQuery(
                    "SELECT s.name, SUM(v.ects) " +
                            "FROM Vorlesung v " +
                            "JOIN v.studiengang s " +
                            "GROUP BY s.name"
            );

            List<Object[]> results = query.list();

            System.out.println("Studiengänge und Summe der ECTS ihrer Vorlesungen:");
            for (Object[] result : results) {
                String studiengangName = (String) result[0];
                Long sumECTS = (Long) result[1];

                System.out.printf("Studiengang: %s, Gesamte ECTS: %d%n", studiengangName, sumECTS);
            }

            Uebungsblatt2PersistentManager.instance().disposePersistentManager();
        } catch (PersistentException e) {
            e.printStackTrace();
        }
    }
}