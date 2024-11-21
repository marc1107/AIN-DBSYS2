import org.hibernate.Query;
import org.orm.PersistentException;
import org.orm.PersistentSession;
import teil_a.Uebungsblatt2PersistentManager;

import java.util.List;

public class TeilF {
    public static void main(String[] args) {
        try {
            PersistentSession session = Uebungsblatt2PersistentManager.instance().getSession();

            // Vorlesungsnamen, die in beiden Studiengängen vorkommen
            String hql = "SELECT v.name " +
                    "FROM Vorlesung v " +
                    "WHERE v.studiengang.kuerzel IN ('AIN', 'WIN') " +
                    "GROUP BY v.name " +
                    "HAVING COUNT(DISTINCT v.studiengang.kuerzel) > 1";

            Query query = session.createQuery(hql);

            List<String> duplicateLectureNames = query.list();

            System.out.println("Vorlesungen mit gleichem Namen in AIN und WIN:");
            for (String lectureName : duplicateLectureNames) {
                System.out.println(lectureName);
            }

            Uebungsblatt2PersistentManager.instance().disposePersistentManager();
        } catch (PersistentException e) {
            e.printStackTrace();
        }
    }
}