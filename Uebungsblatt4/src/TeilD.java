import org.hibernate.Query;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import teil_a.Uebungsblatt2PersistentManager;
import teil_a.Vorlesung;

import java.util.List;

public class TeilD {
    public static void main(String[] args) {
        try {
            PersistentSession session = Uebungsblatt2PersistentManager.instance().getSession();

            // Query (SELECT * FROM Vorlesung)
            Query query = session.createQuery("FROM Vorlesung");
            List<Vorlesung> vorlesungen = query.list();

            // Ausgabe Vorlesungen mit Name, ECTS und Studiengang
            System.out.println("Vorlesungen mit ECTS und Studiengang:");
            for (Vorlesung vorlesung : vorlesungen) {
                String studiengangName = vorlesung.getStudiengang() != null ? vorlesung.getStudiengang().getName() : "Kein Studiengang";
                System.out.printf("Vorlesung: %s, ECTS: %d, Studiengang: %s%n",
                        vorlesung.getName(), vorlesung.getEcts(), studiengangName);
            }

            Uebungsblatt2PersistentManager.instance().disposePersistentManager();
        } catch (PersistentException e) {
            e.printStackTrace();
        }
    }
}