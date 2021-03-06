package com.seekdigital.entity;
// Generated Oct 17, 2016 10:09:49 AM by Hibernate Tools 4.3.1.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Mstteacheranswer generated by hbm2java
 */
@Entity
@Table(name = "mstteacheranswer", catalog = "dbschoolmanagementsystem")
public class Mstteacheranswer implements java.io.Serializable {

	private Integer intTeacherAnswerId;
	private String txtAnswer;

	public Mstteacheranswer() {
	}

	public Mstteacheranswer(String txtAnswer) {
		this.txtAnswer = txtAnswer;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intTeacherAnswerId", unique = true, nullable = false)
	public Integer getIntTeacherAnswerId() {
		return this.intTeacherAnswerId;
	}

	public void setIntTeacherAnswerId(Integer intTeacherAnswerId) {
		this.intTeacherAnswerId = intTeacherAnswerId;
	}

	@Column(name = "txtAnswer", length = 50)
	public String getTxtAnswer() {
		return this.txtAnswer;
	}

	public void setTxtAnswer(String txtAnswer) {
		this.txtAnswer = txtAnswer;
	}

}
