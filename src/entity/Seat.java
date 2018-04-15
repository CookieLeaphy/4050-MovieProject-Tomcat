package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="seat")
public class Seat {
	@Id
	@Column(name="ID")
	private int ID;
	
	@Column(name="rowNum")
	private int rowNum;
	
	@Column(name="seatNum")
	private int seatNum;
	
	@Column(name="availability")
	private int availability;
	
	@Column(name="buyer")
	private int buyer;

	public Seat(int rowNum, int seatNum, int availability, int buyer) {
		this.rowNum = rowNum;
		this.seatNum = seatNum;
		this.availability = availability;
		this.buyer = buyer;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(int seatNum) {
		this.seatNum = seatNum;
	}

	public int getAvailability() {
		return availability;
	}

	public void setAvailability(int availability) {
		this.availability = availability;
	}

	public int getBuyer() {
		return buyer;
	}

	public void setBuyer(int buyer) {
		this.buyer = buyer;
	}
}
