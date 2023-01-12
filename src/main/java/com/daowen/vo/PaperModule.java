package com.daowen.vo;



import java.util.List;

public class PaperModule<T> {

    private List<T>  questions;
    /**
     * 题目类型
     * 1 单选题
     * 2 判断题
     * 3 填空题
     * 4 简单题
     */
    private  int   type;


    public List<T> getQuestions() {
        return questions;
    }

    public int getType() {
        return type;
    }

    public PaperModule(int type, List<T> questions){
        this.questions=questions;
        this.type=type;
    }


}
