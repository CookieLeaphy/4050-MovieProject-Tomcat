package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="promos")
public class Promo {

	@Id
	@Column(name="ID")
	private int ID;
	
	@Column(name="code")
	private String code;
	
	@Column(name="type")
	private String type;
	
	@Column(name="amount")
	private double amount;

	public Promo() {
		this.code = "NA";
		this.type = "NA";
		this.amount = -1;
	}
	
	public Promo(String code, String type, double amount) {
		this.code = code;
		this.type = type;
		this.amount = amount;
	}

	public int getId() {
		return ID;
	}

	public void setId(int ID) {
		this.ID = ID;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getAmount() {
		return (int) amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
}
