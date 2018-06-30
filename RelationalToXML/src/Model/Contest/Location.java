package Model.Contest;

import javax.xml.bind.annotation.XmlElement;

public class Location {
	public int getLocationCode() {
		return locationCode;
	}

	public String getLocationName() {
		return locationName;
	}

	int locationCode;
	String locationName;
	
	public Location(){}
	
	@XmlElement
	public void setLocationCode(int locationCode){
		this.locationCode = locationCode;
	}
	
	@XmlElement
	public void setLocationName(String locationName){
		this.locationName = locationName;
	}
}
