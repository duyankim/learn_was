package kr.ac.poll.kopo03.domain;

public class Voter {
    private int id;
    private int age;
    private Candidate candidate;

	public Voter(int age, Candidate candidate) {
		this.candidate = candidate;
		this.age = age;
	}
    
    public Candidate getCandidate() {
		return candidate;
	}

	public void setCandidate(Candidate candidate) {
		this.candidate = candidate;
	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
