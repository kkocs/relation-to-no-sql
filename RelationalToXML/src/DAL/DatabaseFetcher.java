package DAL;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import Model.Contest.Contest;
import Model.Contest.Location;
import Model.Team.Team;
import Model.Team.TeamMember;
/**
 * A Java MySQL SELECT statement example.
 * Demonstrates the use of a SQL SELECT statement against a
 * MySQL database, called from a Java program.
 * 
 * Created by Alvin Alexander, http://alvinalexander.com
 */
public class DatabaseFetcher
{
	
	public static List<Contest> getContests() {
		try
		{
			Locale currentLocale 		= new Locale("en", "GB");
			ResourceBundle configBundle = 	 ResourceBundle.getBundle("Config.ConfigBundle", currentLocale);
			String dbPassword 			= configBundle.getString("password");
			String dbUsername 			= configBundle.getString("username");
			String dbName 				= configBundle.getString("database");

			// Creating the mysql database connection.
			String myDriver = "com.mysql.jdbc.Driver";
			String myUrl = "jdbc:mysql://localhost/" + dbName;
			Class.forName(myDriver);

			Connection conn = DriverManager.getConnection(myUrl, dbUsername, dbPassword);

			// SQL SELECT query. 
			// If you only need a few columns, specify them by name instead of using "*"
			String contestsQuery = 
			"SELECT helyszinek.helyszin_kod, resztvesz.csapat_kod AS resztvevo_csapat_kod, helyszinek.helyszin_nev, versenyek.verseny_kod, versenyek.kezdo_datum, versenyek.donto_datum " +
			"FROM versenyek " + 
			"JOIN helyszinek ON versenyek.helyszin_kod = helyszinek.helyszin_kod " +
			"JOIN resztvesz ON resztvesz.verseny_kod = versenyek.verseny_kod";

			// create the java statement
			Statement st = conn.createStatement();
			
			// execute the query, and get a java resultset
			ResultSet rs = st.executeQuery(contestsQuery);

			// Iterate through the java resultset and get the Contests.
			List<Contest> contests = new ArrayList<Contest>();
			int elozoVersenyKod = -1;
			while (rs.next())
			{
				int helyszin_kod = rs.getInt("helyszin_kod");
				int resztvevo_csapat_kod = rs.getInt("resztvevo_csapat_kod");
				String helyszin_nev = rs.getString("helyszin_nev");
				int verseny_kod = rs.getInt("verseny_kod");
				Date kezdo_datum = rs.getDate("kezdo_datum");
				Date donto_datum = rs.getDate("donto_datum");
				
				if (elozoVersenyKod != verseny_kod) {
					Location location = new Location();
					location.setLocationCode(helyszin_kod);
					location.setLocationName(helyszin_nev);
					
					Contest contest = new Contest();
					contest.setLocation(location);
					contest.setStartDate(kezdo_datum);
					contest.setEndDate(donto_datum);
					contest.addParticipantTeamCode(resztvevo_csapat_kod);
					
					contests.add(contest);
					
				} else {
					int lastContestIndex = contests.size() - 1;
					contests.get(lastContestIndex).addParticipantTeamCode(resztvevo_csapat_kod);
				}
				
				elozoVersenyKod = verseny_kod;
				
				// Continue from there.
							
				// Print the results.
				System.out.format("%d, %d, %s, %d, %s, %s\n", helyszin_kod, resztvevo_csapat_kod, helyszin_nev, verseny_kod, kezdo_datum.toString(), donto_datum.toString());
			}
			st.close();
			return contests;
		}
		catch (Exception e)
		{
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
			return null;
		}
	}

