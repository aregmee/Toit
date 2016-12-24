<%--
  Created by IntelliJ IDEA.
  User: asimsangram
  Date: 12/31/15
  Time: 10:28 PM
--%>

<%@ page import="toit.Agree; toit.Disagree; toit.ExtendedUser" contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Opinion Feed</title>
        <g:javascript>
            function setAgree(opinionId){

                var data = "opinionId=" + opinionId + "&type=agree";
                jQuery.ajax({
                    type: 'post',
                    data: data,
                    url: '<g:createLink controller="opinion" action="saveSupport" />',
                    success: function (html) {

                        alert('success');
                    }
                });
            }
            function setDisAgree(opinionId){

                var data = "opinionId=" + opinionId + "&type=disagree";
                jQuery.ajax({
                    type: 'post',
                    data: data,
                    url: '<g:createLink controller="opinion" action="saveSupport" />',
                    success: function (html) {

                        alert('success');
                    }
                });
            }
        </g:javascript>
    </head>

    <body>
        <g:form controller="opinion" action="save" autocomplete="off">
            <div class="col s10 m8 offset-m2 l6 offset-l3">
                <div class="card-panel grey lighten-5 z-depth-1">
                    <div class="row valign-wrapper">
                        <div class="col s2">
                            <img src="${createLink(controller:'user', action:'avatar_image', id:ExtendedUser.findByUsername(sec.username()).id)}" class="ui small circular image"/>
                        </div>
                        <div class="col s10">
                            <span class="black-text">
                                <div class="input-field col s10">
                                    <textarea id="textarea1" class="materialize-textarea" name="opinion" length="130"></textarea>
                                    <label for="textarea1">New Opinion</label>
                                </div>
                            </span>
                            <button class="post-button btn waves-effect waves-light green accent-3" type="submit" name="action">
                                Post
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </g:form>
        <g:each in="${opinions}" var="opinion" status="i">
            <div class="opinion-card ui card">
                <div class="opinion-comment ui comments">
                    <div class="comment">
                        <a class="avatar">
                            <img src="${createLink(controller:'user', action:'avatar_image', id:opinion.user.id)}" class="ui small circular image"/>
                        </a>
                        <div class="content">
                            <a class="author">${opinion.user.firstName + " " + opinion.user.lastName}</a>
                            <div class="metadata">
                                <g:hiddenField name="opinionDate" id="opinionDate${i}" value="${opinion.date}"/>
                                <span class="date" id = "time-since${i}"></span>
                            </div>
                            <div class="text">
                                <p>${opinions.get(i).opinion}</p>
                            </div>
                            <div class="actions">
                                <g:if test="${Agree.findByOpinionAndUser(opinion, ExtendedUser.findByUsername(sec.username()))}">
                                    <a class="reply" style="color: black;" onclick="setAgree(${opinions.get(i).id});">+Agree(${opinions.get(i).agreeCount > 0 ?opinions.get(i).agreeCount: '0'})</a>
                                </g:if>
                                <g:else>
                                    <a class="reply" onclick="setAgree(${opinions.get(i).id});">+Agree(${opinions.get(i).agreeCount > 0 ?opinions.get(i).agreeCount: '0'})</a>
                                </g:else>
                                <g:if test="${Disagree.findByOpinionAndUser(opinion, ExtendedUser.findByUsername(sec.username()))}">
                                    <a class="reply" style="color: black;"  onclick="setDisAgree(${opinions.get(i).id});">-Disgree(${opinions.get(i).disagreeCount > 0 ?opinions.get(i).disagreeCount: '0'})</a>
                                </g:if>
                                <g:else>
                                    <a class="reply" onclick="setDisAgree(${opinions.get(i).id});">-Disgree(${opinions.get(i).disagreeCount > 0 ?opinions.get(i).disagreeCount: '0'})</a>
                                </g:else>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>
    </body>
</html>