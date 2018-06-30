package SchemaGenerator;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
//import java.io.File; // if you use File
import java.io.IOException;
import java.io.InputStream;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;

public class SchemaValidator{
	
	public SchemaValidator(){}
	
	private final String schemaLocation = "C:\\Users\\Krisztian\\Desktop\\schema.xsd";
	private final String XMLLocation = "./file.xml";
	
	public void validate(){
		/*
		URL schemaFile = null;
		try {
			schemaFile = new URL("C:\\Users\\Krisztian\\Desktop\\schema.xsd");
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		*/
		
		File initialFile = new File(schemaLocation);
	    InputStream targetStream = null;
		try {
			targetStream = new FileInputStream(initialFile);
		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    
	    
		// webapp example xsd: 
		// URL schemaFile = new URL("http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd");
		// local file example:
		// File schemaFile = new File("/location/to/localfile.xsd"); // etc.
		Source xmlFile = new StreamSource(new File(XMLLocation));
		SchemaFactory schemaFactory = SchemaFactory
		    .newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
		try {
		  Schema schema = schemaFactory.newSchema(new StreamSource(targetStream));
		  Validator validator = schema.newValidator();
		  validator.validate(xmlFile);
		  System.out.println(xmlFile.getSystemId() + " is valid");
		} catch (SAXException e) {
		  System.out.println(xmlFile.getSystemId() + " is NOT valid reason:" + e);
		} catch (IOException e) {}
	}
}