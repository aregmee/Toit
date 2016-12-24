import toit.ExtendedUser
import toit.Role
import toit.User
import toit.UserRole

class BootStrap {

    def init = { servletContext ->
        ExtendedUser user1 = ExtendedUser.findByUsername('ram');
        ExtendedUser user2 = ExtendedUser.findByUsername('shyam');
        Role userRole = Role.findByAuthority('ROLE_USER');

        if(!userRole) {
            userRole = new Role('ROLE_USER')
            userRole.save(failOnError: true)
        }

        if(!user1){

            user1 = new ExtendedUser(username:'ram',password:'ram', firstName: 'Ram', lastName: 'Dahal', gender: 'Male', email:'ram.dahal@gmail.com')
            user1.save(failOnError: true)
        }

        if(!user2){

            user2 = new ExtendedUser(username:'shyam',password:'shyam', firstName: 'Shyam', lastName: 'Rai', gender: 'Female', email: 'shyam.rai@gmail.com')
            user2.save(failOnError: true)
        }

        if(!UserRole.findByRoleAndUser(userRole, user1))
            UserRole.create(user1,userRole)
        if(!UserRole.findByRoleAndUser(userRole, user2))
            UserRole.create(user2,userRole)
    }
    def destroy = {
    }
}
