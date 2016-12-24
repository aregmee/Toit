package toit

class Disagree {

    ExtendedUser user
    Opinion opinion

    static constraints = {

        user nullable: false
        opinion nullable: false
    }

    static mapping = {

        version false
    }
}
