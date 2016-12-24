package toit

class Tag {

    String name
    Long minusCount = 0L
    Long plusCount = 0L

    static constraints = {

        name blank: false, nullable: false, minSize: 1, maxSize: 130
        minusCount min: 0 as Long
        plusCount min: 0 as Long
    }

    static mapping = {
        version false
    }
}
