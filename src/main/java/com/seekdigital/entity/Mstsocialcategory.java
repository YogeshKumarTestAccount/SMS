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
 * Mstsocialcategory generated by hbm2java
 */
@Entity
@Table(name = "mstsocialcategory", catalog = "dbschoolmanagementsystem")
public class Mstsocialcategory implements java.io.Serializable {

	private Integer intSocialCategoryId;
	private String txtSocialCategory;
	private Set<Mstregistration> mstregistrations = new HashSet<Mstregistration>(0);

	public Mstsocialcategory() {
	}

	public Mstsocialcategory(String txtSocialCategory, Set<Mstregistration> mstregistrations) {
		this.txtSocialCategory = txtSocialCategory;
		this.mstregistrations = mstregistrations;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "intSocialCategoryId", unique = true, nullable = false)
	public Integer getIntSocialCategoryId() {
		return this.intSocialCategoryId;
	}

	public void setIntSocialCategoryId(Integer intSocialCategoryId) {
		this.intSocialCategoryId = intSocialCategoryId;
	}

	@Column(name = "txtSocialCategory", length = 50)
	public String getTxtSocialCategory() {
		return this.txtSocialCategory;
	}

	public void setTxtSocialCategory(String txtSocialCategory) {
		this.txtSocialCategory = txtSocialCategory;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "mstsocialcategory")
	public Set<Mstregistration> getMstregistrations() {
		return this.mstregistrations;
	}

	public void setMstregistrations(Set<Mstregistration> mstregistrations) {
		this.mstregistrations = mstregistrations;
	}

}
