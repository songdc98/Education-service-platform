package com.daowen.vo;

import java.util.List;

public class ExamResultDTO {

    private int  paperId;
    private String paperName;
    private int hyid;
    private String hyName;


    private List<AnswerItem> answers;

    public int getPaperId() {
        return paperId;
    }

    @Override
    public String toString() {
        return "ExamResultDTO{" +
                "paperId=" + paperId +
                ", paperName='" + paperName + '\'' +
                ", hyid=" + hyid +
                ", hyName='" + hyName + '\'' +
                ", answers=" + answers +
                '}';
    }

    public void setPaperId(int paperId) {
        this.paperId = paperId;
    }

    public String getPaperName() {
        return paperName;
    }

    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public int getHyid() {
        return hyid;
    }

    public void setHyid(int hyid) {
        this.hyid = hyid;
    }

    public String getHyName() {
        return hyName;
    }

    public void setHyName(String hyName) {
        this.hyName = hyName;
    }

    public List<AnswerItem> getAnswers() {
        return answers;
    }

    public void setAnswers(List<AnswerItem> answers) {
        this.answers = answers;
    }

    public class AnswerItem{
        private int id;
        private int qType;
        private boolean hasDo;
        private String result;

        private int fenshu;

        public int getFenshu() {
            return fenshu;
        }

        public void setFenshu(int fenshu) {
            this.fenshu = fenshu;
        }


        private String stdaan;

        public String getStdaan() {
            return stdaan;
        }

        public void setStdaan(String stdaan) {
            this.stdaan = stdaan;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getqType() {
            return qType;
        }

        public void setqType(int qType) {
            this.qType = qType;
        }

        public boolean isHasDo() {
            return hasDo;
        }

        public void setHasDo(boolean hasDo) {
            this.hasDo = hasDo;
        }

        public String getResult() {
            return result;
        }

        public void setResult(String result) {
            this.result = result;
        }

        @Override
        public String toString() {
            return "AnswerItem{" +
                    "id=" + id +
                    ", qType=" + qType +
                    ", hasDo=" + hasDo +
                    ", result='" + result + '\'' +
                    '}';
        }
    }

}
