package Model.Team;

import java.sql.Date;

import javax.xml.bind.annotation.XmlElement;

public class TeamMember {
	
	public String getTeamName() {
		return teamName;
	}

	@XmlElement
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getPersonalNumericalCode() {
		return personalNumericalCode;
	}

	@XmlElement
	public void setPersonalNumericalCode(String personalNumericalCode) {
		this.personalNumericalCode = personalNumericalCode;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	@XmlElement
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public int getAge() {
		return age;
	}

	@XmlElement
	public void setAge(int age) {
		this.age = age;
	}

	public String getName() {
		return Name;
	}

	@XmlElement
	public void setName(String name) {
		Name = name;
	}

	private String teamName;
	private String personalNumericalCode;
	
	
	private Date birthDate;
	private int age;
	private String Name;
	
	public TeamMember(){}
	
}
