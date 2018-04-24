package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="user_type")
	private int user_type;
	
	@Column(name="userName")
	private String userName;
	
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="pass")
	private String pass;
	
	@Column(name="address")
	private String address;
	
	@Column(name="city")
	private String city;
	
	@Column(name="zip")
	private int zip;
	
	@Column(name="country")
	private String country;
	
	@Column(name="email")
	private String email;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="newsSub")
	private int newsSub;
	
	@Column(name="promoSub")
	private int promoSub;
	
	@Column(name="confirmation")
	private int confirmation;

	public User() {
		this.user_type = -1;
	}
	public User(int user_type, String userName, String firstName, String lastName, String pass, String address,
			String city, int zip, String country, String email, String phone, int newsSub, int promoSub,
			int confirmation) {
		this.user_type = user_type;
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.pass = pass;
		this.address = address;
		this.city = city;
		this.zip = zip;
		this.country = country;
		this.email = email;
		this.phone = phone;
		this.newsSub = newsSub;
		this.promoSub = promoSub;
		this.confirmation = confirmation;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getNewsSub() {
		return newsSub;
	}

	public void setNewsSub(int newsSub) {
		this.newsSub = newsSub;
	}

	public int getPromoSub() {
		return promoSub;
	}

	public void setPromoSub(int promoSub) {
		this.promoSub = promoSub;
	}

	public int getConfirmation() {
		return confirmation;
	}

	public void setConfirmation(int confirmation) {
		this.confirmation = confirmation;
	}
	
	public String toString() {
		return this.user_type 
				+" "+this.userName 
				+" "+this.firstName 
				+" "+this.lastName 
				+" "+this.pass 
				+" "+this.address 
				+" "+this.city 
				+" "+this.zip 
				+" "+this.country 
				+" "+this.email +" "
				+this.phone +" "+
				this.newsSub +" "+
				this.promoSub +" "+
				this.confirmation;
	}
}
