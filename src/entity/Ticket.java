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

	@Column(name="movie_ID")
	private int movie_ID;
	
	@Column(name="price")
	private int price;
	
	@Column(name="purchaser")
	private String purchaser;
	
	@Column(name="ticketType")
	private String ticketType;
	
	@Column(name="auditorium")
	private int auditorium;
	
	@Column(name="seat_ID")
	private String seat_ID;

	public Ticket() {
		this.ID = -1;
		this.showing_ID = -1;
		this.movie_ID = -1;
		this.price = -1;
		this.purchaser = "NA";
		this.ticketType = "NA";
		this.auditorium = -1;
		this.seat_ID = "NA";
	}
	
	public Ticket(int showing_ID, int movie_ID, int price, String purchaser, String ticketType, int auditorium, String seat_ID) {
		//this.ID = 1;
		this.showing_ID = showing_ID;
		this.movie_ID = movie_ID;
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

	
	public int getMovie_ID() {
		return movie_ID;
	}

	public void setMovie_ID(int movie_ID) {
		this.movie_ID = movie_ID;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPurchaser() {
		return purchaser;
	}

	public void setPurchaser(String purchaser) {
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

	public String getSeat_ID() {
		return seat_ID;
	}

	public void setSeat_ID(String seat_ID) {
		this.seat_ID = seat_ID;
	}
}
