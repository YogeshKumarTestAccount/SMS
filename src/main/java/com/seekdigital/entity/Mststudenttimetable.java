package com.seekdigital.entity;
// Generated Oct 17, 2016 10:09:49 AM by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Mststudenttimetable generated by hbm2java
 */
@Entity
@Table(name = "mststudenttimetable", catalog = "dbschoolmanagementsystem")
public class Mststudenttimetable implements java.io.Serializable {

	private Integer intStudentTimeTableId;
	private Mststudclass mststudclass;
	private Mststudclasssection mststudclasssection;
	private Mstsubject mstsubject;
	private Tbldaysofweek tbldaysofweek;
	private String txtClassTimings;
	private byte[] blStudentTimetable;

	public Mststudenttimetable() {
	}

	public Mststudenttimetable(Mststudclass mststudclass, Mststudclasssection mststudclasssection,
			Mstsubject mstsubject, Tbldaysofweek tbldaysofweek, String txtClassTimings, byte[] blStudentTimetable) {
		this.mststudclass = mststudclass;
		this.mststudclasssection = mststudclasssection;
		this.mstsubject = mstsubject;
		this.tbldaysofweek = tbldaysofweek;
		this.txtClassTimings = txtClassTimings;
		this.blStudentTimetable = blStudentTimetable;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intStudentTimeTableID", unique = true, nullable = false)
	public Integer getIntStudentTimeTableId() {
		return this.intStudentTimeTableId;
	}

	public void setIntStudentTimeTableId(Integer intStudentTimeTableId) {
		this.intStudentTimeTableId = intStudentTimeTableId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "intClassId")
	public Mststudclass getMststudclass() {
		return this.mststudclass;
	}

	public void setMststudclass(Mststudclass mststudclass) {
		this.mststudclass = mststudclass;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "intSectionId")
	public Mststudclasssection getMststudclasssection() {
		return this.mststudclasssection;
	}

	public void setMststudclasssection(Mststudclasssection mststudclasssection) {
		this.mststudclasssection = mststudclasssection;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "intSubjectId")
	public Mstsubject getMstsubject() {
		return this.mstsubject;
	}

	public void setMstsubject(Mstsubject mstsubject) {
		this.mstsubject = mstsubject;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "intDaysID")
	public Tbldaysofweek getTbldaysofweek() {
		return this.tbldaysofweek;
	}

	public void setTbldaysofweek(Tbldaysofweek tbldaysofweek) {
		this.tbldaysofweek = tbldaysofweek;
	}

	@Column(name = "txtClassTimings", length = 100)
	public String getTxtClassTimings() {
		return this.txtClassTimings;
	}

	public void setTxtClassTimings(String txtClassTimings) {
		this.txtClassTimings = txtClassTimings;
	}

	@Column(name = "blStudentTimetable")
	public byte[] getBlStudentTimetable() {
		return this.blStudentTimetable;
	}

	public void setBlStudentTimetable(byte[] blStudentTimetable) {
		this.blStudentTimetable = blStudentTimetable;
	}

}
