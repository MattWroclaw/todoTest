package pack;

import java.time.LocalDateTime;

public class Task {
    private String desk;
    private LocalDateTime finishDateAlfa;
    private String priority;

    public String getDesk() {
        return desk;
    }

    public void setDesk(String desk) {
        this.desk = desk;
    }

    public LocalDateTime getFinishDate() {
        return finishDateAlfa;
    }

    public void setFinishDate(LocalDateTime finishDate) {
        this.finishDateAlfa = finishDate;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }
}
