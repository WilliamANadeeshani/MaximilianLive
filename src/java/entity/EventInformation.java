
package entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class EventInformation implements Serializable {

    private static final long serialVersionUID = 1L;
    private String eventName;
    private String lecturerName;
    private String lecturerDetails;
    private String date;
    private String time;
    private String place;
    @Id
    @OneToOne
    private Seminar seminar;
    
    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getLecturerName() {
        return lecturerName;
    }

    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }

    public String getLecturerDetails() {
        return lecturerDetails;
    }

    public void setLecturerDetails(String lecturerDetails) {
        this.lecturerDetails = lecturerDetails;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Seminar getSeminar() {
        return seminar;
    }

    public void setSeminar(Seminar seminar) {
        this.seminar = seminar;
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
        if (!(object instanceof EventInformation)) {
            return false;
        }
        EventInformation other = (EventInformation) object;
        if ((this.seminar == null && other.seminar != null) || (this.seminar != null && !this.seminar.equals(other.seminar))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.EventInformation[ id=" + seminar + " ]";
    }
    
}
