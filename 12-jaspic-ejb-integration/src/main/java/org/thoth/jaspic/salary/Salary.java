package org.thoth.jaspic.salary;

public class Salary {
    protected double amount;
    protected String name;

    public Salary(double amount, String name) {
        this.amount = amount;
        this.name = name;
    }

    public double getAmount() {
        return amount;
    }

    public String getName() {
        return name;
    }

}