	public static List<Team> getTeams(){
		try
		{
			Locale currentLocale = new Locale("en", "GB");
			ResourceBundle configBundle = ResourceBundle.getBundle("Config.ConfigBundle", currentLocale);
			String dbPassword = configBundle.getString("password");
			String dbUsername = configBundle.getString("username");
			String dbName = configBundle.getString("database");

			// Creating the mysql database connection.
			String myDriver = "com.mysql.jdbc.Driver";
			String myUrl = "jdbc:mysql://localhost/" + dbName;
			Class.forName(myDriver);

			Connection conn = DriverManager.getConnection(myUrl, dbUsername, dbPassword);

			// SQL SELECT query. 
			// If you only need a few columns, specify them by name instead of using "*"
			String csapatokQuery = "SELECT csapatok.csapat_kod, csapatok.csapat_nev, managerSzemely.szemelyi_szam AS managerSZSZ, managerSzemely.szuletesi_datum AS managerSzul, managerSzemely.kor AS managerKor, managerSzemely.nev AS managerNev, szemelyek.szemelyi_szam, szemelyek.szuletesi_datum, szemelyek.kor, szemelyek.nev " +
			"FROM csapatok " +
			"JOIN tagja ON csapatok.csapat_kod = tagja.csapat_kod " +
			"JOIN szemelyek ON szemelyek.szemelyi_szam = tagja.szemelyi_szam " +
			"JOIN managere ON managere.csapat_kod = csapatok.csapat_kod " +
			"JOIN szemelyek AS managerSzemely ON managerSzemely.szemelyi_szam = managere.szemelyi_szam";

			// create the java statement
			Statement st = conn.createStatement();
			
			// execute the query, and get a java resultset
			ResultSet rs = st.executeQuery(csapatokQuery);

			// Iterate through the java resultset and create the Team.

			String previousTeamName = null;
			List<Team> teams = new ArrayList<Team>();
			while (rs.next())
			{
				int csapat_kod = rs.getInt("csapat_kod");
				String csapat_nev = rs.getString("csapat_nev");
				String managerSZSZ = rs.getString("managerSZSZ");
				Date managerSzul = rs.getDate("managerSzul");
				int managerKor = rs.getInt("managerKor");
				String managerNev = rs.getString("managerNev");
				String szemelyi_szam = rs.getString("szemelyi_szam");
				Date szuletesi_datum = rs.getDate("szuletesi_datum");
				int kor = rs.getInt("kor");
				String nev = rs.getString("nev");
				
				TeamMember player = new TeamMember();
				TeamMember manager = new TeamMember();
				
				manager.setTeamName(csapat_nev);
				manager.setPersonalNumericalCode(managerSZSZ);
				manager.setBirthDate(managerSzul);
				manager.setAge(managerKor);
				manager.setName(managerNev);

				player.setTeamName(csapat_nev);
				player.setPersonalNumericalCode(szemelyi_szam);
				player.setBirthDate(szuletesi_datum);
				player.setAge(kor);
				player.setName(nev);
				
				// If we are at the first team or we have reached a new team.
				if (previousTeamName == null || !player.getTeamName().equals(previousTeamName)) {
					Team team = new Team(csapat_kod);
					teams.add(team);
				}
				int teamsLastIndex = teams.size()-1;
				teams.get(teamsLastIndex).addPlayer(player);
				teams.get(teamsLastIndex).setManager(manager);
				teams.get(teamsLastIndex).setTeamName(csapat_nev);
				
				// Continue from there.
				
				
				previousTeamName = player.getTeamName();
				
				// Print the results.
				System.out.format("%d, %s, %s, %s, %d %s %s %s %d %s\n", csapat_kod, csapat_nev, managerSZSZ, managerSzul.toString(), managerKor, managerNev, szemelyi_szam, szuletesi_datum, kor, nev);
			}
			st.close();
			return teams;
		}
		catch (Exception e)
		{
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
			return null;
		}
	}
	
	public static void main(String[] args)
	{
		// List<Contest> contests = DatabaseFetcher.getContests();
		// System.out.println(contests);
		
		List<Team> teams = DatabaseFetcher.getTeams();
		System.out.println(teams);
	}
	
	public static void printIdde(String[] args)
	{
		try
		{
			Locale currentLocale = new Locale("en", "GB");
			ResourceBundle configBundle = ResourceBundle.getBundle("Config.ConfigBundle", currentLocale);
			String dbPassword = configBundle.getString("password");
			String dbUsername = configBundle.getString("username");
			String dbName = configBundle.getString("database");

			// Creating the mysql database connection.
			String myDriver = "com.mysql.jdbc.Driver";
			String myUrl = "jdbc:mysql://localhost/" + dbName;
			Class.forName(myDriver);

			Connection conn = DriverManager.getConnection(myUrl, dbUsername, dbPassword);

			// SQL SELECT query. 
			// If you only need a few columns, specify them by name instead of using "*"
			String query = "SELECT * FROM users";

			// create the java statement
			Statement st = conn.createStatement();

			// execute the query, and get a java resultset
			ResultSet rs = st.executeQuery(query);

			// iterate through the java resultset
			while (rs.next())
			{
				String email = rs.getString("email");
				String password = rs.getString("password");
				int userId = rs.getInt("user_id");
				String userName = rs.getString("user_name");

				// print the results
				System.out.format("%s, %s, %d, %s\n", email, password, userId, userName);
			}
			st.close();
		}
		catch (Exception e)
		{
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
	}
}