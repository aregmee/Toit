<%--
  Created by IntelliJ IDEA.
  User: asimsangram
  Date: 1/4/16
  Time: 1:43 AM
--%>

<%@ page import="toit.Agree; toit.Disagree; toit.ExtendedUser" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Opinions</title>
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
<g:set var="tagHeader" value="${params.id}"/>
<h2>Opinions with <g:if test="${tagHeader.contains('-')}">${tagHeader}</g:if><g:else>+${tagHeader}</g:else></h2>
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