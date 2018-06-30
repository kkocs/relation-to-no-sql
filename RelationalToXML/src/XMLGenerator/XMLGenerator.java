package XMLGenerator;

import java.io.File;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import DAL.DatabaseFetcher;
import Model.Contest.Contest;
import Model.Contest.Location;
import Model.Team.Team;
import Model.Team.TeamMember;
import SchemaGenerator.SchemaModel.Esport;


// Objects to XML another shorter solution
// http://www.admfactory.com/jaxb-hello-world-marshallingunmarshalling-example/

public class XMLGenerator {
	
	public static void main(String argv[]) {
	    try {
	    	 
	        JAXBContext context = JAXBContext.newInstance(Esport.class);
	        Marshaller marshaller = context.createMarshaller();
	 
	        /** output the XML in pretty format */
	        marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	 
			List<Team> teams = DatabaseFetcher.getTeams();
			List<Contest> contests = DatabaseFetcher.getContests();
			

	        Esport esport = new Esport();
	        esport.setContests(contests);
	        esport.setTeams(teams);
	        
	        /** display the output in the console */
	        StreamResult result = new StreamResult(new File("./file.xml"));
	        marshaller.marshal(esport, result);
	        
	        ///** put the XML to the file - will be used by the unmarshal example */
	        //marshaller.marshal(esport, new File("user.xml"));
	 
	    } catch (JAXBException e) {
	        e.printStackTrace();
	    }
    }

	
	
//	public static void main(String argv[]) {
//		try {
//	
//			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
//			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
//	
//			// root elements
//			Document doc = docBuilder.newDocument();
//			Element rootElement = doc.createElement("esport");
//			doc.appendChild(rootElement);
//	
//			// Teams
//			
//			Element teamsElement = doc.createElement("teams");
//			rootElement.appendChild(teamsElement);
//			
//			List<Team> teams = DatabaseFetcher.getTeams();
//			
//			Element teamElement;
//			for(Team team : teams){
//				teamElement = doc.createElement("team");
//				rootElement.appendChild(teamElement);	
//				
//				Element teamCode = doc.createElement("teamCode");
//				teamCode.appendChild(doc.createTextNode(Integer.toString(team.getTeamCode())));
//				teamElement.appendChild(teamCode);
//				
//				Element teamName = doc.createElement("teamName");
//				teamName.appendChild(doc.createTextNode(team.getTeamName()));
//				teamElement.appendChild(teamName);
//				
//				Element manager = doc.createElement("manager");
//				Element teamMember = doc.createElement("teamMember");
//								
//				Element personalNumericalCode = doc.createElement("personalNumericalCode");
//				personalNumericalCode.appendChild(doc.createTextNode(team.getManager().getPersonalNumericalCode()));
//				Element birthDate = doc.createElement("birthDate");
//				birthDate.appendChild(doc.createTextNode(team.getManager().getBirthDate().toString()));
//				Element age = doc.createElement("age");
//				age.appendChild(doc.createTextNode(Integer.toString(team.getManager().getAge())));
//				Element name = doc.createElement("name");
//				name.appendChild(doc.createTextNode(team.getManager().getName()));
//				
//				teamMember.appendChild(personalNumericalCode);
//				teamMember.appendChild(birthDate);
//				teamMember.appendChild(age);
//				teamMember.appendChild(name);
//				manager.appendChild(teamMember);
//				teamElement.appendChild(manager);
//
//				teamsElement.appendChild(teamElement);
//				
//
//				// Adding players.
//				Element playersElement = doc.createElement("players");
//				
//				for(TeamMember player : team.getPlayers()){
//					Element playerElement = doc.createElement("player");
//					Element playerTeamMember = doc.createElement("teamMember");
//					
//					Element playerPersonalNumericalCode = doc.createElement("personalNumericalCode");
//					playerPersonalNumericalCode.appendChild(doc.createTextNode(player.getPersonalNumericalCode()));
//					Element playerBirthDate = doc.createElement("birthDate");
//					playerBirthDate.appendChild(doc.createTextNode(player.getBirthDate().toString()));
//					Element playerAge = doc.createElement("age");
//					playerAge.appendChild(doc.createTextNode(Integer.toString(player.getAge())));
//					Element playerName = doc.createElement("name");
//					playerName.appendChild(doc.createTextNode(player.getName()));
//					
//					playerTeamMember.appendChild(playerPersonalNumericalCode);
//					playerTeamMember.appendChild(playerBirthDate);
//					playerTeamMember.appendChild(playerAge);
//					playerTeamMember.appendChild(playerName);
//					playerElement.appendChild(playerTeamMember);
//					playersElement.appendChild(playerElement);
//					
//				}
//				
//				teamElement.appendChild(playersElement);
//
//			}
//			
//			// Contests
//					
//			Element contestsElement = doc.createElement("contests");
//			rootElement.appendChild(contestsElement);
//			
//			List<Contest> contests = DatabaseFetcher.getContests();
//
//			for(Contest contest : contests){
//				
//				Element contestElement = doc.createElement("contest");
//				contestsElement.appendChild(contestElement);
//				
//				Location location = contest.getLocation();
//				
//				Element locationElement = doc.createElement("location");
//				Element locationCode = doc.createElement("code");
//				locationCode.appendChild(doc.createTextNode(Integer.toString(location.getLocationCode())));
//				Element locationName = doc.createElement("name");
//				locationName.appendChild(doc.createTextNode(location.getLocationName()));
//
//				locationElement.appendChild(locationCode);
//				locationElement.appendChild(locationName);
//				
//				contestElement.appendChild(locationElement);
//				
//				Element startDateElement = doc.createElement("startdate");
//				startDateElement.appendChild(doc.createTextNode(contest.getStartDate().toString()));
//				contestElement.appendChild(startDateElement);
//
//				Element endDateElement = doc.createElement("enddate");
//				endDateElement.appendChild(doc.createTextNode(contest.getEndDate().toString()));				
//				contestElement.appendChild(endDateElement);
//				
//				Element participantsElement = doc.createElement("participants");
//				contestElement.appendChild(participantsElement);
//				
//				for(int code : contest.getParticipantTeamsCode()){
//					Element participantTeamCodeElement = doc.createElement("teamcode");
//					participantTeamCodeElement.appendChild(doc.createTextNode(Integer.toString(code)));
//					participantsElement.appendChild(participantTeamCodeElement);
//				}
//				
//			}
//
//			/*
//			
//			// staff elements
//			Element staff = doc.createElement("Staff");
//			rootElement.appendChild(staff);
//
//			// set attribute to staff element
//			Attr attr = doc.createAttribute("id");
//			attr.setValue("1");
//			staff.setAttributeNode(attr);
//
//			// shorten way
//			// staff.setAttribute("id", "1");
//	
//			// firstname elements
//			Element firstname = doc.createElement("firstname");
//			firstname.appendChild(doc.createTextNode("yong"));
//			staff.appendChild(firstname);
//	
//			// lastname elements
//			Element lastname = doc.createElement("lastname");
//			lastname.appendChild(doc.createTextNode("mook kim"));
//			staff.appendChild(lastname);
//	
//			// nickname elements
//			Element nickname = doc.createElement("nickname");
//			nickname.appendChild(doc.createTextNode("mkyong"));
//			staff.appendChild(nickname);
//	
//			// salary elements
//			Element salary = doc.createElement("salary");
//			salary.appendChild(doc.createTextNode("100000"));
//			staff.appendChild(salary);
//	
//			*/
//	
//			// write the content into xml file
//			TransformerFactory transformerFactory = TransformerFactory.newInstance();
//			Transformer transformer = transformerFactory.newTransformer();
//			DOMSource source = new DOMSource(doc);
//			StreamResult result = new StreamResult(new File("./file.xml"));
//	
//	
//			// Output to console for testing
//			// StreamResult result = new StreamResult(System.out);
//
//			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
//			transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
//	
//			transformer.transform(source, result);
//			
//		
//			System.out.println("File saved!");
//
//	  } catch (ParserConfigurationException pce) {
//		  pce.printStackTrace();
//	  } catch (TransformerException tfe) {
//		  tfe.printStackTrace();
//	  }
//	}
//	
}
