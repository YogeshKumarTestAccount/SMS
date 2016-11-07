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
 * Mstschoolconnect generated by hbm2java
 */
@Entity
@Table(name = "mstschoolconnect", catalog = "dbschoolmanagementsystem")
public class Mstschoolconnect implements java.io.Serializable {

	private Integer intSchoolConnectId;
	private Mstschool mstschool;
	private String txtTitle;
	private String txtBody;
	private String txtMailId;
	private byte[] blAttachment;

	public Mstschoolconnect() {
	}

	public Mstschoolconnect(Mstschool mstschool, String txtTitle, String txtBody, String txtMailId,
			byte[] blAttachment) {
		this.mstschool = mstschool;
		this.txtTitle = txtTitle;
		this.txtBody = txtBody;
		this.txtMailId = txtMailId;
		this.blAttachment = blAttachment;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intSchoolConnectId", unique = true, nullable = false)
	public Integer getIntSchoolConnectId() {
		return this.intSchoolConnectId;
	}

	public void setIntSchoolConnectId(Integer intSchoolConnectId) {
		this.intSchoolConnectId = intSchoolConnectId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "intSchoolId")
	public Mstschool getMstschool() {
		return this.mstschool;
	}

	public void setMstschool(Mstschool mstschool) {
		this.mstschool = mstschool;
	}

	@Column(name = "txtTitle", length = 100)
	public String getTxtTitle() {
		return this.txtTitle;
	}

	public void setTxtTitle(String txtTitle) {
		this.txtTitle = txtTitle;
	}

	@Column(name = "txtBody", length = 500)
	public String getTxtBody() {
		return this.txtBody;
	}

	public void setTxtBody(String txtBody) {
		this.txtBody = txtBody;
	}

	@Column(name = "txtMailId", length = 50)
	public String getTxtMailId() {
		return this.txtMailId;
	}

	public void setTxtMailId(String txtMailId) {
		this.txtMailId = txtMailId;
	}

	@Column(name = "blAttachment")
	public byte[] getBlAttachment() {
		return this.blAttachment;
	}

	public void setBlAttachment(byte[] blAttachment) {
		this.blAttachment = blAttachment;
	}

}
