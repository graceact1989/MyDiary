package diarytext

class User {
    static constraints = {
        userName()
        password(password:true)
    }

    String userName
    String password
    Date dateCreated
    static hasMany=[diaries:Diary]

    def beforeInsert={
        password = password.encodeAsSHA1()
    }

    public String toString(){
        return userName
    }

}
