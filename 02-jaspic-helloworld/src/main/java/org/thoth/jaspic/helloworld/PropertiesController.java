package org.thoth.jaspic.helloworld;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Properties;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;


@Named
@RequestScoped
public class PropertiesController implements Serializable {
    private static final long serialVersionUID = 1244515345L;

    private Properties props;

    @PostConstruct
    protected void postConstruct()
    {
        props
            = new Properties();

        try (InputStream is = this.getClass().getClassLoader().getResourceAsStream("some.properties");
        ) {
            props.load(is);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String getProjectArtifactId() {
        return props.getProperty("maven.project.artifactId");
    }
}
