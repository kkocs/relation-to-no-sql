package SchemaGenerator;

import java.io.File;
import java.io.IOException;

import javax.xml.bind.SchemaOutputResolver;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamResult;

public class LocationSpecifierSchemaOutputResolver extends SchemaOutputResolver {

    public Result createOutput(String namespaceURI, String suggestedFileName) throws IOException {
    	// Suggested file name comes from the system, we want to use our own.
    	File file = new File("c://Users//Krisztian//Desktop//schema.xsd");
        StreamResult result = new StreamResult(file);
        result.setSystemId(file.toURI().toURL().toString());
        return result;
    }

}