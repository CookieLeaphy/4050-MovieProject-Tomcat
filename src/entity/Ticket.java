package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ticket")
public class Ticket {
	@Id
	@Column(name="ID")
	private int ID;
	
	@Column(name="showing_ID")
	private int showing_ID;
	
	@Column(name="price")
	private double price;
	
	@Column(name="purchaser")
	private int purchaser;
	
	@Column(name="ticketType")
	private String ticketType;
	
	@Column(name="auditorium")
	private int auditorium;
	
	@Column(name="seat_ID")
	private int seat_ID;

	public Ticket(int showing_ID, double price, int purchaser, String ticketType, int auditorium, int seat_ID) {
		this.showing_ID = showing_ID;
		this.price = price;
		this.purchaser = purchaser;
		this.ticketType = ticketType;
		this.auditorium = auditorium;
		this.seat_ID = seat_ID;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getShowing_ID() {
		return showing_ID;
	}

	public void setShowing_ID(int showing_ID) {
		this.showing_ID = showing_ID;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getPurchaser() {
		return purchaser;
	}

	public void setPurchaser(int purchaser) {
		this.purchaser = purchaser;
	}

	public String getTicketType() {
		return ticketType;
	}

	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}

	public int getAuditorium() {
		return auditorium;
	}

	public void setAuditorium(int auditorium) {
		this.auditorium = auditorium;
	}

	public int getSeat_ID() {
		return seat_ID;
	}

	public void setSeat_ID(int seat_ID) {
		this.seat_ID = seat_ID;
	}
}
