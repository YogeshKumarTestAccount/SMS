package com.seekdigital.entity;
// Generated Oct 17, 2016 10:09:49 AM by Hibernate Tools 4.3.1.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Trnattendancerecord generated by hbm2java
 */
@Entity
@Table(name = "trnattendancerecord", catalog = "dbschoolmanagementsystem")
public class Trnattendancerecord implements java.io.Serializable {

	private Integer intAttendanceId;
	private Mstregistration mstregistration;
	private Tbldaysofweek tbldaysofweek;
	private Date dtSlotDate;
	private String dtSlotTime;

	public Trnattendancerecord() {
	}

	public Trnattendancerecord(Mstregistration mstregistration, Tbldaysofweek tbldaysofweek, Date dtSlotDate,
			String dtSlotTime) {
		this.mstregistration = mstregistration;
		this.tbldaysofweek = tbldaysofweek;
		this.dtSlotDate = dtSlotDate;
		this.dtSlotTime = dtSlotTime;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intAttendanceId", unique = true, nullable = false)
	public Integer getIntAttendanceId() {
		return this.intAttendanceId;
	}

	public void setIntAttendanceId(Integer intAttendanceId) {
		this.intAttendanceId = intAttendanceId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "intRegistrationId")
	public Mstregistration getMstregistration() {
		return this.mstregistration;
	}

	public void setMstregistration(Mstregistration mstregistration) {
		this.mstregistration = mstregistration;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "intDaysID")
	public Tbldaysofweek getTbldaysofweek() {
		return this.tbldaysofweek;
	}

	public void setTbldaysofweek(Tbldaysofweek tbldaysofweek) {
		this.tbldaysofweek = tbldaysofweek;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "dtSlotDate", length = 10)
	public Date getDtSlotDate() {
		return this.dtSlotDate;
	}

	public void setDtSlotDate(Date dtSlotDate) {
		this.dtSlotDate = dtSlotDate;
	}

	@Column(name = "dtSlotTime", length = 20)
	public String getDtSlotTime() {
		return this.dtSlotTime;
	}

	public void setDtSlotTime(String dtSlotTime) {
		this.dtSlotTime = dtSlotTime;
	}

}
