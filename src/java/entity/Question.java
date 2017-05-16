
package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Question implements Serializable, Comparable{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long questionId;
    private String question;
    @ManyToOne
    private Seminar seminar;
    private int upVote;
    @OneToMany(mappedBy = "question")
    private List<StudentVote> votedStudents = new ArrayList<StudentVote>();

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }
    
   

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Seminar getSeminar() {
        return seminar;
    }

    public void setSeminar(Seminar seminar) {
        this.seminar = seminar;
    }

    public int getUpVote() {
        return upVote;
    }

    public void setUpVote(int upVote) {
        this.upVote = upVote;
    }

    public List<StudentVote> getVotedStudents() {
        return votedStudents;
    }

    public void setVotedStudents(List<StudentVote> votedStudents) {
        this.votedStudents = votedStudents;
    }

    public void addVotedQuestion(StudentVote sv){
        this.votedStudents.add(sv);
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (questionId != null ? questionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Long)) {
            return false;
        }
        Question other = (Question) object;
        if ((this.questionId == null && other.questionId != null) || (this.questionId != null && !this.questionId.equals(other.questionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Question[ id=" + questionId + " ]";
    }

    @Override
    public int compareTo(Object compareQ) {
        int compareage=((Question)compareQ).getUpVote();
        return compareage-this.upVote;
    }  
    
}
