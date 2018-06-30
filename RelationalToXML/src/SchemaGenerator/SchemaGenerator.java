package SchemaGenerator;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.SchemaOutputResolver;

import SchemaGenerator.SchemaModel.Esport;

public class SchemaGenerator {
	public static void main(String[] args) throws IOException {
		
		FileInputStream fis = null;
		try {
	         // create new JAXB context
	         JAXBContext context = JAXBContext.newInstance(Esport.class);
	         
	         // create new schema out put resolver
	         SchemaOutputResolver sor = new LocationSpecifierSchemaOutputResolver();
	         
	         // generate schema
	         context.generateSchema(sor);
	         
	         // create new file
	         File fi = new File("C:\\Users\\Krisztian\\Desktop\\schema.xsd");
	         fis = new FileInputStream(fi);
	         
	         int i=0;
	         while((i=fis.read())!=-1)
	         {
	            char c=(char)i;
	            System.out.print(c);
	         }
	      }catch(Exception ex) {
	         
	         ex.printStackTrace();
	      }finally{
	         
	         if(fis!=null)
	            fis.close();
	      }
	   
	
		
		
		new SchemaValidator().validate();
	}
}
