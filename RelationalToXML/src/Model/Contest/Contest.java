package Model.Contest;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlSchemaType;

public class Contest {
	public List<Integer> getParticipantTeamsCode() {
		return participantTeamsCode;
	}

	@XmlElementWrapper(name="participantTeamsCodes")
	@XmlElement
	public void setParticipantTeamsCode(List<Integer> participantTeamsCode) {
		this.participantTeamsCode = participantTeamsCode;
	}

	public Date getStartDate() {
		return startDate;
	}


	@XmlElement
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	@XmlSchemaType(name = "date")
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Location getLocation() {
		return location;
	}

	private Location location;
	private List<Integer> participantTeamsCode;
	private Date startDate;
	private Date endDate;
	
	public Contest(){
		participantTeamsCode = new ArrayList<Integer>();
	}
	
	@XmlElement
	public void setLocation(Location location){
		this.location = location;
	}
	
	public void addParticipantTeamCode(int teamCode){
		this.participantTeamsCode.add(teamCode);
	}
	
}
