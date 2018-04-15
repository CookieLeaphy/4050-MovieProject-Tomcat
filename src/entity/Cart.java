package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cart")
public class Cart {
	@Id
	@Column(name="ID")
	private int ID;
	
	@Column(name="cartCode")
	private String cartCode;
	
	@Column(name="totalPrice")
	private double totalPrice;
	
	@Column(name="Ticket_ID")
	private int Ticket_ID;

	public Cart(String cartCode, double totalPrice, int ticket_ID) {
		this.cartCode = cartCode;
		this.totalPrice = totalPrice;
		Ticket_ID = ticket_ID;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getCartCode() {
		return cartCode;
	}

	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTicket_ID() {
		return Ticket_ID;
	}

	public void setTicket_ID(int ticket_ID) {
		Ticket_ID = ticket_ID;
	}
}
