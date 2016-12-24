package toit

class Follow {

    ExtendedUser follower
    ExtendedUser following

    static constraints = {

        follower nullable: false
        following nullable: false
    }
}
