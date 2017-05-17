/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import static javax.persistence.TemporalType.DATE;

/**
 *
 * @author William A Nadeeshani
 */
@Entity
public class Mcq implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long mcqId;
    @ManyToOne
    private Seminar seminar;
    private String question;
    private String ans_a;
    private String ans_b;
    private String ans_c;
    private String ans_d;
    private String ans_correct;
    private int correctStudentCount = 0;
    private int wrongStudentCount= 0;
    private int total = 0;
    public Long getMcqId() {
        return mcqId;
    }

    public void setMcqId(Long mcqId) {
        this.mcqId = mcqId;
    }

    public Seminar getSeminar() {
        return seminar;
    }

    public void setSeminar(Seminar seminar) {
        this.seminar = seminar;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAns_a() {
        return ans_a;
    }

    public void setAns_a(String ans_a) {
        this.ans_a = ans_a;
    }

    public String getAns_b() {
        return ans_b;
    }

    public void setAns_b(String ans_b) {
        this.ans_b = ans_b;
    }

    public String getAns_c() {
        return ans_c;
    }

    public void setAns_c(String ans_c) {
        this.ans_c = ans_c;
    }

    public String getAns_d() {
        return ans_d;
    }

    public void setAns_d(String ans_d) {
        this.ans_d = ans_d;
    }

    public String getAns_correct() {
        return ans_correct;
    }

    public void setAns_correct(String ans_correct) {
        this.ans_correct = ans_correct;
    }

    public int getCorrectStudentCount() {
        return correctStudentCount;
    }

    public void setCorrectStudentCount(int correctStudentCount) {
        this.correctStudentCount = correctStudentCount;
    }

    public int getWrongStudentCount() {
        return wrongStudentCount;
    }

    public void setWrongStudentCount(int wrongStudentCount) {
        this.wrongStudentCount = wrongStudentCount;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (seminar != null ? seminar.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mcq)) {
            return false;
        }
        Mcq other = (Mcq) object;
        if ((this.seminar == null && other.seminar != null) || (this.seminar != null && !this.seminar.equals(other.seminar))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Mcq[ id=" + seminar + " ]";
    }

}
