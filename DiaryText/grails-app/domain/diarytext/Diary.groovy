package diarytext

class Diary {

    static constraints = {
        user()
        text()
        lastModify()
    }

    static belongsTo = [user:User]

    int parentId;
    String text;
    Date lastModify;

    public String toString(){
        return user.userName+"\r\n"+text;
    }
}
