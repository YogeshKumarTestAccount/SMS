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
 * Mstcountry generated by hbm2java
 */
@Entity
@Table(name = "mstcountry", catalog = "dbschoolmanagementsystem")
public class Mstcountry implements java.io.Serializable {

	private Integer intCountryId;
	private String txtCountryName;
	private Set<Mststate> mststates = new HashSet<Mststate>(0);

	public Mstcountry() {
	}

	public Mstcountry(String txtCountryName) {
		this.txtCountryName = txtCountryName;
	}

	public Mstcountry(String txtCountryName, Set<Mststate> mststates) {
		this.txtCountryName = txtCountryName;
		this.mststates = mststates;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intCountryId", unique = true, nullable = false)
	public Integer getIntCountryId() {
		return this.intCountryId;
	}

	public void setIntCountryId(Integer intCountryId) {
		this.intCountryId = intCountryId;
	}

	@Column(name = "txtCountryName", nullable = false, length = 50)
	public String getTxtCountryName() {
		return this.txtCountryName;
	}

	public void setTxtCountryName(String txtCountryName) {
		this.txtCountryName = txtCountryName;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mstcountry")
	public Set<Mststate> getMststates() {
		return this.mststates;
	}

	public void setMststates(Set<Mststate> mststates) {
		this.mststates = mststates;
	}

}
