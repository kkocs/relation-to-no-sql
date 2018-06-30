package SchemaGenerator.SchemaModel;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

import Model.Contest.Contest;
import Model.Team.Team;

@XmlRootElement(name="esport")
public class Esport {

	public List<Contest> getContests() {
		return contests;
	}

	@XmlElement(name="contest", type=Contest.class)
	@XmlElementWrapper(name="contests")
	public void setContests(List<Contest> contests) {
		this.contests = contests;
	}

	public List<Team> getTeams() {
		return teams;
	}
	
	@XmlElement(name="team", type=Team.class)
	@XmlElementWrapper(name="teams")
	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	private List<Team> teams;
	private List<Contest> contests;
	
}
