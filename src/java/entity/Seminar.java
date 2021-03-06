package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Seminar implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long eventId;
    private String userName;
    private String password;
    private String email;
    @OneToMany(mappedBy = "seminar")
    private List<Mcq> mcq;
    @OneToMany(mappedBy = "seminar", fetch = FetchType.EAGER)
    private List<Question> question;
    @OneToMany(mappedBy = "seminar")
    private List<Student> student;
    
    private int face1 = 0;
    private int face2 = 0;
    private int face3 = 0;
    private int face4 = 0;
    private int face5 = 0;

    public Long getEventId() {
        return eventId;
    }

    public void setEventId(Long eventId) {
        this.eventId = eventId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Mcq> getMcq() {
        return mcq;
    }

    public void setMcq(List<Mcq> mcq) {
        this.mcq = mcq;
    }

    public List<Question> getQuestion() {
        return question;
    }

    public void setQuestion(List<Question> question) {
        this.question = question;
    }

    public List<Student> getStudent() {
        return student;
    }

    public void setStudent(List<Student> student) {
        this.student = student;
    }

    public int getFace1() {
        return face1;
    }

    public void setFace1(int face1) {
        this.face1 = face1;
    }

    public int getFace2() {
        return face2;
    }

    public void setFace2(int face2) {
        this.face2 = face2;
    }

    public int getFace3() {
        return face3;
    }

    public void setFace3(int face3) {
        this.face3 = face3;
    }

    public int getFace4() {
        return face4;
    }

    public void setFace4(int face4) {
        this.face4 = face4;
    }

    public int getFace5() {
        return face5;
    }

    public void setFace5(int face5) {
        this.face5 = face5;
    }
    
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (eventId != null ? eventId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Seminar)) {
            return false;
        }
        Seminar other = (Seminar) object;
        if ((this.eventId == null && other.eventId != null) || (this.eventId != null && !this.eventId.equals(other.eventId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Seminar[ id=" + eventId + " ]";
    }

}
