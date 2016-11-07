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
 * Mststudclassgroup generated by hbm2java
 */
@Entity
@Table(name = "mststudclassgroup", catalog = "dbschoolmanagementsystem")
public class Mststudclassgroup implements java.io.Serializable {

	private Integer intGroupId;
	private Mstregistration mstregistration;
	private Mststudclass mststudclass;
	private Mststudclasssection mststudclasssection;
	private String txtGroupName;
	private Integer intStatus;
	private Integer intNoOfStudents;

	public Mststudclassgroup() {
	}

	public Mststudclassgroup(Mstregistration mstregistration, Mststudclass mststudclass,
			Mststudclasssection mststudclasssection, String txtGroupName, Integer intStatus, Integer intNoOfStudents) {
		this.mstregistration = mstregistration;
		this.mststudclass = mststudclass;
		this.mststudclasssection = mststudclasssection;
		this.txtGroupName = txtGroupName;
		this.intStatus = intStatus;
		this.intNoOfStudents = intNoOfStudents;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intGroupId", unique = true, nullable = false)
	public Integer getIntGroupId() {
		return this.intGroupId;
	}

	public void setIntGroupId(Integer intGroupId) {
		this.intGroupId = intGroupId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "intRegistrationId")
	public Mstregistration getMstregistration() {
		return this.mstregistration;
	}

	public void setMstregistration(Mstregistration mstregistration) {
		this.mstregistration = mstregistration;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "intClassId")
	public Mststudclass getMststudclass() {
		return this.mststudclass;
	}

	public void setMststudclass(Mststudclass mststudclass) {
		this.mststudclass = mststudclass;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "intSectionId")
	public Mststudclasssection getMststudclasssection() {
		return this.mststudclasssection;
	}

	public void setMststudclasssection(Mststudclasssection mststudclasssection) {
		this.mststudclasssection = mststudclasssection;
	}

	@Column(name = "txtGroupName", length = 50)
	public String getTxtGroupName() {
		return this.txtGroupName;
	}

	public void setTxtGroupName(String txtGroupName) {
		this.txtGroupName = txtGroupName;
	}

	@Column(name = "intStatus")
	public Integer getIntStatus() {
		return this.intStatus;
	}

	public void setIntStatus(Integer intStatus) {
		this.intStatus = intStatus;
	}

	@Column(name = "intNoOfStudents")
	public Integer getIntNoOfStudents() {
		return this.intNoOfStudents;
	}

	public void setIntNoOfStudents(Integer intNoOfStudents) {
		this.intNoOfStudents = intNoOfStudents;
	}

}