package toit

class ExtendedUser extends User{

    String firstName
    String lastName
    String email
    String bio
    String gender
    byte[] pp

    ExtendedUser(String username, String password, String firstName, String lastName, String gender) {
        super(username, password)
        this.firstName = firstName
        this.lastName = lastName
        this.gender = gender
    }

    static constraints = {

        firstName nullable: false, blank: false
        lastName nullable: false, blank: false
        email nullable: false, blank: false, email: true
        bio nullable: true, blank: true
        gender nullable: false, blank: false, inList: ['Male', 'Female']
        pp nullable: true, maxSize: 200000
    }
    static mapping = {

        version false
    }
}
