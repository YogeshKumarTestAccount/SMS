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
 * Mstdisabilitychild generated by hbm2java
 */
@Entity
@Table(name = "mstdisabilitychild", catalog = "dbschoolmanagementsystem")
public class Mstdisabilitychild implements java.io.Serializable {

	private Integer intDisabilityChildId;
	private String txtDisability;
	private Set<Mstregistration> mstregistrations = new HashSet<Mstregistration>(0);

	public Mstdisabilitychild() {
	}

	public Mstdisabilitychild(String txtDisability, Set<Mstregistration> mstregistrations) {
		this.txtDisability = txtDisability;
		this.mstregistrations = mstregistrations;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intDisabilityChildId", unique = true, nullable = false)
	public Integer getIntDisabilityChildId() {
		return this.intDisabilityChildId;
	}

	public void setIntDisabilityChildId(Integer intDisabilityChildId) {
		this.intDisabilityChildId = intDisabilityChildId;
	}

	@Column(name = "txtDisability", length = 50)
	public String getTxtDisability() {
		return this.txtDisability;
	}

	public void setTxtDisability(String txtDisability) {
		this.txtDisability = txtDisability;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mstdisabilitychild")
	public Set<Mstregistration> getMstregistrations() {
		return this.mstregistrations;
	}

	public void setMstregistrations(Set<Mstregistration> mstregistrations) {
		this.mstregistrations = mstregistrations;
	}

}
