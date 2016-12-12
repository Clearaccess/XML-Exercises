import org.xml.sax.SAXException;

import javax.xml.XMLConstants;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import java.io.File;
import java.io.IOException;

/**
 * Created by Aleksandr_Vaniukov on 12/12/2016.
 */
public class Validate {
    public static void main(String[] args){
        String language= XMLConstants.W3C_XML_SCHEMA_NS_URI;
        String fileName="D:\\Projects\\XML_Task1\\src\\test.xml";
        String schemaName="D:\\Projects\\XML_Task1\\src\\testSchema.xsd";
        SchemaFactory factory=SchemaFactory.newInstance(language);
        File schemaLocation=new File(schemaName);

        try {
            Schema schema=factory.newSchema(schemaLocation);

            Validator validator=schema.newValidator();

            Source source=new StreamSource(fileName);
            validator.validate(source);
            System.out.println("Is valid");
        } catch (SAXException e) {
            System.out.println("No valid "+e.getMessage());
        } catch (IOException e) {
            System.out.println("No valid "+e.getMessage());
        }
    }
}
