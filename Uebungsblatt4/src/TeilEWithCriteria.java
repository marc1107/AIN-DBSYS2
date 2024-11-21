import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import teil_a.Uebungsblatt2PersistentManager;
import teil_a.Vorlesung;

import java.util.List;

public class TeilEWithCriteria {
    public static void main(String[] args) {
        try {
            PersistentSession session = Uebungsblatt2PersistentManager.instance().getSession();

            // Erstelle ein Criteria-Objekt für Vorlesung
            Criteria criteria = session.createCriteria(Vorlesung.class, "v")
                    .createAlias("v.studiengang", "s")
                    .setProjection(Projections.projectionList()
                            .add(Projections.groupProperty("s.name"), "studiengangName")
                            .add(Projections.sum("v.ects"), "sumECTS")
                    );

            List<Object[]> results = criteria.list();

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