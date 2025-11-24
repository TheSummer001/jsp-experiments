package com.toran.bean;

import java.io.Serializable;

public class Calculator implements Serializable {
    private double num1 = 0;
    private double num2 = 0;
    private String operator = "+";
    private double result = 0;

    // 计算逻辑
    public void calculate() {
        switch (operator) {
            case "+": result = num1 + num2; break;
            case "-": result = num1 - num2; break;
            case "*": result = num1 * num2; break;
            case "/":
                if (num2 != 0) result = num1 / num2;
                else result = 0;
                break;
        }
    }

    // Getters and Setters
    public double getNum1() { return num1; }
    public void setNum1(double num1) { this.num1 = num1; }
    public double getNum2() { return num2; }
    public void setNum2(double num2) { this.num2 = num2; }
    public String getOperator() { return operator; }
    public void setOperator(String operator) { this.operator = operator; }
    public double getResult() { return result; }
    public void setResult(double result) { this.result = result; }
}