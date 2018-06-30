package Model.Idde;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

public class User {

	private int user_id;
	private String email;
	private String user_name;
	private String password;
	
	public int getUser_id() {
		return user_id;
	}
	
	@XmlElement
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	public String getEmail() {
		return email;
	}
	
	@XmlElement
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getUser_name() {
		return user_name;
	}
	
	@XmlElement
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getPassword() {
		return password;
	}
	
	@XmlAttribute
	public void setPassword(String password) {
		this.password = password;
	}
}
