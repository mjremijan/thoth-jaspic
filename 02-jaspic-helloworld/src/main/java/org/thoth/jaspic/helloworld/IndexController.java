package org.thoth.jaspic.helloworld;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;


@Named
@RequestScoped
public class IndexController implements Serializable {
    private static final long serialVersionUID = 1244514523L;
    public String getTimestamp() {
        return new SimpleDateFormat("dd-M-yyyy hh:mm:ss").format(Calendar.getInstance().getTime());
    }
}
