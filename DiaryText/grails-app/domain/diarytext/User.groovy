package diarytext

class User {
    static constraints = {
        userName()
        password()
    }

    String userName
    String password
    Date createDate = new Date()
    static hasMany=[diaries:Diary]

    public String toString(){
        return userName
    }

}
