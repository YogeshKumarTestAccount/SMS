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
 * Mstcategory generated by hbm2java
 */
@Entity
@Table(name = "mstcategory", catalog = "dbschoolmanagementsystem")
public class Mstcategory implements java.io.Serializable {

	private Integer intCategoryId1;
	private String txtCategoryName;
	private Set<Tblstudstaffrecord> tblstudstaffrecords = new HashSet<Tblstudstaffrecord>(0);
	private Set<Trndocumentupload> trndocumentuploads = new HashSet<Trndocumentupload>(0);

	public Mstcategory() {
	}

	public Mstcategory(String txtCategoryName, Set<Tblstudstaffrecord> tblstudstaffrecords,
			Set<Trndocumentupload> trndocumentuploads) {
		this.txtCategoryName = txtCategoryName;
		this.tblstudstaffrecords = tblstudstaffrecords;
		this.trndocumentuploads = trndocumentuploads;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intCategoryId1", unique = true, nullable = false)
	public Integer getIntCategoryId1() {
		return this.intCategoryId1;
	}

	public void setIntCategoryId1(Integer intCategoryId1) {
		this.intCategoryId1 = intCategoryId1;
	}

	@Column(name = "txtCategoryName", length = 50)
	public String getTxtCategoryName() {
		return this.txtCategoryName;
	}

	public void setTxtCategoryName(String txtCategoryName) {
		this.txtCategoryName = txtCategoryName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mstcategory")
	public Set<Tblstudstaffrecord> getTblstudstaffrecords() {
		return this.tblstudstaffrecords;
	}

	public void setTblstudstaffrecords(Set<Tblstudstaffrecord> tblstudstaffrecords) {
		this.tblstudstaffrecords = tblstudstaffrecords;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mstcategory")
	public Set<Trndocumentupload> getTrndocumentuploads() {
		return this.trndocumentuploads;
	}

	public void setTrndocumentuploads(Set<Trndocumentupload> trndocumentuploads) {
		this.trndocumentuploads = trndocumentuploads;
	}

}
