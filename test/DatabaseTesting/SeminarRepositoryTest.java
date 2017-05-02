package DatabaseTesting;

import entity.Mcq;
import entity.Question;
import entity.Seminar;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.After;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

public class SeminarRepositoryTest {

    private SessionFactory sessionFactory;
    private Session session = null;

    @Before
    public void before() {
        // setup the session factory
        AnnotationConfiguration configuration = new AnnotationConfiguration();
        configuration.addAnnotatedClass(Seminar.class).addAnnotatedClass(Mcq.class).addAnnotatedClass(Question.class);
        configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        configuration.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
        configuration.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/maximilian_live?zeroDateTimeBehavior=convertToNull");
        configuration.setProperty("hibernate.hbm2ddl.auto", "update");

        sessionFactory = configuration.buildSessionFactory();
        session = sessionFactory.openSession();
    }

    @Test
    public void returnsSeminarWithMatchingType() {
        // create the objects needed for testing
        Question q  = new Question();
        q.setQuestion("WHat is Testing?");
        q.setUpVote(10);

        Mcq mcq = new Mcq();
        mcq.setQuestion("What?");
        mcq.setAns_a("a");
        mcq.setAns_b("b");
        mcq.setAns_c("c");
        mcq.setAns_d("d");
        mcq.setAns_correct("a");

        Seminar seminar = new Seminar();
        seminar.setUserName("Telco");
        seminar.setEmail("123");
        seminar.setPassword("123");
        List<Question> list = new ArrayList<Question>();
        list.add(q);
        seminar.setQuestion(list);
        
        // storing the objects for the test in the database
        session.save(q);
        session.save(mcq);
        session.save(seminar);

//         heroRepository = new SuperHeroRepository(session);
//        List<SuperHero> heroes = heroRepository.loadBy(superpower);
//        assertNotNull(heroes);
//        assertEquals(1, heroes.size());

    }

    @After
    public void after() {
        session.close();
        sessionFactory.close();
    }

}
