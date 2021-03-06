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
 * Mstleave generated by hbm2java
 */
@Entity
@Table(name = "mstleave", catalog = "dbschoolmanagementsystem")
public class Mstleave implements java.io.Serializable {

	private Integer intLeaveId;
	private String txtLeaveType;
	private Set<Trnteacherleaveapp> trnteacherleaveapps = new HashSet<Trnteacherleaveapp>(0);
	private Set<Trnstudentleaveapp> trnstudentleaveapps = new HashSet<Trnstudentleaveapp>(0);

	public Mstleave() {
	}

	public Mstleave(String txtLeaveType, Set<Trnteacherleaveapp> trnteacherleaveapps,
			Set<Trnstudentleaveapp> trnstudentleaveapps) {
		this.txtLeaveType = txtLeaveType;
		this.trnteacherleaveapps = trnteacherleaveapps;
		this.trnstudentleaveapps = trnstudentleaveapps;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intLeaveId", unique = true, nullable = false)
	public Integer getIntLeaveId() {
		return this.intLeaveId;
	}

	public void setIntLeaveId(Integer intLeaveId) {
		this.intLeaveId = intLeaveId;
	}

	@Column(name = "txtLeaveType", length = 50)
	public String getTxtLeaveType() {
		return this.txtLeaveType;
	}

	public void setTxtLeaveType(String txtLeaveType) {
		this.txtLeaveType = txtLeaveType;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mstleave")
	public Set<Trnteacherleaveapp> getTrnteacherleaveapps() {
		return this.trnteacherleaveapps;
	}

	public void setTrnteacherleaveapps(Set<Trnteacherleaveapp> trnteacherleaveapps) {
		this.trnteacherleaveapps = trnteacherleaveapps;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mstleave")
	public Set<Trnstudentleaveapp> getTrnstudentleaveapps() {
		return this.trnstudentleaveapps;
	}

	public void setTrnstudentleaveapps(Set<Trnstudentleaveapp> trnstudentleaveapps) {
		this.trnstudentleaveapps = trnstudentleaveapps;
	}

}
