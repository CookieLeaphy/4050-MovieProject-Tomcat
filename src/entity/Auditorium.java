package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="auditorium")
public class Auditorium {
	@Id
	@Column(name="ID")
	private int ID;
	
	@Column(name="aName")
	private String aName;
	
	@Column(name="capacity")
	private int capacity;
	
	@Column(name="rowNum")
	private String rowNum;
	
	@Column(name="moviePlaying")
	private int moviePlaying;
	
	@Column(name="movieQueue")
	private String movieQueue;

	public Auditorium(String aName, int capacity, String rowNum, int moviePlaying, String movieQueue) {
		this.aName = aName;
		this.capacity = capacity;
		this.rowNum = rowNum;
		this.moviePlaying = moviePlaying;
		this.movieQueue = movieQueue;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getRowNum() {
		return rowNum;
	}

	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}

	public int getMoviePlaying() {
		return moviePlaying;
	}

	public void setMoviePlaying(int moviePlaying) {
		this.moviePlaying = moviePlaying;
	}

	public String getMovieQueue() {
		return movieQueue;
	}

	public void setMovieQueue(String movieQueue) {
		this.movieQueue = movieQueue;
	}
}
