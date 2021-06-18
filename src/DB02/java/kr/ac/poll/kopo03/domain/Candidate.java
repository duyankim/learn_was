package kr.ac.poll.kopo03.domain;

import java.util.List;

public class Candidate {
    private int id;
    private String name;
    
	public Candidate(int id, String name) {
		this.id = id;
		this.name = name;
	}

	public Candidate(int id) {
		this.id = id;
	}
	
	public Candidate(String name) {
		this.name = name;
	}
	
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
