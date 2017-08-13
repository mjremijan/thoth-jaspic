package org.thoth.jaspic.customersupport;

import javax.faces.bean.SessionScoped;
import javax.inject.Named;

@Named(value = "contractDetails")
@SessionScoped
public class ContractDetails {
    protected String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
