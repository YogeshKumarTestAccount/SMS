package com.seekdigital.entity;
// Generated Oct 17, 2016 10:09:49 AM by Hibernate Tools 4.3.1.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Tbldaysofweek generated by hbm2java
 */
@Entity
@Table(name = "tbldaysofweek", catalog = "dbschoolmanagementsystem")
public class Tbldaysofweek implements java.io.Serializable {

	private Integer intDaysId;
	private String txtDay;
	private Set<Mststudenttimetable> mststudenttimetables = new HashSet<Mststudenttimetable>(0);
	private Set<Trnattendancerecord> trnattendancerecords = new HashSet<Trnattendancerecord>(0);
	private Set<Mstteachertimetable> mstteachertimetables = new HashSet<Mstteachertimetable>(0);

	public Tbldaysofweek() {
	}

	public Tbldaysofweek(String txtDay, Set<Mststudenttimetable> mststudenttimetables,
			Set<Trnattendancerecord> trnattendancerecords, Set<Mstteachertimetable> mstteachertimetables) {
		this.txtDay = txtDay;
		this.mststudenttimetables = mststudenttimetables;
		this.trnattendancerecords = trnattendancerecords;
		this.mstteachertimetables = mstteachertimetables;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intDaysID", unique = true, nullable = false)
	public Integer getIntDaysId() {
		return this.intDaysId;
	}

	public void setIntDaysId(Integer intDaysId) {
		this.intDaysId = intDaysId;
	}

	@Column(name = "txtDay", length = 20)
	public String getTxtDay() {
		return this.txtDay;
	}

	public void setTxtDay(String txtDay) {
		this.txtDay = txtDay;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tbldaysofweek")
	public Set<Mststudenttimetable> getMststudenttimetables() {
		return this.mststudenttimetables;
	}

	public void setMststudenttimetables(Set<Mststudenttimetable> mststudenttimetables) {
		this.mststudenttimetables = mststudenttimetables;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tbldaysofweek")
	public Set<Trnattendancerecord> getTrnattendancerecords() {
		return this.trnattendancerecords;
	}

	public void setTrnattendancerecords(Set<Trnattendancerecord> trnattendancerecords) {
		this.trnattendancerecords = trnattendancerecords;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tbldaysofweek")
	public Set<Mstteachertimetable> getMstteachertimetables() {
		return this.mstteachertimetables;
	}

	public void setMstteachertimetables(Set<Mstteachertimetable> mstteachertimetables) {
		this.mstteachertimetables = mstteachertimetables;
	}

}
