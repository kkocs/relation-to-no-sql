package Model.Team;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

import Model.Contest.Contest;

public class Team {
	
	public Team() {
		
	}

	public String getTeamName() {
		return teamName;
	}

	@XmlElement
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public int getTeamCode() {
		return teamCode;
	}
	
	@XmlElement
	public void setTeamCode(int teamCode) {
		this.teamCode = teamCode;
	}

	public List<TeamMember> getPlayers() {
		return players;
	}

	@XmlElementWrapper(name="players")
	@XmlElement(name="player", type=TeamMember.class)
	public void setPlayers(List<TeamMember> players) {
		this.players = players;
	}

	public TeamMember getManager() {
		return manager;
	}

	private int teamCode;
	private String teamName;
	private TeamMember manager;
	private List<TeamMember> players;

	public Team(int teamCode){
		this.teamCode = teamCode;
		players = new ArrayList<TeamMember>();
	}

	@XmlElement(name="manager", type=TeamMember.class)
	public void setManager(TeamMember manager){
		this.manager = manager;
	}

	public void addPlayer(TeamMember player){
		this.players.add(player);
	}
}
