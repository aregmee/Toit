package toit

class Opinion {

    ExtendedUser user
    String opinion
    Date date = new Date()
    Tag tag
    long agreeCount = 0
    long disagreeCount = 0

    static constraints = {

        user nullable: false
        opinion minSize: 2, maxSize: 131, nullable: false, blank: false
        tag nullable: false, blank: false
    }
    static mapping = {

        version false
    }
}
