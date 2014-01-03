package diarytext

class Diary {
    static searchable = true
    static constraints = {
        user()
        text()
        lastUpdated()
    }

    static mapping = {
        sort "lastUpdated"
    }

    static belongsTo = [user:User]

    int parentId=0
    String text
    Date lastUpdated
    Date dateCreated
    public String toString(){
        return text;
    }
}
