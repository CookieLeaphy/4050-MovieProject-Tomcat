package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="movie")
public class Movie {
	@Id
	@Column(name="ID")
	private int ID;
	
	@Column(name="showing")
	private String showing;
	
	@Column(name="rating")
	private String rating;
	
	@Column(name="title")
	private String title;
	
	@Column(name="producer")
	private String producer;
	
	@Column(name="director")
	private String director;
	
	@Column(name="genre")
	private String genre;
	
	@Column(name="trailor")
	private String trailor;
	
	public Movie() {
		ID = -1; //invalid movie
	}

	public Movie(String showing, String rating, String title, String producer, String director, String genre,
			String trailor) {
		this.showing = showing;
		this.rating = rating;
		this.title = title;
		this.producer = producer;
		this.director = director;
		this.genre = genre;
		this.trailor = trailor;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getShowing() {
		return showing;
	}

	public void setShowing(String showing) {
		this.showing = showing;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getTrailor() {
		return trailor;
	}

	public void setTrailor(String trailor) {
		this.trailor = trailor;
	}
}
