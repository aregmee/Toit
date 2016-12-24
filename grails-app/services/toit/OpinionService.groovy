package toit

import grails.transaction.Transactional

@Transactional
class OpinionService {

    def getUserOpinionFeed(ExtendedUser user) {

        def opinions = Opinion.findAllByUserInList(Follow.findAllByFollower(user).following)

        def opinionsOfThisUser = Opinion.findAllByUser(user)

        return opinionsOfThisUser + opinions
    }

    def getOpinionsByTag(Tag tag, char type){

        def opinions = Opinion.findAllByTagAndOpinionIlike(tag, "%$type%")

        return opinions
    }
}
