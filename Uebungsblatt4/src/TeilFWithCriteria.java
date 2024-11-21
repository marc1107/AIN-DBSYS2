import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import teil_a.Uebungsblatt2PersistentManager;
import teil_a.Vorlesung;

import java.util.List;

public class TeilFWithCriteria {
    public static void main(String[] args) {
        try {
            PersistentSession session = Uebungsblatt2PersistentManager.instance().getSession();

            // Erstelle ein Criteria-Objekt für Vorlesung
            Criteria criteria = session.createCriteria(Vorlesung.class, "v")
                    .createAlias("v.studiengang", "s")
                    .add(Restrictions.in("s.kuerzel", new String[]{"AIN", "WIN"}))
                    .setProjection(Projections.projectionList()
                            .add(Projections.groupProperty("v.name"))
                            .add(Projections.countDistinct("s.kuerzel"), "studiengangCount")
                    );

            List<Object[]> results = criteria.list();

            // Ausgabe der Vorlesungsnamen mit gleichem Namen in AIN und WIN
            System.out.println("Vorlesungen mit gleichem Namen in AIN und WIN:");
            for (Object[] result : results) {
                String lectureName = (String) result[0];
                Long studiengangCount = (Long) result[1];

                if (studiengangCount > 1) {
                    System.out.println(lectureName);
                }
            }

            Uebungsblatt2PersistentManager.instance().disposePersistentManager();
        } catch (PersistentException e) {
            e.printStackTrace();
        }
    }
}