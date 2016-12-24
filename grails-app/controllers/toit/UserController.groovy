package toit

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

class UserController {

    def springSecurityService
    @Secured('permitAll')
    def register() {}

    @Secured('permitAll')
    def save() {

        println params
        ExtendedUser user = new ExtendedUser(params)

        if(!user.save(flush: true, failOnError: true))
            flash.message = "Could not register. Please try again."
        else {
            Role role = Role.findByAuthority('ROLE_USER')
            UserRole.create user, role, true
            flash.message = "User successfully registered. Try logging in."
        }

        chain(action: 'uploadPhoto')
    }

    @Secured('ROLE_USER')
    def uploadPhoto(){

        if(ExtendedUser.findByUsername(springSecurityService.principal.username).pp){
           chain(controller: 'opinion', action: 'opinionFeed')
        }
    }

    @Secured('ROLE_USER')
    def users(){

        def users
        if(params.key){
            users = ExtendedUser.where {

                projections{

                    like('firstName', params.key + '%')
                }
            } - ExtendedUser.findByUsername(springSecurityService.principal.username)
        }
        [users: users]
    }

    @Secured('ROLE_USER')
    def follow(){

        if(params.userToFollow){

            def userToFollow = ExtendedUser.findById(params.userToFollow as Long)
            def follower = ExtendedUser.findByUsername(springSecurityService.principal.username)
            if(!Follow.findByFollowerAndFollowing(follower,userToFollow)) {
                Follow follow = new Follow(follower:follower, following: userToFollow)
                follow.save(flush: true, failOnError: true)
            }
            chain(controller: 'opinion', action: 'opinionFeed')
        }
    }

    @Secured('permitAll')
    def uploadProfilePic(){

        def okcontents = ['image/png', 'image/jpeg', 'image/gif']

        CommonsMultipartFile f = request.getFile('pp')
        if(f.size > 200000){

            flash.message = "File size must be less than 200KB"
        }else if(f.size == 0){
            flash.message = "Please select a file!!"
        }else {
            if (!okcontents.contains(f.getContentType())) {
                flash.message = "File must be one of: ${okcontents}"
            }

            if (f != null) {
                flash.message = 'Your file has been uploaded'

                def extendedUser = ExtendedUser.findById(params.userId as Long)
                extendedUser.pp = f.bytes

                extendedUser.save(flush: true, failOnError: true)
                println "upload successful"
                flash.message = "Profile Picture uploaded successfully"
            } else {
                flash.message = 'File is empty!!. Please upload a new file.'
            }
        }
        chain(controller: 'opinion', action: 'opinionFeed')
    }

    @Secured('ROLE_USER')
    def avatar_image() {
        def extendedUser = ExtendedUser.findById(params.id as Long)
        if (!extendedUser || !extendedUser.pp) {
            response.sendError(404)
            return
        }
        //response.contentType = 'image/jpeg'
        response.contentLength = extendedUser.pp.size()
        OutputStream out = response.outputStream
        out.write(extendedUser.pp)
        out.close()
    }
}
