package toit

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured('ROLE_USER')
class OpinionController {

    def opinionService
    def springSecurityService

    def opinionFeed() {

        [opinions: opinionService.getUserOpinionFeed(ExtendedUser.findByUsername(springSecurityService.principal.username as String))]
    }

    def createOpinion(){

    }

    def save(){

        String stringOpinion = params.opinion as String
        String tag;
        boolean plus = false;

        if(stringOpinion.indexOf('+') != -1) {
            tag = getTag('+', stringOpinion)
            plus = true;
        }else if(stringOpinion.indexOf('-') != -1){
            tag = getTag('-', stringOpinion)
        }

        Tag tagOb = Tag.findByName(tag);
        if(!tagOb) {
            if(plus)
                tagOb = new Tag(name: tag, plusCount: 1)
            else
                tagOb = new Tag(name: tag, minusCount: 1)
            tagOb.save(flush: true, failOnError: true)
        }else{

            if(plus)
                tagOb.plusCount++
            else
                tagOb.minusCount++

            tagOb.save(flush: true, failOnError: true)
        }
        Opinion opinion = new Opinion(opinion: stringOpinion,
                user: springSecurityService.currentUser as ExtendedUser,
                date: new Date(),
                tag: tagOb)

        opinion.save(flush: true, failOnError: true)
        chain(action: 'opinionFeed')
    }

    @Transactional
    def getTag(String type, String opinion){

        int i;
        char[] opinionCharArray = opinion.toLowerCase().toCharArray();
        for(i = opinion.indexOf(type) + 1; i < opinion.length() && opinion[i] != ' '; i++){

            char c = opinionCharArray[i];
            if(c < 97 || c > 122)
                break;
        }
        return opinion.substring(opinion.indexOf(type) + 1, i)
    }

    @Transactional
    def saveSupport(){

        def type = params.type
        def opinion = Opinion.findById(params.opinionId as Long)
        def user = ExtendedUser.findByUsername(springSecurityService.principal.username)
        if(type && opinion){

            if(type == 'agree' && !Agree.findByOpinionAndUser(opinion, user)){

                def disagree = Disagree.findByOpinionAndUser(opinion, user)
                if(disagree){

                    opinion.disagreeCount--
                    disagree.delete(flush: true)
                }
                Agree agree = new Agree(opinion: opinion, user: user)
                agree.save(flush: true, failOnError: true)
                opinion.agreeCount++
                opinion.save(flush: true, failOnError: true)
            }else if(type == 'disagree' && !Disagree.findByOpinionAndUser(opinion, user)){

                def agree = Agree.findByOpinionAndUser(opinion, user)
                if(agree){

                    opinion.agreeCount--
                    agree.delete(flush: true)
                }
                Disagree disagree = new Disagree(opinion: opinion, user: user)
                disagree.save(flush: true, failOnError: true)
                opinion.disagreeCount++
                opinion.save(flush: true, failOnError: true)
            }
        }
    }

    def opinions(){

        def fullTag = params.id as String

        if(fullTag){
            char type = fullTag.charAt(0) == ' ' ? '+': '-';

            def opinions = opinionService.getOpinionsByTag(Tag.findByName(fullTag.substring(1, fullTag.length())), type)
            [opinions: opinions, type: fullTag.charAt(0)]
        }
    }
}
