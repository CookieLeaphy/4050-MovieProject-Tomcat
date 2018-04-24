package entity;

import java.util.Date;

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
	
	@Column(name="link")
	private String link;
	
	@Column(name="description")
	private String description;
	
	@Column(name="releaseDate")
	private Date releaseDate;
	
	public Movie() {
		ID = -1; //invalid movie
		this.rating = "NA";
		this.title = "NA";
		this.producer = "NA";
		this.director = "NA";
		this.genre = "NA";
		this.trailor = "NA";
		this.link = "NA";
		this.description = "NA";
	}

	public Movie(String rating, String title, String producer, String director, String genre,
			String trailor, String link, String description) {
		this.rating = rating;
		this.title = title;
		this.producer = producer;
		this.director = director;
		this.genre = genre;
		this.trailor = trailor;
		this.link = link;
		this.description = description;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
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
	
	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getDescriptionStart() {
		//Return first n=200 characters or entire description if description.length() < 200
		int n = 100;
		String descriptionStart = "";
		if(description.length() < n)
			descriptionStart = description;
		else
			descriptionStart = description.substring(0, n) + "...";
		return descriptionStart;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Date getReleaseDate() {
		return releaseDate;
	}
	
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public String toString() {
		String str = this.rating + " "+
					 this.title + " "+
					 this.producer + " "+
					 this.director + " "+
					 this.genre + " "+
					 this.trailor + " " +
					 this.link ;
		return  "Movie: "+str; 
	}
}
