package com.house730.admin.pojo;

public class Sequence {
    private String seqName;

    private Long currentValue;

    private Long increment;

    public Sequence(String seqName, Long currentValue, Long increment) {
        this.seqName = seqName;
        this.currentValue = currentValue;
        this.increment = increment;
    }

    public Sequence() {
        super();
    }

    public String getSeqName() {
        return seqName;
    }

    public void setSeqName(String seqName) {
        this.seqName = seqName == null ? null : seqName.trim();
    }

    public Long getCurrentValue() {
        return currentValue;
    }

    public void setCurrentValue(Long currentValue) {
        this.currentValue = currentValue;
    }

    public Long getIncrement() {
        return increment;
    }

    public void setIncrement(Long increment) {
        this.increment = increment;
    }
}