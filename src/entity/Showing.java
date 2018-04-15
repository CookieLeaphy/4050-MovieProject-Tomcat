package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="showing")
public class Showing {
	@Id
	@Column(name="ID")
	private int ID;
	
	@Column(name="room")
	private int room;
	
	@Column(name="times")
	private int times;
	
	@Column(name="movie_ID")
	private int movie_ID;

	public Showing(int room, int times, int movie_ID) {
		this.room = room;
		this.times = times;
		this.movie_ID = movie_ID;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public int getMovie_ID() {
		return movie_ID;
	}

	public void setMovie_ID(int movie_ID) {
		this.movie_ID = movie_ID;
	}
}
