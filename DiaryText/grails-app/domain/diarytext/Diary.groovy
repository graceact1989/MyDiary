package diarytext

class Diary {
    static searchable = true
    static constraints = {
        user()
        text()
        lastUpdated()
    }

    static belongsTo = [user:User]

    int parentId
    String text
    Date lastUpdated
    Date dateCreated
    public String toString(){
        return "\r\n"+text;
    }
}
